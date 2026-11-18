import java.io.*;
import java.nio.file.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.zip.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.iface.value.*;
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock;

/** Read-only intake for a merged APK or base split; writes no game/account data. */
public class InspectPizzaUpdate {
    static String quote(String s) {
        if (s == null) return "null";
        return "\"" + s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "\\r") + "\"";
    }
    static String hash(InputStream in) throws Exception {
        var digest = MessageDigest.getInstance("SHA-256");
        byte[] buffer = new byte[1024 * 1024];
        for (int count; (count = in.read(buffer)) != -1;) digest.update(buffer, 0, count);
        return HexFormat.of().formatHex(digest.digest());
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 1) throw new IllegalArgumentException("Usage: InspectPizzaUpdate input.apk");
        Map<String, ClassDef> classes = new TreeMap<>();
        var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames()) for (var cls : dex.getEntry(entry).getDexFile().getClasses()) classes.put(cls.getType(), cls);
        var roles = new TreeMap<String, String>();
        if (classes.containsKey("Lcom/tapblaze/pizzabusiness/BaseAppActivity;"))
            roles.put("gameActivity", "Lcom/tapblaze/pizzabusiness/BaseAppActivity;");
        var versions = new TreeMap<String, String>();
        var protectedMethods = new TreeSet<String>();
        var stringHolderClasses = new TreeSet<String>();
        int holders = 0, constants = 0;
        for (var cls : classes.values()) {
            var fields = new ArrayList<Field>(); cls.getFields().forEach(fields::add);
            var methods = new ArrayList<Method>(); cls.getMethods().forEach(methods::add);
            if (methods.isEmpty() && !fields.isEmpty() && fields.stream().allMatch(f ->
                    AccessFlags.STATIC.isSet(f.getAccessFlags()) && f.getType().equals("Ljava/lang/String;") && f.getInitialValue() == null)) {
                holders++; constants += fields.size();
                stringHolderClasses.add(cls.getType());
            }
            for (var field : fields) {
                if (field.getInitialValue() instanceof StringEncodedValue value && field.getName().contains("VERSION")) versions.put(cls.getType()+"->"+field.getName(), value.getValue());
                if (cls.getType().equals("Lcom/pairip/StartupLauncher;") && field.getName().equals("startupProgramName") && field.getInitialValue() instanceof StringEncodedValue value) roles.put("startupProgram", value.getValue());
            }
            for (var method : methods) {
                if (method.getImplementation() == null) continue;
                boolean providerInstalled = false, providerFailed = false;
                for (var instruction : method.getImplementation().getInstructions()) {
                    if (!(instruction instanceof ReferenceInstruction r)) continue;
                    if (r.getReference() instanceof MethodReference call && call.getDefiningClass().equals("Lcom/pairip/VMRunner;") && call.getName().equals("invoke")) protectedMethods.add(method.toString());
                    if (r.getReference() instanceof MethodReference call) {
                        providerInstalled |= call.getName().equals("onProviderInstalled");
                        providerFailed |= call.getName().equals("onProviderInstallFailed");
                    }
                    if (r.getReference() instanceof StringReference s && method.getName().equals("getStartServiceAction") && s.getString().contains(".games.") && s.getString().endsWith(".START")) roles.put(s.getString(), cls.getType());
                    if (r.getReference() instanceof StringReference s && s.getString().equals("android.net.conn.CONNECTIVITY_CHANGE") && method.getName().equals("run")) roles.put("connectivityWorker", cls.getType());
                }
                if (method.getName().equals("onPostExecute") && providerInstalled && providerFailed) roles.put("providerInstallerTask", cls.getType());
            }
        }
        try (var zip = new ZipFile(args[0])) {
            for (var entries = zip.entries(); entries.hasMoreElements();) {
                var entry = entries.nextElement();
                if (entry.getName().contains("/") || !entry.getName().endsWith(".properties")) continue;
                var metadata = new Properties();
                try (var in = zip.getInputStream(entry)) { metadata.load(in); }
                if (metadata.getProperty("version") != null) versions.put(entry.getName(), metadata.getProperty("version"));
            }
            var manifest = AndroidManifestBlock.load(zip.getInputStream(zip.getEntry("AndroidManifest.xml")));
            var nativeEntry = zip.getEntry("lib/arm64-v8a/libcocos2dcpp.so");
            System.out.println("{\"package\":"+quote(manifest.getPackageName())+",\"version\":"+quote(manifest.getVersionName())+
                ",\"version_code\":"+manifest.getVersionCode()+",\"native_sha256\":"+(nativeEntry == null ? "null" : quote(hash(zip.getInputStream(nativeEntry))))+
                ",\"classes\":"+classes.size()+",\"string_holders\":"+holders+",\"string_holder_classes\":["+String.join(",",stringHolderClasses.stream().map(InspectPizzaUpdate::quote).toList())+"],\"uninitialized_strings\":"+constants+",\"protected_methods\":"+protectedMethods.size()+
                ",\"protected_method_signatures\":["+String.join(",",protectedMethods.stream().map(InspectPizzaUpdate::quote).toList())+"],\"roles\":{"+String.join(",", roles.entrySet().stream().map(e -> quote(e.getKey())+":"+quote(e.getValue())).toList())+"},\"sdk_versions\":{"+
                String.join(",", versions.entrySet().stream().map(e -> quote(e.getKey())+":"+quote(e.getValue())).toList())+"}}");
        }
    }
}
