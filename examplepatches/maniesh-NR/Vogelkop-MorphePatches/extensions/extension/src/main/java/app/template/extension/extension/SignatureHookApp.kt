package app.template.extension.extension

import android.app.Application
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Build
import android.os.Parcel
import android.os.Parcelable
import android.util.Base64
import java.lang.reflect.Field
import java.util.Map

/**
 * Swaps the re-signed APK's certificate back to the original one at the
 * `PackageInfo.CREATOR` parcel layer, so every signature read inside the app
 * (PackageManager API, direct Parcel unpacking, SDK integrity helpers) sees the
 * ORIGINAL vendor certificate instead of the Morphe signing key.
 *
 * Kotlin port of rushiranpise/morphe-patches `SignatureHookApp.java`
 * (GPL-3.0), ported from jkennethcarino/adobo, originally based on
 * https://github.com/L-JINBIN/ApkSignatureKillerEx. Instead of the
 * HiddenApiBypass dependency, hidden-API exemptions are attempted through the
 * classic VMRuntime meta-reflection trick and are silently skipped when the
 * platform blocks them; the core CREATOR swap only touches public API.
 *
 * The static initializer carries two placeholder constants that the patch
 * replaces at patch time:
 *  - `<package-name>` -> the app's real package name
 *  - `<signature>`    -> Base64 DER of the ORIGINAL signing certificate
 *
 * Written to compile without any kotlin-stdlib dependency (no lambdas, no
 * Kotlin collections, assertions disabled via -Xno-*-assertions) so the
 * extension dex only references android framework + JDK classes.
 */
class SignatureHookApp : Application() {

    companion object {
        init {
            val packageName = "<package-name>"
            val signature = "<signature>"
            killPackageManager(packageName, signature)
        }

        private fun killPackageManager(packageName: String, signature: String) {
            try {
                val fakeSignature = Signature(Base64.decode(signature, Base64.DEFAULT))

                val creator: Parcelable.Creator<PackageInfo> =
                    getPackageInfoCreator(packageName, fakeSignature)

                val packageInfoField = findField(PackageInfo::class.java, "CREATOR")
                packageInfoField.set(null, creator)

                tryExemptHiddenApi()
                clearPackageInfoCache()
                clearParcelCreators()
            } catch (e: Exception) {
                throw RuntimeException("Failed to modify package manager", e)
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
                override fun createFromParcel(source: Parcel): PackageInfo {
                    val created: PackageInfo? = originalCreator.createFromParcel(source)
                    val packageInfo: PackageInfo = created ?: PackageInfo()

                    val pkg = packageInfo.packageName
                    if (pkg != null && pkg.equals(packageName)) {
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

                    return packageInfo
                }

                override fun newArray(size: Int): Array<PackageInfo?> {
                    return arrayOfNulls<PackageInfo>(size)
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

        private fun clearParcelCreators() {
            try {
                val mCreatorsAny = findField(Parcel::class.java, "mCreators").get(null)
                if (mCreatorsAny != null) {
                    val mCreators = mCreatorsAny as Map<*, *>
                    mCreators.clear()
                }
            } catch (e: Exception) {
                // ignore
            }

            try {
                val sPairedAny = findField(Parcel::class.java, "sPairedCreators").get(null)
                if (sPairedAny != null) {
                    val sPairedCreators = sPairedAny as Map<*, *>
                    sPairedCreators.clear()
                }
            } catch (e: Exception) {
                // ignore
            }
        }
    }
}
