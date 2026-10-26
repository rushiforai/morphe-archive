package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.util.Base64;
import android.widget.LinearLayout;
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
@Config(sdk=28, manifest=Config.NONE, shadows={ConfigCredentialFailureTest.Models.class,
        ConfigCredentialFailureTest.Actions.class, ConfigCredentialFailureTest.Connections.class,
        ConfigCredentialFailureTest.Catalog.class})
@LooperMode(LooperMode.Mode.PAUSED)
public class ConfigCredentialFailureTest {
    static final String INDEX="caption_api_profiles", GLOBAL="deepseek_caption_translator";
    static final String SECRET="deepseek_caption_secret", VALUE="api_key_ciphertext";
    static final String ALIAS="yydarlinker.deepseek.caption.api.key.v1";
    static final String A="fixture-m5f-alpha", B="fixture-m5f-beta";
    static SecretKey master;
    static boolean unavailable;
    static int reads, generations, notices, refreshes, discovery, connections;
    Activity activity;
    FixtureContext c;
    String b;
    Provider previousProvider;
    int previousPosition;
    ProxySelector previousProxy;
    final Map<Field,Object> statics=new LinkedHashMap<>();
    final List<ProfileEditorPreference> fields=new ArrayList<>();
    @Rule public org.junit.rules.TestName name=new org.junit.rules.TestName();

    // Only unrelated effects are suppressed. Real profile selection, flush, config and crypto run.
    @Implements(DeepSeekModelPreference.class) public static class Models {
        @Implementation protected static void onCredentialsChanged(Context c) { notices++; }
    }
    @Implements(CaptionActions.class) public static class Actions {
        @Implementation protected static void refreshConfiguration(Context c) { refreshes++; }
    }
    @Implements(DeepSeekModelCatalog.class) public static class Catalog {
        @Implementation protected static List<String> fetch(String endpoint) {
            discovery++; throw new AssertionError("M5f unmapped model discovery: "+endpoint);
        }
    }
    @Implements(DeepSeekCaptionHook.class) public static class Connections {
        @Implementation protected static HttpURLConnection openWithYouTubeCronet(URL u) {
            connections++; throw new AssertionError("M5f unmapped connection: "+u);
        }
    }
    public static class FixtureProvider extends Provider {
        public FixtureProvider() {
            super("AndroidKeyStore", 1.0, "M5f test-owned memory only; platform Cipher remains real");
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
    static class FixtureContext extends ContextWrapper {
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
        Map<String,Map<String,?>> snapshot() {
            Map<String,Map<String,?>> all=new TreeMap<>();
            stores.forEach((k,v)->all.put(k,new TreeMap<>(v.getAll())));return all;
        }
    }

    @Before public void before() throws Exception {
        for(String n:new String[]{"editors","flushing","revision"}) {
            Field f=ApiProfiles.class.getDeclaredField(n);f.setAccessible(true);
            Object v=f.get(null);statics.put(f,v instanceof List?new ArrayList<>((List<?>)v):v);
            if(v instanceof List) ((List<?>)v).clear();
        }
        previousProvider=Security.getProvider("AndroidKeyStore");
        Provider[] providers=Security.getProviders();
        for(int i=0;i<providers.length;i++) if(providers[i]==previousProvider) previousPosition=i+1;
        if(previousProvider!=null) Security.removeProvider("AndroidKeyStore");
        Security.insertProviderAt(new FixtureProvider(),1);
        previousProxy=ProxySelector.getDefault();
        ProxySelector.setDefault(new ProxySelector() {
            public List<java.net.Proxy> select(URI uri) { connections++;throw new AssertionError("M5f no HTTP: "+uri); }
            public void connectFailed(URI uri,SocketAddress a,IOException e) { throw new AssertionError(e); }
        });
        master=new SecretKeySpec(new byte[]{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},"AES");
        unavailable=false;reads=generations=notices=refreshes=discovery=connections=0;
        activity=Robolectric.buildActivity(Activity.class).setup().get();c=new FixtureContext(activity);
        c.getSharedPreferences(INDEX,0);c.getSharedPreferences(SECRET,0);
        DeepSeekConfig.saveEnabled(c,true);DeepSeekConfig.saveCaptionSizeTier(c,3);
        DeepSeekConfig.saveBaseUrl(c,"https://alpha.invalid/v1");DeepSeekConfig.saveModel(c,"fixture-model-a");
        SecureApiKey.save(c,A);
        b=ApiProfiles.create(c,"Fixture B","https://beta.invalid/v1");
        ApiProfiles.select(c,b);DeepSeekConfig.saveModel(c,"fixture-model-b");SecureApiKey.save(c,B);
        ApiProfiles.select(c,"default");notices=refreshes=0;
        assertNotEquals("AndroidKeyStore",Cipher.getInstance("AES/GCM/NoPadding").getProvider().getName());
        System.out.println("M5F_CIPHER "+Cipher.getInstance("AES/GCM/NoPadding").getProvider().getName());
    }
    @After public void after() throws Exception {
        try {
            if(c!=null) System.out.println("M5F_FINAL "+name.getMethodName()+" "+new org.json.JSONObject(c.snapshot()));
            assertEquals("no connection was even attempted",0,connections);
            assertEquals("no model discovery was attempted",0,discovery);
            assertFalse(ApiProfiles.flushing());
        } finally {
            for(ProfileEditorPreference p:fields) { p.cancelPendingSave();ApiProfiles.unregister(p); }
            if(activity!=null) activity.finish();
            for(Map.Entry<Field,Object> e:statics.entrySet()) {
                if(e.getValue() instanceof List) {
                    List list=(List)e.getKey().get(null);list.clear();list.addAll((List)e.getValue());
                } else e.getKey().set(null,e.getValue());
            }
            ProxySelector.setDefault(previousProxy);
            Security.removeProvider("AndroidKeyStore");
            if(previousProvider!=null) Security.insertProviderAt(previousProvider,previousPosition);
            master=null;unavailable=false;
            System.out.println("M5F_CLEANUP provider="+(Security.getProvider("AndroidKeyStore")==previousProvider)
                    +";proxy="+(ProxySelector.getDefault()==previousProxy)+";editors_restored=true");
        }
    }
    void evidence(String label,Map<String,Map<String,?>> before) throws Exception {
        System.out.println("M5F_SNAPSHOT "+new org.json.JSONObject().put("test",name.getMethodName())
                .put("case",label).put("before",new org.json.JSONObject(before))
                .put("after",new org.json.JSONObject(c.snapshot())).put("writes",c.writes)
                .put("reads",reads).put("generations",generations).put("notices",notices).put("refreshes",refreshes));
    }
    SharedPreferences secret() { return c.getSharedPreferences(SECRET,0); }
    void active(String id) { c.getSharedPreferences(INDEX,0).edit().putString("active",id).apply(); }
    void unchangedOthers(Map<String,Map<String,?>> before,String... changed) {
        Set<String> allowed=new HashSet<>(Arrays.asList(changed));
        Map<String,Map<String,?>> after=c.snapshot();
        for(String n:before.keySet()) if(!allowed.contains(n)) assertEquals(n,before.get(n),after.get(n));
    }
    void otherStillReadable() { active(b);assertEquals(B,SecureApiKey.load(c));active("default"); }
    interface Work { void run() throws Exception; }
    void throwsType(Class<? extends Throwable> type,Work op) throws Exception {
        try { op.run();fail("expected "+type.getName()); }
        catch(Throwable e) { if(!type.isInstance(e)) throw new AssertionError("wrong exception",e); }
    }
    DeepSeekTextPreference field(String key) {
        DeepSeekTextPreference p=new DeepSeekTextPreference(c);p.setKey(key);
        p.getView(null,new LinearLayout(c));fields.add(p);return p;
    }

    @Test public void realCipherRoundTripAndExplicitClearPreserveOtherProfileAndGlobals() throws Exception {
        assertEquals(A,SecureApiKey.load(c));assertTrue(DeepSeekConfig.load(c).ready());
        Map<String,Map<String,?>> before=c.snapshot();ApiProfiles.clearKey(c,"default");
        assertEquals("",SecureApiKey.load(c));assertFalse(SecureApiKey.hasSavedValue(c));
        assertFalse(secret().contains(VALUE));assertFalse(secret().contains(VALUE+"_origin"));
        unchangedOthers(before,SECRET);otherStillReadable();evidence("explicit clear",before);
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
            assertFalse(DeepSeekConfig.load(c).ready());assertEquals(before,c.snapshot());
            evidence("bad Base64/IV/tag "+bad.indexOf(encoded),before);otherStillReadable();
        }
        secret().edit().putString(VALUE,valid).apply();assertEquals(A,SecureApiKey.load(c));assertEquals(0,generations);
    }
    @Test public void missingAliasUnavailableAndWrongMasterReadWithoutGeneratingOrDeleting() throws Exception {
        SecretKey valid=master;
        for(int fault=0;fault<3;fault++) {
            master=fault==0?null:fault==2?new SecretKeySpec(new byte[16],"AES"):valid;
            unavailable=fault==1;Map<String,Map<String,?>> before=c.snapshot();
            assertEquals("",SecureApiKey.load(c));assertTrue(SecureApiKey.hasSavedValue(c));
            assertEquals(before,c.snapshot());assertEquals(0,generations);evidence("keystore "+fault,before);
            master=valid;unavailable=false;assertEquals(A,SecureApiKey.load(c));otherStillReadable();
        }
    }
    @Test public void originMismatchRejectsRequestsButDiagnosticSnapshotStillResolves() throws Exception {
        DeepSeekConfig.saveBaseUrl(c,"https://other.invalid/v1");Map<String,Map<String,?>> before=c.snapshot();
        int r=reads;assertFalse(SecureApiKey.hasSavedValue(c));assertEquals("",SecureApiKey.load(c));assertEquals(r,reads);
        assertFalse(DeepSeekConfig.load(c).hasCredential);
        SecureApiKey.StoredCredential diagnostic=SecureApiKey.captureCredential(c);
        assertTrue(diagnostic.present());assertEquals(r,reads);assertEquals(A,diagnostic.resolve());
        assertEquals(before,c.snapshot());evidence("origin rejection / diagnostic only",before);
        DeepSeekConfig.saveBaseUrl(c,"https://alpha.invalid/v2");assertEquals(A,SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void legacyUnboundReadDoesNotWriteAndEndpointEditBindsOldOrigin() throws Exception {
        secret().edit().remove(VALUE+"_origin").apply();Map<String,Map<String,?>> before=c.snapshot();
        assertEquals(A,SecureApiKey.load(c));assertEquals(before,c.snapshot());
        DeepSeekConfig.saveBaseUrl(c,"https://other.invalid/v1");
        assertEquals("https://alpha.invalid",secret().getString(VALUE+"_origin",""));
        assertEquals("",SecureApiKey.load(c));unchangedOthers(before,GLOBAL,SECRET);evidence("legacy binding",before);
    }
    @Test public void corruptNamesAndWrongPreferenceTypesPropagateWithoutRepair() throws Exception {
        String original=c.getSharedPreferences(INDEX,0).getString("names","");
        for(Object invalid:Arrays.asList("{",Integer.valueOf(7))) {
            SharedPreferences.Editor edit=c.getSharedPreferences(INDEX,0).edit();
            if(invalid instanceof String)edit.putString("names",(String)invalid);else edit.putInt("names",7);edit.apply();
            Map<String,Map<String,?>> before=c.snapshot();
            throwsType(ConfigRead.Failure.class,()->ApiProfiles.list(c));
            assertEquals(before,c.snapshot());assertEquals("",SecureApiKey.load(c));assertFalse(DeepSeekConfig.load(c).ready());evidence("names corrupt / explicit unreadable",before);
        }
        c.getSharedPreferences(INDEX,0).edit().putString("names",original).apply();
        assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void wrongSecretActiveAndGlobalTypesAreNotCaughtByDecrypt() throws Exception {
        for(String store:Arrays.asList(SECRET,INDEX,GLOBAL)) {
            String key=store.equals(SECRET)?VALUE:store.equals(INDEX)?"active":"enabled";
            SharedPreferences p=c.getSharedPreferences(store,0);Object old=p.getAll().get(key);
            p.edit().putInt(key,7).apply();Map<String,Map<String,?>> before=c.snapshot();
            assertFalse(DeepSeekConfig.load(c).readable);assertFalse(DeepSeekConfig.load(c).ready());
            assertEquals(before,c.snapshot());evidence("typed "+key,before);
            SharedPreferences.Editor e=p.edit();if(old instanceof String)e.putString(key,(String)old);else if(old instanceof Boolean)e.putBoolean(key,(Boolean)old);else e.remove(key);e.apply();
            assertEquals(A,SecureApiKey.load(c));
        }
    }
    @Test public void unknownActiveAndNonStringNameAreUsedWithoutIndexRepair() throws Exception {
        String originalNames=c.getSharedPreferences(INDEX,0).getString("names","");
        c.getSharedPreferences(INDEX,0).edit().putString("names","{\"x\":7}").putString("active","ghost").apply();
        c.getSharedPreferences("caption_profile_ghost",0);Map<String,Map<String,?>> before=c.snapshot();
        throwsType(ConfigRead.Failure.class,()->ApiProfiles.list(c));
        throwsType(ConfigRead.Failure.class,()->ApiProfiles.active(c));
        assertFalse(DeepSeekConfig.load(c).ready());assertEquals("",DeepSeekConfig.load(c).model);
        assertEquals("",SecureApiKey.load(c));
        assertEquals(before,c.snapshot());evidence("unknown active / no guessed defaults",before);
        c.getSharedPreferences(INDEX,0).edit().putString("names",originalNames).apply();
        active("default");assertEquals(A,SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void malformedEndpointAndWrongModelTypePropagateWithoutDeletingCiphertext() throws Exception {
        Map<String,Map<String,?>> original=c.snapshot();
        for(String endpoint:Arrays.asList("not a URI","relative")) {
            ApiProfiles.values(c).edit().putString("base_url",endpoint).apply();Map<String,Map<String,?>> before=c.snapshot();
            assertEquals("",SecureApiKey.load(c));assertFalse(DeepSeekConfig.load(c).readable);assertFalse(DeepSeekConfig.load(c).ready());
            assertEquals(before,c.snapshot());evidence("bad endpoint",before);
        }
        ApiProfiles.values(c).edit().putString("base_url","https://alpha.invalid/v1").putInt("model",7).apply();
        Map<String,Map<String,?>> before=c.snapshot();assertFalse(DeepSeekConfig.load(c).readable);assertFalse(DeepSeekConfig.load(c).ready());
        assertEquals(before,c.snapshot());unchangedOthers(original,GLOBAL);otherStillReadable();
    }
    @Test public void keySaveFailureBeforeAndAfterEncryptionRetainsOriginalAndRecovers() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();unavailable=true;
        throwsType(GeneralSecurityException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(before,c.snapshot());evidence("encryption dependency denied",before);unavailable=false;
        c.fault(SECRET,"before");throwsType(IllegalStateException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(before,c.snapshot());evidence("encrypted then apply denied",before);c.recover();
        assertEquals(A,SecureApiKey.load(c));SecureApiKey.save(c,"fixture-replacement");
        assertEquals("fixture-replacement",SecureApiKey.load(c));otherStillReadable();unchangedOthers(before,SECRET);
    }
    @Test public void missingAliasSaveGenerationFailureDoesNotReplaceCiphertext() throws Exception {
        SecretKey saved=master;master=null;Map<String,Map<String,?>> before=c.snapshot();
        throwsType(InvalidAlgorithmParameterException.class,()->SecureApiKey.save(c,"fixture-replacement"));
        assertEquals(1,generations);assertEquals(before,c.snapshot());evidence("new master denied",before);
        master=saved;assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void applyDropCanReportSaveSuccessWhileOldCredentialRemains() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();c.fault(SECRET,"drop");
        SecureApiKey.save(c,"fixture-replacement");assertEquals(before,c.snapshot());assertEquals(A,SecureApiKey.load(c));
        assertEquals(Collections.singletonList(SECRET+":drop"),c.writes);evidence("silent apply drop",before);
        c.recover();SecureApiKey.save(c,"fixture-replacement");assertEquals("fixture-replacement",SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void realKeyEditorBlocksSwitchOnSaveFailureAndRecoversWithoutLosingDraft() throws Exception {
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);key.editor.setText("fixture-new-draft");
        Map<String,Map<String,?>> before=c.snapshot();unavailable=true;
        assertFalse(ApiProfiles.select(c,b));assertEquals("default",ApiProfiles.active(c));assertNotNull(key.editor.getError());
        assertEquals("fixture-new-draft",key.editor.getText().toString());assertEquals(before,c.snapshot());
        assertEquals(0,notices);assertEquals(0,refreshes);evidence("real key flush rejected",before);unavailable=false;
        assertTrue(ApiProfiles.select(c,b));assertEquals(B,SecureApiKey.load(c));
        active("default");assertEquals("fixture-new-draft",SecureApiKey.load(c));unchangedOthers(before,SECRET,INDEX);
    }
    @Test public void earlierUrlFlushPersistsEvenWhenLaterKeyFlushRefusesSwitch() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);
        url.editor.setText("https://edited.invalid/v1");key.editor.setText("fixture-new-draft");
        Map<String,Map<String,?>> before=c.snapshot();unavailable=true;
        assertFalse(ApiProfiles.select(c,b));assertEquals("default",ApiProfiles.active(c));
        assertEquals("https://edited.invalid/v1",ApiProfiles.values(c).getString("base_url",""));
        assertEquals(before.get(SECRET),c.snapshot().get(SECRET));unchangedOthers(before,GLOBAL);
        assertEquals(1,refreshes);assertEquals(1,notices);evidence("partial flush / origin unavailable; C1 runtime refresh",before);
        unavailable=false;assertEquals("",SecureApiKey.load(c));
        assertTrue(ApiProfiles.select(c,b));assertEquals(B,SecureApiKey.load(c));active("default");assertEquals("fixture-new-draft",SecureApiKey.load(c));
    }
    @Test public void partialFlushNotifiesRuntimeConfigurationAfterLaterKeyRefusesSwitch() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);
        url.editor.setText("https://edited.invalid/v1");key.editor.setText("fixture-new-draft");
        unavailable=true;
        assertFalse(ApiProfiles.select(c,b));assertEquals("default",ApiProfiles.active(c));
        assertEquals("https://edited.invalid/v1",ApiProfiles.values(c).getString("base_url",""));
        assertEquals(1,refreshes);
    }
    @Test public void partialFlushNotifiesRuntimeConfigurationWhenLaterEditorThrows() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://edited.invalid/v1");
        ApiProfiles.Editor bad=new ApiProfiles.Editor() {
            public boolean flushProfile(){throw new IllegalStateException("fixture editor throw");}
            public void profileChanged(){fail("must not notify");}
        };
        ApiProfiles.register(bad);
        try {
            try { ApiProfiles.select(c,b); fail("expected editor throw"); }
            catch (IllegalStateException expected) { }
            assertEquals("https://edited.invalid/v1",ApiProfiles.values(c).getString("base_url",""));
            assertEquals(1,refreshes);
        } finally { ApiProfiles.unregister(bad); }
    }
    @Test public void flushExceptKeyNotifiesAfterEarlierFieldSucceedsAndLaterEditorRefuses() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);
        url.editor.setText("https://except-key.invalid/v1");key.editor.setText("draft-key");
        ApiProfiles.Editor bad=new ApiProfiles.Editor() {
            public boolean flushProfile(){return false;}
            public void profileChanged(){fail("must not notify");}
        };
        ApiProfiles.register(bad);
        try {
            assertFalse(ApiProfiles.flushExceptKey());
            assertEquals("https://except-key.invalid/v1",ApiProfiles.values(c).getString("base_url",""));
            assertEquals("draft-key",key.editor.getText().toString());
            assertEquals(1,refreshes);
        } finally { ApiProfiles.unregister(bad); }
    }
    @Test public void successfulSwitchKeepsOneFinalRuntimeNotification() {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://edited-before-switch.invalid/v1");
        assertTrue(ApiProfiles.select(c,b));
        assertEquals(b,ApiProfiles.active(c));
        assertEquals(1,refreshes);
        assertEquals("https://beta.invalid/v1",DeepSeekConfig.load(c).baseUrl);
    }
    @Test public void directFlushWithoutChangesDoesNotRefreshRuntimeConfiguration() {
        assertTrue(ApiProfiles.flushCurrent());
        assertEquals(0,refreshes);
    }
    @Test public void independentAutomaticSaveStillRefreshesRuntimeConfiguration() {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://autosave.invalid/v1");
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper())
                .idleFor(java.time.Duration.ofSeconds(2));
        assertEquals("https://autosave.invalid/v1",ApiProfiles.values(c).getString("base_url",""));
        assertEquals(1,refreshes);
    }
    @Test public void keyEditorCanReportRetainedAfterApplyAlreadyReplacedCredential() throws Exception {
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);
        key.editor.setText("fixture-after-write");Map<String,Map<String,?>> before=c.snapshot();
        c.fault(SECRET,"after");assertFalse(ApiProfiles.select(c,b));
        assertEquals("default",ApiProfiles.active(c));assertNotNull(key.editor.getError());
        assertNotEquals(before.get(SECRET),c.snapshot().get(SECRET));
        assertEquals("fixture-after-write",SecureApiKey.load(c));unchangedOthers(before,SECRET);
        assertEquals(0,notices);assertEquals(1,refreshes);assertFalse(key.state.getText().toString().contains(CaptionStrings.get(c,"value_retained")));evidence("UI uncertain / visible mutation synchronized",before);
        c.recover();assertTrue(ApiProfiles.select(c,b));assertEquals(B,SecureApiKey.load(c));
    }
    @Test public void throwingEditorResetsFlushingAndDoesNotChangeActive() throws Exception {
        ApiProfiles.Editor bad=new ApiProfiles.Editor() {
            public boolean flushProfile(){throw new IllegalStateException("fixture editor throw");}
            public void profileChanged(){fail("must not notify");}
        };
        ApiProfiles.register(bad);Map<String,Map<String,?>> before=c.snapshot();
        try { throwsType(IllegalStateException.class,()->ApiProfiles.select(c,b));assertFalse(ApiProfiles.flushing());assertEquals(before,c.snapshot());evidence("editor throw",before); }
        finally { ApiProfiles.unregister(bad); }
        assertTrue(ApiProfiles.select(c,b));assertEquals(B,SecureApiKey.load(c));
    }
    @Test public void createIndexFailureLeavesOrphanValuesButOtherDataUntouched() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();c.fault(INDEX,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.create(c,"orphan","https://orphan.invalid"));
        unchangedOthers(before);Set<String> extra=new HashSet<>(c.stores.keySet());extra.removeAll(before.keySet());
        assertEquals(1,extra.size());String orphan=extra.iterator().next();
        assertEquals("https://orphan.invalid",c.getSharedPreferences(orphan,0).getString("base_url",""));
        assertEquals(2,ApiProfiles.list(c).size());evidence("create values then index refusal",before);
        c.recover();String id=ApiProfiles.create(c,"recovered","https://recover.invalid");assertTrue(ApiProfiles.select(c,id));assertEquals("",SecureApiKey.load(c));
    }
    @Test public void selectApplyAfterMutationThrowsWithNewActiveAndNoNotification() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();long revision=ApiProfiles.revision();c.fault(INDEX,"after");
        throwsType(IllegalStateException.class,()->ApiProfiles.select(c,b));
        assertEquals(b,ApiProfiles.active(c));assertEquals(B,SecureApiKey.load(c));
        assertEquals(revision+1,ApiProfiles.revision());assertEquals(1,notices);assertEquals(1,refreshes);
        unchangedOthers(before,INDEX);evidence("active changed / notification skipped",before);
        c.recover();assertTrue(ApiProfiles.select(c,"default"));assertEquals(A,SecureApiKey.load(c));
    }
    @Test public void deleteSecretFailureLeavesIndexChangedAndValuesCiphertextRetained() throws Exception {
        ApiProfiles.select(c,b);Map<String,Map<String,?>> before=c.snapshot();notices=refreshes=0;c.fault(SECRET,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.delete(c,b));
        assertEquals("default",ApiProfiles.active(c));assertFalse(ApiProfiles.list(c).containsKey(b));
        unchangedOthers(before,INDEX);assertEquals(1,notices);assertEquals(1,refreshes);
        assertEquals(A,SecureApiKey.load(c));evidence("delete index then secret refusal",before);
        c.recover();active(b);assertEquals("",SecureApiKey.load(c));
        c.getSharedPreferences(INDEX,0).edit().putString("names",(String)before.get(INDEX).get("names")).apply();
        assertEquals(B,SecureApiKey.load(c));active("default");
    }
    @Test public void deleteValuesFailureKeepsOrphanValuesAfterCiphertextWasRemoved() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();c.fault("caption_profile_"+b,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.delete(c,b));
        assertFalse(ApiProfiles.list(c).containsKey(b));assertFalse(secret().contains(VALUE+"_"+b));
        assertEquals(before.get("caption_profile_"+b),c.snapshot().get("caption_profile_"+b));
        unchangedOthers(before,INDEX,SECRET);assertEquals(A,SecureApiKey.load(c));evidence("delete secret then values refusal",before);
    }
    @Test public void legacyBindingCanPersistBeforeEndpointWriteFails() throws Exception {
        secret().edit().remove(VALUE+"_origin").apply();Map<String,Map<String,?>> before=c.snapshot();c.fault(GLOBAL,"before");
        throwsType(IllegalStateException.class,()->DeepSeekConfig.saveBaseUrl(c,"https://other.invalid"));
        assertEquals("https://alpha.invalid",secret().getString(VALUE+"_origin",""));
        unchangedOthers(before,SECRET);assertEquals(A,SecureApiKey.load(c));evidence("binding then endpoint failure",before);
        c.recover();DeepSeekConfig.saveBaseUrl(c,"https://other.invalid");assertEquals("",SecureApiKey.load(c));otherStillReadable();
    }
    @Test public void successfulLegacyDeletionPreservesGlobalStyleAndOtherCredential() throws Exception {
        Map<String,Map<String,?>> before=c.snapshot();ApiProfiles.delete(c,"default");
        assertEquals(b,ApiProfiles.active(c));assertEquals(B,SecureApiKey.load(c));
        assertTrue(DeepSeekConfig.enabled(c));assertEquals(3,DeepSeekConfig.displayStyle(c).captionSizeTier);
        assertFalse(ApiProfiles.values(c,"default").contains("base_url"));assertFalse(secret().contains(VALUE));
        assertTrue(c.getSharedPreferences(INDEX,0).getBoolean("legacy_deleted",false));
        unchangedOthers(before,INDEX,SECRET,GLOBAL);evidence("normal legacy delete",before);
    }
    @Test public void successfulDirectFlushMustSynchronizeSavedConfiguration() throws Exception {
        Map<String,Map<String,?>> entry=c.snapshot();
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://direct-flush.invalid/v1");
        assertTrue(ApiProfiles.flushCurrent());
        assertEquals("https://direct-flush.invalid/v1",DeepSeekConfig.load(c).baseUrl);
        assertFalse(DeepSeekConfig.load(c).ready());
        assertFalse(ApiProfiles.flushing());
        System.out.println("M5G_PROBE direct success endpoint="+DeepSeekConfig.load(c).baseUrl+" refreshes="+refreshes);
        unchangedOthers(entry,GLOBAL);
        evidence("R1 successful direct flush",entry);
        assertEquals("a successful direct flush also changes the running configuration",1,refreshes);
        assertTrue(ApiProfiles.flushCurrent());
        assertEquals("unchanged repeat is quiet",1,refreshes);
    }

    @Test public void successfulSkipKeyFlushMustSynchronizeSavedConfiguration() throws Exception {
        Map<String,Map<String,?>> entry=c.snapshot();
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        DeepSeekTextPreference key=field(DeepSeekTextPreference.KEY_API_KEY);
        String original=secret().getString(VALUE,"");
        url.editor.setText("https://skip-key.invalid/v1");
        key.editor.setText("fixture-unsaved-key");
        assertTrue(ApiProfiles.flushExceptKey());
        assertEquals("https://skip-key.invalid/v1",DeepSeekConfig.load(c).baseUrl);
        assertEquals(original,secret().getString(VALUE,""));
        assertEquals("fixture-unsaved-key",key.editor.getText().toString());
        System.out.println("M5G_PROBE skip-key success refreshes="+refreshes+" ciphertext_retained=true");
        unchangedOthers(entry,GLOBAL);
        evidence("R1 skip key",entry);
        assertEquals("skipping the key does not suppress notification of a saved URL",1,refreshes);
        assertTrue(ApiProfiles.flushExceptKey());
        assertEquals(1,refreshes);
        assertEquals("fixture-unsaved-key",key.editor.getText().toString());
    }

    @Test public void cancellingClearKeyConfirmationStillSynchronizesSavedUrl() throws Exception {
        Map<String,Map<String,?>> entry=c.snapshot();
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        String original=secret().getString(VALUE,"");
        url.editor.setText("https://clear-cancel.invalid/v1");
        new ApiProfilesPreference(c).clearCurrentKey();
        android.app.Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertNotNull(dialog);
        assertTrue(dialog.isShowing());
        assertTrue(dialog.getWindow().getDecorView().findViewWithTag("caption_dialog_cancel").performClick());
        assertFalse(dialog.isShowing());
        assertEquals("default",ApiProfiles.active(c));
        assertEquals("https://clear-cancel.invalid/v1",DeepSeekConfig.load(c).baseUrl);
        assertEquals(original,secret().getString(VALUE,""));
        System.out.println("M5G_PROBE real clear/cancel endpoint_saved=true secret_retained=true refreshes="+refreshes);
        unchangedOthers(entry,GLOBAL);
        evidence("R1 clear cancelled",entry);
        assertEquals("cancelling key deletion does not undo the URL save and must not leave the runtime stale",1,refreshes);
    }

    @Test public void testApiMissingCredentialReturnStillSynchronizesSavedUrlR1() throws Exception {
        Map<String,Map<String,?>> entry=c.snapshot();
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://test-api-return.invalid/v1");
        DeepSeekActionPreference action=new DeepSeekActionPreference(c);
        action.setKey(DeepSeekActionPreference.KEY_TEST);
        assertTrue(action.getOnPreferenceClickListener().onPreferenceClick(action));
        assertFalse(DeepSeekConfig.load(c).hasCredential);
        assertEquals(1,refreshes);
        assertTrue(action.isEnabled());
        assertEquals(0,connections);
        unchangedOthers(entry,GLOBAL);evidence("R1 real testApi early return",entry);
    }
    @Test public void clearKeyLateConfirmationOnlyClearsCapturedProfileR1() throws Exception {
        String old=secret().getString(VALUE,"");
        new ApiProfilesPreference(c).clearCurrentKey();
        android.app.Dialog dialog=org.robolectric.shadows.ShadowDialog.getLatestDialog();
        assertTrue(ApiProfiles.select(c,b));
        assertTrue(dialog.getWindow().getDecorView().findViewWithTag("caption_dialog_confirm").performClick());
        assertEquals(b,ApiProfiles.active(c));assertEquals(B,SecureApiKey.load(c));
        active("default");assertEquals("",SecureApiKey.load(c));assertFalse(secret().contains(VALUE));
        assertFalse(old.isEmpty());
    }
    @Test public void selectWriteBeforeFailureStillNotifiesEarlierSavedUrlR1() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://switch-write-failure.invalid/v1");
        c.fault(INDEX,"before");
        throwsType(IllegalStateException.class,()->ApiProfiles.select(c,b));
        assertEquals("default",ApiProfiles.active(c));
        assertEquals("https://switch-write-failure.invalid/v1",DeepSeekConfig.load(c).baseUrl);
        assertEquals(1,refreshes);assertFalse(ApiProfiles.flushing());
        c.recover();assertTrue(ApiProfiles.flushCurrent());assertEquals(1,refreshes);
    }
    @Test public void selectRebindFailureStillSendsOneFinalNotificationR1() throws Exception {
        DeepSeekTextPreference url=field(DeepSeekTextPreference.KEY_BASE_URL);
        url.editor.setText("https://switch-rebind-failure.invalid/v1");
        ApiProfiles.Editor bad=new ApiProfiles.Editor() {
            public boolean flushProfile(){return true;}
            public void profileChanged(){throw new IllegalStateException("fixture rebind");}
        };
        ApiProfiles.register(bad);
        try {
            throwsType(IllegalStateException.class,()->ApiProfiles.select(c,b));
            assertEquals(b,ApiProfiles.active(c));assertEquals(1,refreshes);
            assertFalse(ApiProfiles.flushing());
        } finally {ApiProfiles.unregister(bad);}
    }
}
