import java.util.*;
import java.util.zip.ZipFile;
import java.security.MessageDigest;
import com.android.apksig.ApkVerifier;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.reandroid.arsc.chunk.xml.*;

/** Run with VerifyPizzaRewardDex and Morphe CLI on the classpath.
 * Arguments: patched.apk original.apk [microg|stock]. No Google credentials.
 */
public class VerifyPizzaIntegrationDex extends VerifyPizzaRewardDex {
    static final String LICENSE = "Lcom/pairip/licensecheck/LicenseClient;";
    static final String SCREEN = "Lcom/pairip/licensecheck/LicenseActivity;";
    static final String GMS = "app.revanced.android.gms";
    static Map<String,String> gamesClients(Map<String,ClassDef> original) {
        var clients = new TreeMap<String,String>();
        for (var cls : original.values()) for (var m : cls.getMethods()) {
            if (!m.getName().equals("getStartServiceAction") || !m.getReturnType().equals(STRING) ||
                    !m.getParameterTypes().isEmpty() || m.getImplementation() == null) continue;
            for (var i : code(m)) if (i instanceof ReferenceInstruction r && r.getReference() instanceof StringReference s)
                for (var action : List.of("games.internal.connect.service.START", "games.service.START"))
                    if (s.getString().equals("com.google.android.gms." + action)) clients.put(cls.getType(), action);
        }
        check(clients.size() == 2 && new HashSet<>(clients.values()).size() == 2, "Original Games transport roles missing or ambiguous");
        return clients;
    }

    static void noEffect(Method m) {
        validateRegistersAndBranches(m);
        check(code(m).size() == 1 && code(m).get(0).getOpcode() == Opcode.RETURN_VOID &&
            m.getImplementation().getTryBlocks().isEmpty(), "Licensing side effect remains: " + key(m));
    }

    static String constant(Method m) {
        validateRegistersAndBranches(m);
        var c = code(m);
        check(c.size() == 2 && c.get(1).getOpcode() == Opcode.RETURN_OBJECT &&
            (c.get(0).getOpcode() == Opcode.CONST_STRING || c.get(0).getOpcode() == Opcode.CONST_STRING_JUMBO) &&
            ((OneRegisterInstruction)c.get(0)).getRegisterA() == ((OneRegisterInstruction)c.get(1)).getRegisterA(),
            "Not a constant string return: " + key(m));
        return ((StringReference)((ReferenceInstruction)c.get(0)).getReference()).getString();
    }

    static void transportOnlyFalse(Method m) {
        validateRegistersAndBranches(m);
        var c = code(m);
        check(c.size() == 2 && c.get(0).getOpcode() == Opcode.CONST_4 &&
            ((NarrowLiteralInstruction)c.get(0)).getNarrowLiteral() == 0 && c.get(1).getOpcode() == Opcode.RETURN &&
            ((OneRegisterInstruction)c.get(0)).getRegisterA() == ((OneRegisterInstruction)c.get(1)).getRegisterA(),
            "Wrong transport override: " + key(m));
    }

    static String attribute(ResXmlElement e, String name) {
        var a = e.searchAttributeByName(name);
        return a == null ? null : a.getValueAsString();
    }

    static Map<String,String> metadata(AndroidManifestBlock manifest) {
        Map<String,String> result = new HashMap<>();
        var it = manifest.getApplicationElement().getElements("meta-data");
        while (it.hasNext()) {
            var e = (ResXmlElement)it.next();
            result.put(attribute(e,"name"), attribute(e,"value"));
        }
        return result;
    }

    // APKM merge removes distribution/split packaging markers. They do not
    // describe the game's identity or authentication configuration. Allow only
    // their removal; a changed value is still a regression.
    static final Set<String> MERGED_PACKAGING_METADATA = Set.of(
        "com.android.stamp.source", "com.android.stamp.type",
        "com.android.vending.splits.required", "com.android.vending.splits",
        "com.android.vending.derived.apk.id");

    public static void main(String[] args) throws Exception {
        check((args.length >= 3 && args.length <= 6) && Set.of("microg","stock").contains(args[2]) &&
            (args.length < 5 || Set.of("hide-paid", "keep-paid").contains(args[4])) && (args.length < 6 || args[5].matches("[0-9a-f]{64}")),
            "Usage: VerifyPizzaIntegrationDex patched.apk original.apk microg|stock [profile-directory [hide-paid|keep-paid [reviewed-native-output-sha256]]]");
        boolean microg = args[2].equals("microg");
        boolean hidePaid = args.length >= 5 && args[4].equals("hide-paid");
        var patched = classes(args[0]);
        var original = classes(args[1]);
        boolean protectedInput = original.containsKey(LICENSE);
        var clients = gamesClients(original);
        var transportHierarchy = new HashSet<String>();
        var legacyPackages = new HashSet<String>();
        for (var entry : clients.entrySet()) {
            if (entry.getValue().equals("games.service.START")) legacyPackages.add(entry.getKey().substring(0, entry.getKey().lastIndexOf('/') + 1));
            String owner = entry.getKey();
            while (original.containsKey(owner) && transportHierarchy.add(owner)) owner = original.get(owner).getSuperclass();
        }
        Map<String, Method> sdkRestorations = new HashMap<>();
        if (args.length >= 4 && protectedInput) {
            for (ClassDef cls : classes(java.nio.file.Path.of(args[3], "sdk-receivers.dex").toString()).values())
                for (Method m : cls.getMethods()) sdkRestorations.put(key(m), m);
        }
        if (protectedInput) {
            List<Method> blocked = List.of(
                method(patched, LICENSE, "checkLicense", "V", "Landroid/content/Context;"),
                method(patched, LICENSE, "stopTrial", "V", "Landroid/content/Context;"),
                method(patched, LICENSE, "handleTrialEnd", "V"),
                method(patched, LICENSE, "initializeLicenseCheck", "V"),
                method(patched, LICENSE, "bindToLicensingService", "V", "Z"),
                method(patched, LICENSE, "processResponse", "V", "I", "Landroid/os/Bundle;"),
                method(patched, LICENSE, "scheduleRepeatedLicenseCheck", "V", "Lcom/pairip/licensecheck/RepeatedCheckMetadata;"),
                method(patched, LICENSE, "startPaywallActivity", "V", "Landroid/app/PendingIntent;"),
                method(patched, LICENSE, "startErrorDialogActivity", "V"),
                method(patched, LICENSE, "scheduleAppShutdown", "V"));
            blocked.forEach(VerifyPizzaIntegrationDex::noEffect);
            Method screen = method(patched, SCREEN, "onStart", "V");
            validateRegistersAndBranches(screen);
            var sc = code(screen);
            check(sc.size() == 3 && sc.get(0).getOpcode() == Opcode.INVOKE_SUPER &&
                key(call(sc.get(0))).equals("Landroid/app/Activity;->onStart()V") &&
                sc.get(1).getOpcode() == Opcode.INVOKE_VIRTUAL &&
                key(call(sc.get(1))).equals("Landroid/app/Activity;->finish()V") &&
                registers(sc.get(0)).equals(List.of(screen.getImplementation().getRegisterCount()-1)) &&
                registers(sc.get(1)).equals(registers(sc.get(0))) && sc.get(2).getOpcode() == Opcode.RETURN_VOID &&
                screen.getImplementation().getTryBlocks().isEmpty(), "Restored screen can open Play or close game tasks");

        }

        Set<String> allowed = new HashSet<>();
        allowed.addAll(VerifyPizzaPlayServicesDex.verify(patched, original, microg));
        if (!microg && code(method(patched, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;")).stream().anyMatch(i ->
            key(call(i)).equals("Lpl/dudek/extension/pizzabusiness/PizzaUpdateNotice;->initialize(Landroid/content/Context;)V"))) {
            Method oldCreate = method(original, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;");
            Method newCreate = method(patched, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;");
            var instructions = code(newCreate);
            var additions = new ArrayList<Integer>();
            for (int i = 0; i < instructions.size(); i++) if (key(call(instructions.get(i))).equals(
                "Lpl/dudek/extension/pizzabusiness/PizzaUpdateNotice;->initialize(Landroid/content/Context;)V")) additions.add(i);
            check(additions.size() == 1, "Expected exactly one notice context initialization");
            int index = additions.get(0);
            check(instructions.get(index).getOpcode() == Opcode.INVOKE_STATIC &&
                registers(instructions.get(index)).equals(List.of(newCreate.getImplementation().getRegisterCount() - 2)),
                "Notice initialization must receive the existing Activity");
            var trimmed = new com.android.tools.smali.dexlib2.builder.MutableMethodImplementation(newCreate.getImplementation());
            trimmed.removeInstruction(index);
            var withoutNotice = new com.android.tools.smali.dexlib2.immutable.ImmutableMethod(newCreate.getDefiningClass(),
                newCreate.getName(), newCreate.getParameters(), newCreate.getReturnType(), newCreate.getAccessFlags(),
                newCreate.getAnnotations(), newCreate.getHiddenApiRestrictions(), trimmed);
            check(canonical(oldCreate).equals(canonical(withoutNotice)), "Notice changed the original Activity startup");
            allowed.add(key(newCreate));
        }
        if (hidePaid) {
            Method checkout = method(patched, "Lcom/tapblaze/pizzabusiness/PurchasesManager;", "purchase", "V", STRING);
            validateRegistersAndBranches(checkout);
            allowed.add(key(checkout));
            // On-device tests exercise cancellation and observe Billing/JNI
            // callbacks. Here every other billing method must retain parity.
        }
        if (microg) {
            allowed.add(key(method(patched, ACTIVITY, "onCreate", "V", "Landroid/os/Bundle;")));
            allowed.add(key(method(patched, ACTIVITY, "lambda$initializeGooglePlayGames$3", "V")));
            Method resolution = method(patched, "Lcom/google/android/gms/internal/games_v2/zzbq;", "zzo", "V",
                "Lcom/google/android/gms/tasks/TaskCompletionSource;", "I", "Landroid/app/PendingIntent;", "Z", "Z");
            allowed.add(key(resolution));
            check(code(resolution).stream().anyMatch(i -> key(call(i)).equals(
                "Lcom/google/android/gms/games/internal/v2/resolution/a;->a(Landroid/app/Activity;Landroid/app/PendingIntent;)Lcom/google/android/gms/tasks/Task;")),
                "Games authentication no longer launches the actual service resolution");
            for (var entry : clients.entrySet()) {
                String owner = entry.getKey();
                Method action = method(patched, owner, "getStartServiceAction", STRING);
                allowed.add(key(action));
                check(constant(action).equals(GMS + "." + entry.getValue()), "Wrong Games service action");
                check(constant(method(patched, owner, "getStartServicePackage", STRING)).equals(GMS), "Wrong Games host");
                for (String name : List.of("getUseDynamicLookup", "requiresGooglePlayServices")) {
                    transportOnlyFalse(method(patched, owner, name, "Z"));
                }
                for (String name : List.of("getStartServicePackage", "getUseDynamicLookup", "requiresGooglePlayServices")) {
                    Method m = method(patched, owner, name, name.equals("getStartServicePackage") ? STRING : "Z");
                    check(AccessFlags.PUBLIC.isSet(m.getAccessFlags()) && !AccessFlags.STATIC.isSet(m.getAccessFlags()),
                        "Override has wrong access flags");
                }
            }
            Method installed = method(patched, ACTIVITY, "isGooglePlayGamesInstalled", "Z");
            allowed.add(key(installed));
            check(code(installed).stream().anyMatch(i -> i instanceof ReferenceInstruction r &&
                r.getReference() instanceof StringReference s && s.getString().equals(GMS)), "Presence check uses stock Games");
            check(code(installed).stream().anyMatch(i -> key(call(i)).equals(
                "Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;")),
                "Presence check was replaced with fake success");
        }

        // Whole-class comparison: authentication callbacks, server-auth requests,
        // player IDs, errors, Binder descriptors and SDK/VM return values survive.
        int preserved = 0, restored = 0, billingMethods = 0;
        for (ClassDef cls : original.values()) {
            // Preserve purchase results, verification, restoration and SDK
            // behavior. Only the explicitly selected checkout entry may differ.
            boolean billing = cls.getType().startsWith("Lcom/android/billingclient/") ||
                cls.getType().startsWith("Lcom/google/android/gms/internal/play_billing/") ||
                cls.getType().startsWith("Lcom/tapblaze/pizzabusiness/PurchasesManager");
            boolean auth = cls.getType().equals(ACTIVITY) || transportHierarchy.contains(cls.getType()) ||
                cls.getType().startsWith("Lcom/google/android/gms/internal/games_v2/") ||
                legacyPackages.stream().anyMatch(cls.getType()::startsWith) || cls.getType().equals("Lcom/pairip/VMRunner;");
            for (Method before : cls.getMethods()) {
                boolean vm = before.getImplementation() != null && code(before).stream().anyMatch(i ->
                    call(i) != null && call(i).getDefiningClass().equals("Lcom/pairip/VMRunner;") && call(i).getName().equals("invoke"));
                if ((!auth && !billing && !(vm && !cls.getType().startsWith("Lcom/pairip/"))) || allowed.contains(key(before))) continue;
                Method after = method(patched, cls.getType(), before.getName(), before.getReturnType(),
                    before.getParameterTypes().stream().map(Object::toString).toArray(String[]::new));
                Method recovered = sdkRestorations.get(key(before));
                if (recovered != null) {
                    check(vm && canonical(recovered).equals(canonical(after)), "SDK behavior differs from original library: " + key(before));
                    restored++;
                    continue;
                }
                check(canonical(before).equals(canonical(after)), "Unrelated/auth/protected method changed: " + key(before));
                if (billing && before.getImplementation() != null) billingMethods++;
                preserved++;
            }
        }
        Set<String> expectedVmCallers = new HashSet<>(), actualVmCallers = new HashSet<>();
        for (var entry : List.of(Map.entry(original, expectedVmCallers), Map.entry(patched, actualVmCallers)))
            for (ClassDef cls : entry.getKey().values()) if (!cls.getType().startsWith("Lcom/pairip/"))
                for (Method m : cls.getMethods()) if (m.getImplementation() != null && code(m).stream().anyMatch(i ->
                    call(i) != null && call(i).getDefiningClass().equals("Lcom/pairip/VMRunner;") && call(i).getName().equals("invoke")))
                    entry.getValue().add(key(m));
        expectedVmCallers.removeAll(sdkRestorations.keySet());
        check(actualVmCallers.equals(expectedVmCallers), "Protected caller set changed outside the recovered SDK receivers");
        check(restored == sdkRestorations.size(), "SDK restoration missing from emitted APK");
        if (args.length >= 4 && protectedInput) {
            int constants = 0;
            try (var reader = new java.io.BufferedReader(new java.io.InputStreamReader(new java.util.zip.GZIPInputStream(
                    java.nio.file.Files.newInputStream(java.nio.file.Path.of(args[3], "strings.tsv.gz"))), java.nio.charset.StandardCharsets.UTF_8))) {
                for (String row; (row = reader.readLine()) != null;) {
                    String[] parts = row.split("\t", -1);
                    String expected = new String(Base64.getDecoder().decode(parts[2]), java.nio.charset.StandardCharsets.UTF_8);
                    Field field = null;
                    for (Field f : patched.get(parts[0]).getFields()) if (f.getName().equals(parts[1])) field = f;
                    check(field != null && field.getInitialValue() instanceof com.android.tools.smali.dexlib2.iface.value.StringEncodedValue value &&
                        value.getValue().equals(expected), "Original startup constant not restored: " + parts[0] + "->" + parts[1]);
                    constants++;
                }
            }
            System.out.println("PASS: " + constants + " original startup strings initialized");
        }

        try (ZipFile oldZip = new ZipFile(args[1]); ZipFile newZip = new ZipFile(args[0])) {
            var before = AndroidManifestBlock.load(oldZip.getInputStream(oldZip.getEntry("AndroidManifest.xml")));
            var after = AndroidManifestBlock.load(newZip.getInputStream(newZip.getEntry("AndroidManifest.xml")));
            check(before.getPackageName().equals(after.getPackageName()) && before.getVersionCode().equals(after.getVersionCode()),
                "Game identity changed");
            var oldMeta = metadata(before); var newMeta = metadata(after);
            for (var entry : oldMeta.entrySet()) {
                if (MERGED_PACKAGING_METADATA.contains(entry.getKey()) && !newMeta.containsKey(entry.getKey())) continue;
                check(Objects.equals(newMeta.get(entry.getKey()), entry.getValue()),
                    "Original metadata changed: " + entry.getKey());
            }
            if (microg) {
                var sig = new ApkVerifier.Builder(new java.io.File(args[1])).build().verify();
                check(sig.isVerified() && sig.getSignerCertificates().size() == 1, "Original APK signature not verified");
                String digest = HexFormat.of().formatHex(MessageDigest.getInstance("SHA-1")
                    .digest(sig.getSignerCertificates().get(0).getEncoded()));
                check(Objects.equals(newMeta.get(GMS+".SPOOFED_PACKAGE_SIGNATURE"), digest), "Wrong original signer metadata");
                check(Objects.equals(newMeta.get(GMS+".SPOOFED_PACKAGE_NAME"), before.getPackageName()), "Wrong original package metadata");
                var queries = after.getManifestElement().getElement("queries").getElements("package");
                boolean visible = false;
                while (queries.hasNext()) if (GMS.equals(attribute((ResXmlElement)queries.next(),"name"))) visible = true;
                check(visible, "MicroG not visible on Android 11+");
            } else check(!newMeta.containsKey(GMS+".SPOOFED_PACKAGE_NAME"), "Stock variant unexpectedly enables MicroG");
            for (var entries = oldZip.entries(); entries.hasMoreElements();) {
                var e = entries.nextElement();
                if (!(e.getName().startsWith("lib/") || e.getName().startsWith("assets/"))) continue;
                if (e.getName().equals("lib/arm64-v8a/libcocos2dcpp.so") && args.length == 6) {
                    try (var stream = newZip.getInputStream(newZip.getEntry(e.getName()))) {
                        var digest = MessageDigest.getInstance("SHA-256");
                        byte[] buffer = new byte[1024 * 1024];
                        for (int n; (n = stream.read(buffer)) != -1;) digest.update(buffer, 0, n);
                        check(HexFormat.of().formatHex(digest.digest()).equals(args[5]), "Native output differs from reviewed reconstruction");
                    }
                    continue;
                }
                check(newZip.getEntry(e.getName()) != null && Arrays.equals(oldZip.getInputStream(e).readAllBytes(),
                    newZip.getInputStream(newZip.getEntry(e.getName())).readAllBytes()), "Native code/assets changed: " + e.getName());
            }
        }
        System.out.println(protectedInput ? "PASS: 10 licensing entry/retry/remediation/shutdown bodies have no side effects; restored screen only finishes itself" : "PASS: unprotected SDK/native initialization retained without synthetic VM resources");
        System.out.println("PASS: " + preserved + " unchanged authentication/SDK methods; " + restored + " SDK methods restored from upstream libraries");
        System.out.println("PASS: " + billingMethods + " executable billing methods unchanged; " +
            (hidePaid ? "checkout cancellation requires runtime test; " : "checkout preserved; ") +
            "results and purchase processing preserved");
        System.out.println("PASS: " + args[2] + " transport, original app identity, signer metadata, package visibility and native/assets integrity");
        System.out.println("LIMIT: these checks do not log in to Google or write/read a cloud save on a phone");
    }
}
