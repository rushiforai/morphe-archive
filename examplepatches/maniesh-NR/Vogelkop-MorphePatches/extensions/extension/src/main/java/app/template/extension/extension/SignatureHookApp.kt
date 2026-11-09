package app.template.extension.extension

import android.app.Application
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.content.pm.SigningInfo
import android.os.Build
import android.os.Parcel
import android.os.Parcelable
import android.util.Base64
import android.util.Log
import java.lang.reflect.Field
import java.security.MessageDigest
import java.security.NoSuchAlgorithmException
import java.util.Arrays
import java.util.Collections
import java.util.WeakHashMap

/**
 * Presents the ORIGINAL Opera signing certificate to the app after Morphe
 * re-signs it, through two independent layers:
 *
 *  **Layer 1 - call-site helpers (primary, deterministic).** The patch
 *  rewrites every `PackageManager.getPackageInfo(...)`,
 *  `PackageManager.hasSigningCertificate(...)`,
 *  `SigningInfo.getApkContentsSigners()`,
 *  `SigningInfo.getSigningCertificateHistory()` and
 *  `SigningInfo.hasMultipleSigners()` call site in the app's own bytecode to
 *  route through the static helpers below, which post-process the result and
 *  swap in the original signature. No reflection, no final-field writes, no
 *  hidden APIs - the call sites keep their exact registers and exception
 *  behavior. Ported from the Morphe universal "Spoof signature" runtime
 *  (kveld9/morphe-patches `SpoofSignaturePatch.java`, MorpheApp/morphe-patches
 *  PR #2470 lineage; ApkSignatureKillerEx ancestry), adapted to the
 *  baked Base64 certificate used by this extension.
 *
 *  **Layer 2 - PackageInfo.CREATOR parcel proxy (secondary, belt and
 *  braces).** The companion initializer swaps `PackageInfo.CREATOR` with a
 *  proxy that rewrites the signature fields of any PackageInfo parcel of this
 *  package, covering reads that do not go through a rewritten call site.
 *  Kotlin port of rushiranpise/morphe-patches `SignatureHookApp.java`
 *  (GPL-3.0, jkennethcarino/adobo, L-JINBIN/ApkSignatureKillerEx lineage).
 *
 * v1.2.2 hardening - nothing may escape the static initializer (every failure,
 * including Errors, is caught and logged; a spoof that cannot be installed
 * leaves a *working* app), and the FINAL bit of `PackageInfo.CREATOR` is
 * cleared through the hidden `Field#accessFlags` field after requesting
 * hidden-API exemptions, with a `sun.misc.Unsafe` static write as fallback.
 *
 * v1.2.3 hardening - the CREATOR proxy body is wrapped so ANY throwable inside
 * the rewriting falls back to returning the untouched PackageInfo instead of
 * crashing the unmarshalling binder thread; the global parcel-creator caches
 * are no longer cleared wholesale (a racy operation) - only the cached
 * `android.content.pm.PackageInfo` creator entries are evicted; and Layer 1
 * above was added so the spoof no longer depends on the fragile CREATOR swap
 * at all.
 *
 * The companion initializer carries two placeholder constants that the patch
 * replaces at patch time:
 *  - `<package-name>` -> the app's real package name
 *  - `<signature>`    -> Base64 DER of the ORIGINAL signing certificate
 *
 * Written to compile without any kotlin-stdlib dependency (no lambdas, no
 * Kotlin collections, no `==` on reference types, no string concatenation
 * with non-String operands, assertions disabled via -Xno-*-assertions) so the
 * extension dex only references android framework + JDK classes. All mutable
 * companion state is declared BEFORE the init block (Kotlin runs property
 * initializers and init blocks in declaration order, so state set by
 * [install] must not be overwritten by later property initializers).
 */
class SignatureHookApp : Application() {

    companion object {
        // ---- state (declared before the init block; see class comment) -----

        /**
         * Result of the hook installation, written during the companion
         * initializer (before any app code) and read at runtime by
         * `StartupDiag` through reflection: "not-run", "ok(creator-proxy)",
         * "ok(no-creator-proxy)" or "failed:<throwable-class>".
         */
        @JvmField
        var installState: String = "not-run"

        private var ownPackageName: String? = null
        private var ownSignatureBase64: String? = null
        private var originalSignatures: Array<Signature>? = null
        private val stateLock = Any()

        /**
         * SigningInfo objects we have already seen for our own package; weak
         * so remembering them never leaks a PackageInfo.
         */
        private val ownSigningInfos: MutableSet<Any> =
            Collections.synchronizedSet(Collections.newSetFromMap(WeakHashMap<Any, Boolean>()))

        init {
            val packageName = "<package-name>"
            val signature = "<signature>"
            install(packageName, signature)
        }

        private fun install(packageName: String, signature: String) {
            ownPackageName = packageName
            ownSignatureBase64 = signature
            killPackageManager(packageName, signature)
        }

        // =====================================================================
        // Layer 1: call-site helpers.
        // Invoked from call sites the patch rewrote from
        // `invoke-virtual ... PackageManager->getPackageInfo(...)` (and the
        // SigningInfo readers) into `invoke-static` calls on this class. The
        // receiver register becomes the first parameter, so registers and
        // exception behavior at the call site are unchanged. Calling any of
        // these triggers this class's initialization first, which also
        // installs the Layer 2 CREATOR proxy.
        // =====================================================================

        @JvmStatic
        fun getPackageInfo(pm: PackageManager, packageName: String?, flags: Int): PackageInfo? {
            // The original call site passed the arguments straight to the
            // framework method; a null package name was a NullPointerException
            // there and stays one here.
            val name = packageName ?: throw NullPointerException("packageName")
            @Suppress("DEPRECATION")
            val info = pm.getPackageInfo(name, flags)
            return processPackageInfo(info)
        }

        @JvmStatic
        @android.annotation.TargetApi(33)
        fun getPackageInfo(
            pm: PackageManager,
            packageName: String?,
            flags: PackageManager.PackageInfoFlags,
        ): PackageInfo? {
            val name = packageName ?: throw NullPointerException("packageName")
            if (Build.VERSION.SDK_INT >= 33) {
                val info = pm.getPackageInfo(name, flags)
                return processPackageInfo(info)
            }
            @Suppress("DEPRECATION")
            return processPackageInfo(pm.getPackageInfo(name, 0))
        }

        @JvmStatic
        @android.annotation.TargetApi(28)
        fun hasSigningCertificate(
            pm: PackageManager,
            packageName: String?,
            certificate: ByteArray?,
            type: Int,
        ): Boolean {
            if (isOwnPackage(packageName)) {
                return checkHasSigningCertificate(certificate, type)
            }
            val name = packageName ?: throw NullPointerException("packageName")
            val cert = certificate ?: throw NullPointerException("certificate")
            return if (Build.VERSION.SDK_INT >= 28) {
                pm.hasSigningCertificate(name, cert, type)
            } else {
                false
            }
        }

        @JvmStatic
        @android.annotation.TargetApi(28)
        fun getApkContentsSigners(signingInfo: SigningInfo?): Array<Signature>? {
            if (signingInfo == null) {
                return null
            }
            if (ownSigningInfos.contains(signingInfo)) {
                return getOriginalSignatures().clone()
            }
            return signingInfo.getApkContentsSigners()
        }

        @JvmStatic
        @android.annotation.TargetApi(28)
        fun getSigningCertificateHistory(signingInfo: SigningInfo?): Array<Signature>? {
            if (signingInfo == null) {
                return null
            }
            if (ownSigningInfos.contains(signingInfo)) {
                return getOriginalSignatures().clone()
            }
            return signingInfo.getSigningCertificateHistory()
        }

        @JvmStatic
        @android.annotation.TargetApi(28)
        fun hasMultipleSigners(signingInfo: SigningInfo?): Boolean {
            if (signingInfo == null) {
                return false
            }
            if (ownSigningInfos.contains(signingInfo)) {
                return getOriginalSignatures().size > 1
            }
            return signingInfo.hasMultipleSigners()
        }

        /** Swaps in the original signature when the info describes this app. */
        private fun processPackageInfo(info: PackageInfo?): PackageInfo? {
            if (info == null) {
                return null
            }
            if (!isOwnPackage(info.packageName)) {
                return info
            }

            // Replace the whole array; never extend a request that did not
            // ask for signatures (signatures stays null when it was null).
            if (info.signatures != null) {
                info.signatures = getOriginalSignatures().clone()
            }

            val signingInfo = info.signingInfo
            if (Build.VERSION.SDK_INT >= 28 && signingInfo != null) {
                ownSigningInfos.add(signingInfo)
            }
            return info
        }

        private fun checkHasSigningCertificate(certificate: ByteArray?, type: Int): Boolean {
            if (certificate == null) {
                return false
            }
            val sigs = getOriginalSignatures()
            var i = 0
            while (i < sigs.size) {
                if (matchesCertificate(sigs[i], certificate, type)) {
                    return true
                }
                i++
            }
            return false
        }

        private fun matchesCertificate(sig: Signature, certificate: ByteArray, type: Int): Boolean {
            val raw = sig.toByteArray()
            if (type == 0) {
                // PackageManager.CERT_INPUT_RAW_X509
                return Arrays.equals(raw, certificate)
            }
            if (type == 1) {
                // PackageManager.CERT_INPUT_SHA256
                val sha256 = sha256Digest(raw)
                return sha256 != null && Arrays.equals(sha256, certificate)
            }
            return false
        }

        private fun sha256Digest(data: ByteArray): ByteArray? {
            return try {
                val md = MessageDigest.getInstance("SHA-256")
                md.digest(data)
            } catch (e: NoSuchAlgorithmException) {
                null
            }
        }

        private fun isOwnPackage(packageName: String?): Boolean {
            if (packageName == null) {
                return false
            }
            return packageName.equals(ownPackageName)
        }

        private fun getOriginalSignatures(): Array<Signature> {
            val cached = originalSignatures
            if (cached != null) {
                return cached
            }
            synchronized(stateLock) {
                val again = originalSignatures
                if (again != null) {
                    return again
                }
                val base64 = ownSignatureBase64
                val built: Array<Signature>
                if (base64 == null || base64.isEmpty()) {
                    built = arrayOf()
                } else {
                    built = arrayOf(Signature(Base64.decode(base64, Base64.DEFAULT)))
                }
                originalSignatures = built
                return built
            }
        }

        // =====================================================================
        // Layer 2: PackageInfo.CREATOR parcel proxy.
        // =====================================================================

        // This runs from the class initializer (the re-parented Application
        // subclasses trigger it before any app code). A throwable escaping
        // here is an ExceptionInInitializerError that kills the app at
        // startup. Therefore: catch Throwable, log, continue - never throw.
        private fun killPackageManager(packageName: String, signature: String) {
            try {
                val fakeSignature = Signature(Base64.decode(signature, Base64.DEFAULT))

                val creator: Parcelable.Creator<PackageInfo> =
                    getPackageInfoCreator(packageName, fakeSignature)

                val proxyInstalled = installCreator(creator)
                if (!proxyInstalled) {
                    Log.w(
                        "VogelkopSpoof",
                        "PackageInfo.CREATOR could not be replaced on this Android build; " +
                            "relying on the redirected call sites",
                    )
                }

                clearPackageInfoCache()
                clearParcelCreators()
                installState = if (proxyInstalled) "ok(creator-proxy)" else "ok(no-creator-proxy)"
            } catch (t: Throwable) {
                installState = "failed:" + t.javaClass.getName()
                Log.w("VogelkopSpoof", "Signature spoof fallback layer failed; call-site hooks remain active", t)
            }
        }

        /**
         * Installs the CREATOR proxy, preferring the techniques that work on
         * modern Android:
         *
         *  A. reflection, after clearing the FINAL bit via the hidden
         *     `Field#accessFlags` field (hidden-API, so exemptions are
         *     requested first),
         *  B. `sun.misc.Unsafe` writes the static field directly (no final
         *     check is involved in an Unsafe write),
         *  C. a plain set - some ART builds allow final writes outright.
         *
         * Returns true only when the proxy is actually installed.
         */
        private fun installCreator(creator: Parcelable.Creator<PackageInfo>): Boolean {
            // Best-effort hidden-API exemptions FIRST, so the routes below can
            // reach greylisted members (Field#accessFlags, sun.misc.Unsafe) on
            // Android 9+. Silently skipped when the platform blocks it.
            tryExemptHiddenApi()

            if (installCreatorViaReflection(creator)) {
                return true
            }
            if (installCreatorViaUnsafe(creator)) {
                return true
            }
            return try {
                findField(PackageInfo::class.java, "CREATOR").set(null, creator)
                true
            } catch (t: Throwable) {
                Log.w("VogelkopSpoof", "All CREATOR swap routes failed", t)
                false
            }
        }

        private fun installCreatorViaReflection(creator: Parcelable.Creator<PackageInfo>): Boolean {
            return try {
                val field = findField(PackageInfo::class.java, "CREATOR")
                clearFinalBit(field)
                field.set(null, creator)
                true
            } catch (t: Throwable) {
                Log.i("VogelkopSpoof", "CREATOR swap: reflection route unavailable", t)
                false
            }
        }

        private fun installCreatorViaUnsafe(creator: Parcelable.Creator<PackageInfo>): Boolean {
            return try {
                val unsafeClass = Class.forName("sun.misc.Unsafe")
                val unsafe = findField(unsafeClass, "theUnsafe").get(null)
                if (unsafe == null) {
                    return false
                }
                val field = findField(PackageInfo::class.java, "CREATOR")
                val base = unsafeClass
                    .getMethod("staticFieldBase", Field::class.java)
                    .invoke(unsafe, field)
                val offset = unsafeClass
                    .getMethod("staticFieldOffset", Field::class.java)
                    .invoke(unsafe, field)
                unsafeClass
                    .getMethod("putObject", Any::class.java, java.lang.Long.TYPE, Any::class.java)
                    .invoke(unsafe, base, offset, creator)
                true
            } catch (t: Throwable) {
                Log.i("VogelkopSpoof", "CREATOR swap: sun.misc.Unsafe route unavailable", t)
                false
            }
        }

        /**
         * Android's Field implementation caches its flags in the hidden
         * `accessFlags` field (the desktop JDK equivalent is `modifiers`);
         * clearing the FINAL bit there is what lets `Field.set()` through.
         * Best effort - when the field is unreachable, the Unsafe/plain-set
         * routes still apply.
         */
        private fun clearFinalBit(field: Field) {
            try {
                val accessFlags = findField(Field::class.java, "accessFlags")
                // -17 == ~Modifier.FINAL (~0x0010), i.e. all flags but FINAL
                accessFlags.setInt(field, accessFlags.getInt(field) and -17)
            } catch (t: Throwable) {
                // leave the FINAL bit set
            }
        }

        /**
         * Best-effort replacement for HiddenApiBypass.addHiddenApiExemptions:
         * reaches dalvik.system.VMRuntime.setHiddenApiExemptions through the
         * meta-reflection hole (reflecting on Class.getDeclaredMethod itself).
         * Wrapped in catch-all - every failure just means the belt-and-braces
         * cache clearing below stays disabled; the CREATOR swap is unaffected.
         */
        private fun tryExemptHiddenApi() {
            try {
                val classArrayClass: Class<*> = arrayOf<Class<*>>().javaClass
                val getDeclaredMethod = Class::class.java.getDeclaredMethod(
                    "getDeclaredMethod",
                    String::class.java,
                    classArrayClass,
                )
                getDeclaredMethod.isAccessible = true
                val runtimeClass = Class.forName("dalvik.system.VMRuntime")
                val getRuntimeAny = getDeclaredMethod.invoke(
                    runtimeClass,
                    "getRuntime",
                    arrayOf<Class<*>>(),
                )
                if (getRuntimeAny == null) {
                    return
                }
                val getRuntime = getRuntimeAny as java.lang.reflect.Method
                val runtime = getRuntime.invoke(null)
                if (runtime != null) {
                    val stringArrayClass: Class<*> = arrayOf<String>().javaClass
                    val setExemptionsAny = getDeclaredMethod.invoke(
                        runtime.javaClass,
                        "setHiddenApiExemptions",
                        arrayOf<Class<*>>(stringArrayClass),
                    )
                    if (setExemptionsAny != null) {
                        val setExemptions = setExemptionsAny as java.lang.reflect.Method
                        setExemptions.isAccessible = true
                        setExemptions.invoke(runtime, arrayOf("L"))
                    }
                }
            } catch (e: Throwable) {
                // ignore - platform blocked meta-reflection
            }
        }

        private fun findField(clazz: Class<*>, fieldName: String): Field {
            var current: Class<*>? = clazz
            while (current != null && !current.equals(Object::class.java)) {
                try {
                    val field = current.getDeclaredField(fieldName)
                    field.setAccessible(true)
                    return field
                } catch (e: NoSuchFieldException) {
                    current = current.superclass
                }
            }
            throw NoSuchFieldException(fieldName)
        }

        private fun getPackageInfoCreator(
            packageName: String,
            fakeSignature: Signature,
        ): Parcelable.Creator<PackageInfo> {
            val originalCreator: Parcelable.Creator<PackageInfo> = PackageInfo.CREATOR
            return object : Parcelable.Creator<PackageInfo> {
                override fun createFromParcel(source: Parcel): PackageInfo? {
                    val created: PackageInfo? = originalCreator.createFromParcel(source)
                    if (created == null) {
                        return null
                    }
                    // v1.2.3: this proxy intercepts EVERY PackageInfo parcel
                    // unmarshalled in the process, on binder threads. Any
                    // failure inside the rewriting must degrade to returning
                    // the untouched parcel, never propagate into the
                    // transaction that is unmarshalling.
                    return try {
                        if (packageName.equals(created.packageName)) {
                            rewriteSignaturesInPlace(created, fakeSignature)
                        }
                        created
                    } catch (t: Throwable) {
                        created
                    }
                }

                override fun newArray(size: Int): Array<PackageInfo?> {
                    return arrayOfNulls<PackageInfo>(size)
                }
            }
        }

        /**
         * In-place variant used by the parcel proxy: replaces the first
         * element of the existing signature arrays (the internal arrays
         * returned by SigningInfo are NOT copies on current AOSP), so even
         * call sites that were not rewritten (e.g. registers > v15) observe
         * the original certificate.
         */
        private fun rewriteSignaturesInPlace(packageInfo: PackageInfo, fakeSignature: Signature) {
            val signatures = packageInfo.signatures
            if (signatures != null && signatures.size > 0) {
                signatures[0] = fakeSignature
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                val signingInfo = packageInfo.signingInfo
                if (signingInfo != null) {
                    val signaturesArray = signingInfo.getApkContentsSigners()
                    if (signaturesArray != null && signaturesArray.size > 0) {
                        signaturesArray[0] = fakeSignature
                    }

                    val historyArray = signingInfo.getSigningCertificateHistory()
                    if (historyArray != null && historyArray.size > 0) {
                        var i = 0
                        while (i < historyArray.size) {
                            historyArray[i] = fakeSignature
                            i++
                        }
                    }
                }
            }
        }

        private fun clearPackageInfoCache() {
            try {
                val packageCacheField = findField(PackageManager::class.java, "sPackageInfoCache")
                val cache = packageCacheField.get(null)
                if (cache != null) {
                    cache.javaClass.getMethod("clear").invoke(cache)
                }
            } catch (e: Exception) {
                // ignore
            }
        }

        /**
         * Evicts only the cached CREATOR entries for
         * `android.content.pm.PackageInfo` from Parcel's creator caches.
         *
         * v1.2.2 and the upstream ApkSignatureKillerEx called `clear()` on the
         * whole map; those caches are plain ArrayMap/HashMap instances shared
         * with binder threads, so emptying thousands of entries widened the
         * concurrent-modification window for no benefit. Removing just the
         * PackageInfo entries keeps the window minimal while still making the
         * swapped CREATOR visible to future lookups.
         */
        private fun clearParcelCreators() {
            evictPackageInfoCreators(findField(Parcel::class.java, "mCreators").get(null))
            evictPackageInfoCreators(findField(Parcel::class.java, "sPairedCreators").get(null))
        }

        private fun evictPackageInfoCreators(creatorsAny: Any?) {
            if (creatorsAny == null) {
                return
            }
            try {
                // Reflection instead of casting to java.util.Map: Kotlin maps
                // java.util.Map to kotlin.collections.Map, where the read-only
                // view has no remove(). Collect first, remove in a second
                // phase, so iteration and mutation never interleave.
                val entrySetAny = creatorsAny.javaClass.getMethod("entrySet").invoke(creatorsAny)
                val entries = entrySetAny as? Iterable<*> ?: return
                val toRemove = ArrayList<Any>()
                for (entryAny in entries) {
                    val entry = entryAny as? Map.Entry<*, *> ?: continue
                    val key = entry.key ?: continue
                    if (isPackageInfoCreatorKey(key)) {
                        toRemove.add(key)
                    }
                }
                if (toRemove.size == 0) {
                    return
                }
                val removeMethod = creatorsAny.javaClass.getMethod("remove", Any::class.java)
                var i = 0
                while (i < toRemove.size) {
                    removeMethod.invoke(creatorsAny, toRemove[i])
                    i++
                }
            } catch (t: Throwable) {
                // a failure during eviction is survivable: the swapped
                // CREATOR simply is not used for already-cached lookups, and
                // the redirected call sites are unaffected.
            }
        }

        /** Keys of Parcel's creator caches are (ClassLoader, className) pairs. */
        private fun isPackageInfoCreatorKey(key: Any): Boolean {
            return try {
                val second = key.javaClass.getField("second").get(key)
                "android.content.pm.PackageInfo".equals(second)
            } catch (t: Throwable) {
                false
            }
        }
    }
}
