package app.yydarlinker.aicaptions.settings;

import app.yydarlinker.aicaptions.host.AiCaptionHook;
import app.yydarlinker.aicaptions.host.CaptionActions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.util.Base64;
import java.io.*;
import java.lang.reflect.*;
import java.lang.reflect.Proxy;
import java.net.*;
import java.security.*;
import java.security.cert.Certificate;
import java.util.*;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import org.junit.*;
import org.junit.runner.RunWith;
import org.robolectric.*;
import org.robolectric.annotation.*;

/** Current-behavior characterization. No SecureApiKey/Cipher shadow and no external I/O. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk=28, manifest=Config.NONE, shadows={ConfigCredentialFailureTest.Actions.class, ConfigCredentialFailureTest.Connections.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class ConfigCredentialFailureTest {
    public static final String INDEX="caption_api_profiles", GLOBAL="ai_caption_translator";
    public static final String SECRET="ai_caption_secret", VALUE="api_key_ciphertext";
    static final String ALIAS="yydarlinker.deepseek.caption.api.key.v1";
    public static final String A="fixture-alpha", B="fixture-beta";
    static SecretKey master;
    static boolean unavailable;
    public static int reads, generations, refreshes, connections;
    Activity activity;
    public FixtureContext c;
    public String b;
    Provider previousProvider;
    int previousPosition;
    ProxySelector previousProxy;

    @Implements(CaptionActions.class) public static class Actions {
        @Implementation protected static void refreshConfiguration(Context c) { refreshes++; }
    }
    @Implements(AiCaptionHook.class) public static class Connections {
        @Implementation protected static HttpURLConnection openWithYouTubeCronet(URL u) {
            connections++; throw new AssertionError("unmapped connection: "+u);
        }
    }
    public static class FixtureProvider extends Provider {
        public FixtureProvider() {
            super("AndroidKeyStore", 1.0, "test-owned memory only; platform Cipher remains real");
            put("KeyStore.AndroidKeyStore", MemoryKeyStore.class.getName());
            put("KeyGenerator.AES", RejectGenerator.class.getName());
        }
    }
    public static class RejectGenerator extends KeyGeneratorSpi {
        protected void engineInit(SecureRandom r) { throw new AssertionError("unexpected generation"); }
        protected void engineInit(int n, SecureRandom r) { throw new AssertionError("unexpected generation"); }
        protected void engineInit(java.security.spec.AlgorithmParameterSpec p, SecureRandom r)
                throws InvalidAlgorithmParameterException {
            generations++; throw new InvalidAlgorithmParameterException("fixture generator denied");
        }
        protected SecretKey engineGenerateKey() { throw new AssertionError("unexpected generation"); }
    }
    public static class MemoryKeyStore extends KeyStoreSpi {
        public Key engineGetKey(String a,char[] p) throws UnrecoverableKeyException {
            reads++; if(unavailable) throw new UnrecoverableKeyException("fixture keystore unavailable");
            assertEquals(ALIAS,a); return master;
        }
        public void engineLoad(InputStream in,char[] p) throws IOException {
            if(unavailable) throw new IOException("fixture store load denied");
        }
        public void engineStore(OutputStream o,char[] p) { throw new AssertionError("no disk keystore"); }
        public Certificate[] engineGetCertificateChain(String a) { return null; }
        public Certificate engineGetCertificate(String a) { return null; }
        public Date engineGetCreationDate(String a) { return null; }
        public void engineSetKeyEntry(String a,Key k,char[] p,Certificate[] cs) { throw new AssertionError(); }
        public void engineSetKeyEntry(String a,byte[] k,Certificate[] cs) { throw new AssertionError(); }
        public void engineSetCertificateEntry(String a,Certificate cert) { throw new AssertionError(); }
        public void engineDeleteEntry(String a) { throw new AssertionError(); }
        public Enumeration<String> engineAliases() { return Collections.enumeration(Collections.singleton(ALIAS)); }
        public boolean engineContainsAlias(String a) { return master!=null && ALIAS.equals(a); }
        public int engineSize() { return master==null?0:1; }
        public boolean engineIsKeyEntry(String a) { return engineContainsAlias(a); }
        public boolean engineIsCertificateEntry(String a) { return false; }
        public String engineGetCertificateAlias(Certificate cert) { return null; }
    }

    /** Delegates real Robolectric preferences. Only selected apply calls throw/drop. */
    public static class FixtureContext extends ContextWrapper {
        final Map<String,SharedPreferences> stores=new TreeMap<>();
        final List<String> writes=new ArrayList<>();
        String failStore, mode;
        FixtureContext(Context base) { super(base); }
        @Override public SharedPreferences getSharedPreferences(String n,int m) {
            return stores.computeIfAbsent(n,k->super.getSharedPreferences(k,m));
        }
        void fault(String store,String kind) {
            failStore=store;mode=kind;
            SharedPreferences real=getSharedPreferences(store,0);
            stores.put(store,(SharedPreferences)Proxy.newProxyInstance(SharedPreferences.class.getClassLoader(),
                    new Class<?>[]{SharedPreferences.class},(p,method,args)-> {
                        Object result=invoke(real,method,args);
                        if(!method.getName().equals("edit")) return result;
                        SharedPreferences.Editor edit=(SharedPreferences.Editor)result;
                        return Proxy.newProxyInstance(SharedPreferences.Editor.class.getClassLoader(),
                                new Class<?>[]{SharedPreferences.Editor.class},(ep,em,ea)-> {
                                    if(em.getName().equals("apply")) {
                                        writes.add(store+":"+mode);
                                        if(store.equals(failStore) && "before".equals(mode))
                                            throw new IllegalStateException("fixture apply before "+store);
                                        if(store.equals(failStore) && "drop".equals(mode)) return null;
                                        Object value=invoke(edit,em,ea);
                                        if(store.equals(failStore) && "after".equals(mode))
                                            throw new IllegalStateException("fixture apply after "+store);
                                        return value;
                                    }
                                    Object value=invoke(edit,em,ea);
                                    return value==edit?ep:value;
                                });
                    }));
        }
        void recover() { failStore=null;mode=null; }
        static Object invoke(Object target,Method m,Object[] args) throws Throwable {
            try { return m.invoke(target,args); } catch(InvocationTargetException ex) { throw ex.getCause(); }
        }
        public Map<String,Map<String,?>> snapshot() {
            Map<String,Map<String,?>> all=new TreeMap<>();
            stores.forEach((k,v)->all.put(k,new TreeMap<>(v.getAll())));return all;
        }
    }

    @Test public void upgrades162PreferencesAndRealCiphertextWithoutRewritingTheOriginals()
            throws Exception {
        String originalGlobalName = "deepseek_caption_translator";
        String originalSecretName = "deepseek_caption_secret";
        SharedPreferences originalGlobal = c.getSharedPreferences(originalGlobalName, 0);
        SharedPreferences originalSecret = c.getSharedPreferences(originalSecretName, 0);
        SharedPreferences originalSession = c.getSharedPreferences("deepseek_caption_session", 0);
        SharedPreferences currentGlobal = c.getSharedPreferences(GLOBAL, 0);
        SharedPreferences currentSecret = c.getSharedPreferences(SECRET, 0);
        String profileValue = VALUE + "_" + b;
        assertEquals(b, UUID.fromString(b).toString());

        // Seed the on-disk layout from 1.6.2, using the test's real AES/GCM ciphertext.
        Map<String, ?> indexBefore = c.getSharedPreferences(INDEX, 0).getAll();
        String legacyCiphertext = encode162(A);
        String profileCiphertext = encode162(B);
        originalGlobal.edit().putBoolean("enabled", true).putInt("caption_size_tier", 3)
                .putString("base_url", "https://alpha.invalid/v1")
                .putString("model", "fixture-model-a").commit();
        originalSecret.edit().putString(VALUE, legacyCiphertext)
                .putString(VALUE + "_origin", "https://alpha.invalid")
                .putString(profileValue, profileCiphertext)
                .putString(profileValue + "_origin", "https://beta.invalid").commit();
        originalSession.edit().putBoolean("ai_enabled", true).putLong("revision", 42L)
                .putString("target_language", "es").commit();
        Map<String, ?> settingsBefore = originalGlobal.getAll();
        Map<String, ?> secretsBefore = originalSecret.getAll();
        Map<String, ?> sessionBefore = originalSession.getAll();
        currentGlobal.edit().clear().commit();
        currentSecret.edit().clear().commit();

        assertTrue(AiCaptionConfig.enabled(c));
        assertEquals(A, AiCaptionConfig.requestSettings(c).apiKey);
        assertEquals(legacyCiphertext, currentSecret.getString(VALUE, ""));
        assertEquals(profileCiphertext, currentSecret.getString(profileValue, ""));
        assertEquals(indexBefore, c.getSharedPreferences(INDEX, 0).getAll());
        assertEquals(42L, CaptionStorage.SESSION.open(c).getLong("revision", 0L));

        assertTrue(ApiProfiles.select(c, b));
        assertEquals(B, AiCaptionConfig.requestSettings(c).apiKey);
        unavailable = true;
        assertEquals("", AiCaptionConfig.requestSettings(c).apiKey);
        assertThrows(ConfigRead.Failure.class, () -> SecureApiKey.replace(c, A));
        assertEquals(profileCiphertext, currentSecret.getString(profileValue, ""));
        unavailable = false;
        SecureApiKey.replace(c, A);
        AiCaptionConfig.saveModel(c, "fixture-after-upgrade");
        assertEquals(A, AiCaptionConfig.requestSettings(c).apiKey);
        assertEquals("fixture-after-upgrade", AiCaptionConfig.model(c));
        assertEquals(b, ApiProfiles.active(c));
        assertEquals(settingsBefore, originalGlobal.getAll());
        assertEquals(secretsBefore, originalSecret.getAll());
        assertEquals(sessionBefore, originalSession.getAll());
        assertEquals(0, generations);
        assertEquals(0, connections);
    }

    private static String encode162(String plaintext) throws Exception {
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, master);
        byte[] iv = cipher.getIV();
        byte[] ciphertext = cipher.doFinal(plaintext.getBytes(java.nio.charset.StandardCharsets.UTF_8));
        byte[] frame = java.nio.ByteBuffer.allocate(1 + iv.length + ciphertext.length)
                .put((byte) iv.length).put(iv).put(ciphertext).array();
        return Base64.encodeToString(frame, Base64.NO_WRAP);
    }

    @Before public void before() throws Exception {
        previousProvider=Security.getProvider("AndroidKeyStore");
        Provider[] providers=Security.getProviders();
        for(int i=0;i<providers.length;i++) if(providers[i]==previousProvider) previousPosition=i+1;
        if(previousProvider!=null) Security.removeProvider("AndroidKeyStore");
        Security.insertProviderAt(new FixtureProvider(),1);
        previousProxy=ProxySelector.getDefault();
        ProxySelector.setDefault(new ProxySelector() {
            public List<java.net.Proxy> select(URI uri) { connections++;throw new AssertionError("no HTTP: "+uri); }
            public void connectFailed(URI uri,SocketAddress a,IOException e) { throw new AssertionError(e); }
        });
        master=new SecretKeySpec(new byte[]{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},"AES");
        unavailable=false;reads=generations=refreshes=connections=0;
        activity=Robolectric.buildActivity(Activity.class).setup().get();c=new FixtureContext(activity);
        c.getSharedPreferences(INDEX,0);c.getSharedPreferences(SECRET,0);
        AiCaptionConfig.saveEnabled(c,true);AiCaptionConfig.saveCaptionSizeTier(c,3);
        AiCaptionConfig.saveBaseUrl(c,"https://alpha.invalid/v1");AiCaptionConfig.saveModel(c,"fixture-model-a");
        SecureApiKey.save(c,A);
        b=ApiProfiles.create(c,"Fixture B","https://beta.invalid/v1");
        ApiProfiles.select(c,b);AiCaptionConfig.saveModel(c,"fixture-model-b");SecureApiKey.save(c,B);
        ApiProfiles.select(c,"default");refreshes=0;
        assertNotEquals("AndroidKeyStore",Cipher.getInstance("AES/GCM/NoPadding").getProvider().getName());

    }
    @After public void after() throws Exception {
        try {
            assertEquals("no connection was even attempted",0,connections);
        } finally {
            if(activity!=null) activity.finish();
            ProxySelector.setDefault(previousProxy);
            Security.removeProvider("AndroidKeyStore");
            if(previousProvider!=null) Security.insertProviderAt(previousProvider,previousPosition);
            master=null;unavailable=false;

        }
    }
    public SharedPreferences secret() { return c.getSharedPreferences(SECRET,0); }
    void active(String id) { c.getSharedPreferences(INDEX,0).edit().putString("active",id).apply(); }
    void unchangedOthers(Map<String,Map<String,?>> before,String... changed) {
        Set<String> allowed=new HashSet<>(Arrays.asList(changed));
        Map<String,Map<String,?>> after=c.snapshot();
        for(String n:before.keySet()) if(!allowed.contains(n)) assertEquals(n,before.get(n),after.get(n));
    }
    public void otherStillReadable() { active(b);assertEquals(B,SecureApiKey.load(c));active("default"); }
    interface Work { void run() throws Exception; }
    void throwsType(Class<? extends Throwable> type,Work op) throws Exception {
        try { op.run();fail("expected "+type.getName()); }
        catch(Throwable e) { if(!type.isInstance(e)) throw new AssertionError("wrong exception",e); }
    }

    @Test public void realCipherRoundTripAndExplicitClearPreserveOtherProfileAndGlobals() throws Exception {
        assertEquals(A,SecureApiKey.load(c));assertTrue(AiCaptionConfig.load(c).ready());
        Map<String,Map<String,?>> before=c.snapshot();ApiProfiles.clearKey(c,"default");
        assertEquals("",SecureApiKey.load(c));assertFalse(SecureApiKey.hasSavedValue(c));
        assertFalse(secret().contains(VALUE));assertFalse(secret().contains(VALUE+"_origin"));
        unchangedOthers(before,SECRET);otherStillReadable();
        SecureApiKey.save(c,A);assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void malformedAndAuthenticatedCipherFailuresKeepEveryFixtureByte() throws Exception {
        String valid=secret().getString(VALUE,"");
        byte[] tag=Base64.decode(valid,Base64.DEFAULT);tag[tag.length-1]^=1;
        List<String> bad=Arrays.asList("%%%",Base64.encodeToString(new byte[]{1,2},2),
                Base64.encodeToString(new byte[]{12,1,2},2),Base64.encodeToString(new byte[]{33,1},2),
                Base64.encodeToString(tag,2));
        for(String encoded:bad) {
            secret().edit().putString(VALUE,encoded).apply();Map<String,Map<String,?>> before=c.snapshot();
            assertTrue(SecureApiKey.hasSavedValue(c));assertEquals("",SecureApiKey.load(c));
            assertFalse(AiCaptionConfig.load(c).ready());assertEquals(before,c.snapshot());
            otherStillReadable();
        }
        secret().edit().putString(VALUE,valid).apply();assertEquals(A,SecureApiKey.load(c));assertEquals(0,generations);
    }
    @Test public void missingAliasUnavailableAndWrongMasterReadWithoutGeneratingOrDeleting() throws Exception {
        SecretKey valid=master;
        for(int fault=0;fault<3;fault++) {
            master=fault==0?null:fault==2?new SecretKeySpec(new byte[16],"AES"):valid;
            unavailable=fault==1;Map<String,Map<String,?>> before=c.snapshot();
            assertEquals("",SecureApiKey.load(c));assertTrue(SecureApiKey.hasSavedValue(c));
            assertEquals(before,c.snapshot());assertEquals(0,generations);
            master=valid;unavailable=false;assertEquals(A,SecureApiKey.load(c));otherStillReadable();
        }
    }
    @Test public void originMismatchRejectsRequestsButDiagnosticSnapshotStillResolves() throws Exception {
        AiCaptionConfig.saveBaseUrl(c,"https://other.invalid/v1");Map<String,Map<String,?>> before=c.snapshot();
        int r=reads;assertFalse(SecureApiKey.hasSavedValue(c));assertEquals("",SecureApiKey.load(c));assertEquals(r,reads);
        assertFalse(AiCaptionConfig.load(c).hasCredential);
        SecureApiKey.StoredCredential diagnostic=SecureApiKey.captureCredential(c);
        assertTrue(diagnostic.present());assertEquals(r,reads);assertEquals(A,diagnostic.resolve());
        assertEquals(before,c.snapshot());
        AiCaptionConfig.saveBaseUrl(c,"https://alpha.invalid/v2");assertEquals(A,SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void corruptNamesAndWrongPreferenceTypesPropagateWithoutRepair() throws Exception {
        String original=c.getSharedPreferences(INDEX,0).getString("names","");
        for(Object invalid:Arrays.asList("{",Integer.valueOf(7))) {
            SharedPreferences.Editor edit=c.getSharedPreferences(INDEX,0).edit();
            if(invalid instanceof String)edit.putString("names",(String)invalid);else edit.putInt("names",7);edit.apply();
            Map<String,Map<String,?>> before=c.snapshot();
            throwsType(ConfigRead.Failure.class,()->ApiProfiles.list(c));
            assertEquals(before,c.snapshot());assertEquals("",SecureApiKey.load(c));assertFalse(AiCaptionConfig.load(c).ready());
        }
        c.getSharedPreferences(INDEX,0).edit().putString("names",original).apply();
        assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void wrongSecretActiveAndGlobalTypesAreNotCaughtByDecrypt() throws Exception {
        for(String store:Arrays.asList(SECRET,INDEX,GLOBAL)) {
            String key=store.equals(SECRET)?VALUE:store.equals(INDEX)?"active":"enabled";
            SharedPreferences p=c.getSharedPreferences(store,0);Object old=p.getAll().get(key);
            p.edit().putInt(key,7).apply();Map<String,Map<String,?>> before=c.snapshot();
            assertFalse(AiCaptionConfig.load(c).readable);assertFalse(AiCaptionConfig.load(c).ready());
            assertEquals(before,c.snapshot());
            SharedPreferences.Editor e=p.edit();if(old instanceof String)e.putString(key,(String)old);else if(old instanceof Boolean)e.putBoolean(key,(Boolean)old);else e.remove(key);e.apply();
            assertEquals(A,SecureApiKey.load(c));
        }
    }
    @Test public void malformedEndpointAndWrongModelTypePropagateWithoutDeletingCiphertext() throws Exception {
        Map<String,Map<String,?>> original=c.snapshot();
        for(String endpoint:Arrays.asList("not a URI","relative")) {
            ApiProfiles.values(c).edit().putString("base_url",endpoint).apply();Map<String,Map<String,?>> before=c.snapshot();
            assertEquals("",SecureApiKey.load(c));assertFalse(AiCaptionConfig.load(c).readable);assertFalse(AiCaptionConfig.load(c).ready());
            assertEquals(before,c.snapshot());
        }
        ApiProfiles.values(c).edit().putString("base_url","https://alpha.invalid/v1").putInt("model",7).apply();
        Map<String,Map<String,?>> before=c.snapshot();assertFalse(AiCaptionConfig.load(c).readable);assertFalse(AiCaptionConfig.load(c).ready());
        assertEquals(before,c.snapshot());unchangedOthers(original,GLOBAL);otherStillReadable();
    }
    @Test public void keySaveFailureBeforeAndAfterEncryptionRetainsOriginalAndRecovers() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();unavailable=true;
        throwsType(GeneralSecurityException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(before,c.snapshot());unavailable=false;
        c.fault(SECRET,"before");throwsType(IllegalStateException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(before,c.snapshot());c.recover();
        assertEquals(A,SecureApiKey.load(c));SecureApiKey.save(c,"fixture-replacement");
        assertEquals("fixture-replacement",SecureApiKey.load(c));otherStillReadable();unchangedOthers(before,SECRET);
    }
    @Test public void missingAliasSaveGenerationFailureDoesNotReplaceCiphertext() throws Exception {
        SecretKey saved=master;master=null;Map<String,Map<String,?>> before=c.snapshot();
        throwsType(InvalidAlgorithmParameterException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(1,generations);assertEquals(before,c.snapshot());
        master=saved;assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void createIndexFailureLeavesOrphanValuesButOtherDataUntouched() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();c.fault(INDEX,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.create(c,"orphan","https://orphan.invalid"));
        unchangedOthers(before);Set<String> extra=new HashSet<>(c.stores.keySet());extra.removeAll(before.keySet());
        assertEquals(1,extra.size());String orphan=extra.iterator().next();
        assertEquals("https://orphan.invalid",c.getSharedPreferences(orphan,0).getString("base_url",""));
        assertEquals(2,ApiProfiles.list(c).size());
        c.recover();String id=ApiProfiles.create(c,"recovered","https://recover.invalid");assertTrue(ApiProfiles.select(c,id));assertEquals("",SecureApiKey.load(c));
    }
    @Test public void selectApplyAfterMutationRevokesPreviousProfile() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();long revision=ApiProfiles.revision();c.fault(INDEX,"after");
        throwsType(IllegalStateException.class,()->ApiProfiles.select(c,b));
        assertEquals(b,ApiProfiles.active(c));assertEquals(B,SecureApiKey.load(c));
        assertEquals(revision+1,ApiProfiles.revision());assertEquals(1,refreshes);
        unchangedOthers(before,INDEX);
        c.recover();assertTrue(ApiProfiles.select(c,"default"));assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void deleteSecretFailureLeavesIndexChangedAndValuesCiphertextRetained() throws Exception {
        ApiProfiles.select(c,b);Map<String,Map<String,?>> before=c.snapshot();refreshes=0;c.fault(SECRET,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.delete(c,b));
        assertEquals("default",ApiProfiles.active(c));assertFalse(ApiProfiles.list(c).containsKey(b));
        unchangedOthers(before,INDEX);assertEquals(1,refreshes);
        assertEquals(A,SecureApiKey.load(c));
        c.recover();active(b);assertEquals("",SecureApiKey.load(c));
        c.getSharedPreferences(INDEX,0).edit().putString("names",(String)before.get(INDEX).get("names")).apply();
        assertEquals(B,SecureApiKey.load(c));active("default");
    }
    @Test public void legacyBindingCanPersistBeforeEndpointWriteFails() throws Exception {
        secret().edit().remove(VALUE+"_origin").apply();Map<String,Map<String,?>> before=c.snapshot();c.fault(GLOBAL,"before");
        throwsType(IllegalStateException.class,()->AiCaptionConfig.saveBaseUrl(c,"https://other.invalid"));
        assertEquals("https://alpha.invalid",secret().getString(VALUE+"_origin",""));
        unchangedOthers(before,SECRET);assertEquals(A,SecureApiKey.load(c));
        c.recover();AiCaptionConfig.saveBaseUrl(c,"https://other.invalid");assertEquals("",SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void successfulLegacyDeletionPreservesGlobalStyleAndOtherCredential() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();ApiProfiles.delete(c,"default");
        assertEquals(b,ApiProfiles.active(c));assertEquals(B,SecureApiKey.load(c));
        assertTrue(AiCaptionConfig.enabled(c));assertEquals(3,AiCaptionConfig.displayStyle(c).captionSizeTier);
        assertFalse(ApiProfiles.values(c,"default").contains("base_url"));assertFalse(secret().contains(VALUE));
        assertTrue(c.getSharedPreferences(INDEX,0).getBoolean("legacy_deleted",false));
        unchangedOthers(before,INDEX,SECRET,GLOBAL);
    }
    @Test public void keyDialogNeverEchoesAndCanRecoverWhenKeystoreReturns() {
        CaptionSettingsPreference row = new CaptionSettingsPreference(c, null);
        row.setTitle("API key");
        row.setKey("ai_caption_api_key");
        row.onClick();
        android.app.Dialog dialog = org.robolectric.shadows.ShadowDialog.getLatestDialog();
        android.widget.EditText input = DialogTestViews.find(dialog, android.widget.EditText.class);
        assertEquals("", input.getText().toString());
        assertFalse(input.isSaveEnabled());
        assertTrue((dialog.getWindow().getAttributes().flags
                & android.view.WindowManager.LayoutParams.FLAG_SECURE) != 0);
        Map<String, Map<String, ?>> before = c.snapshot();
        input.setText("fixture-replacement");
        unavailable = true;
        dialog.findViewById(android.R.id.button1).performClick();
        assertEquals(before, c.snapshot());
        assertTrue(dialog.isShowing());
        assertNotNull(input.getError());
        unavailable = false;
        dialog.findViewById(android.R.id.button1).performClick();
        assertFalse(dialog.isShowing());
        assertEquals("fixture-replacement", SecureApiKey.load(c));
        assertFalse(secret().getString(VALUE, "").contains("fixture-replacement"));
        otherStillReadable();
    }

    @Test public void legacyPreferencesAndEncryptedBytesLoadAsReleased() throws Exception {
        byte[] iv = new byte[] {11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, master, new javax.crypto.spec.GCMParameterSpec(128, iv));
        byte[] bytes = cipher.doFinal("legacy-fixture".getBytes(java.nio.charset.StandardCharsets.UTF_8));
        String packed = Base64.encodeToString(java.nio.ByteBuffer.allocate(1 + iv.length + bytes.length)
                .put((byte) iv.length).put(iv).put(bytes).array(), Base64.NO_WRAP);
        secret().edit().putString("api_key_ciphertext", packed)
                .remove("api_key_ciphertext_origin").commit();
        c.getSharedPreferences("ai_caption_translator", 0).edit()
                .putString("base_url", "https://alpha.invalid/v1").putString("model", "legacy-model")
                .putBoolean("enabled", true).putFloat("shorts_y", .68f).commit();
        Map<String, Map<String, ?>> before = c.snapshot();
        assertEquals("legacy-fixture", SecureApiKey.loadChecked(c));
        assertEquals("legacy-model", AiCaptionConfig.model(c));
        assertTrue(AiCaptionConfig.enabled(c));
        assertEquals(.68f, AiCaptionConfig.shortsPosition(c), 0f);
        assertEquals(before, c.snapshot());
        AiCaptionConfig.saveBaseUrl(c, "https://other.invalid/v1");
        assertEquals(packed, secret().getString("api_key_ciphertext", ""));
        assertEquals("https://alpha.invalid", secret().getString("api_key_ciphertext_origin", ""));
        assertEquals("", SecureApiKey.load(c));
        AiCaptionConfig.saveBaseUrl(c, "https://alpha.invalid/v2");
        assertEquals("legacy-fixture", SecureApiKey.load(c));
        otherStillReadable();
    }
}
