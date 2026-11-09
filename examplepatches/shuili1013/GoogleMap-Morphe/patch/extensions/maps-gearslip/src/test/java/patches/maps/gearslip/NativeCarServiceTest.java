package patches.maps.gearslip;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;
import android.content.Intent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.app.Activity;
import android.graphics.SurfaceTexture;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.os.Parcel;
import android.view.Surface;
import android.view.View;
import android.view.Window;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.car.app.IAppManager;
import androidx.car.app.SurfaceContainer;
import androidx.car.app.serialization.Bundleable;
import androidx.car.app.model.TemplateWrapper;
import androidx.car.app.model.ListTemplate;
import androidx.car.app.model.Row;
import androidx.car.app.navigation.model.NavigationTemplate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ServiceController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowBinder;
import org.robolectric.shadows.ShadowSurface;
import org.robolectric.annotation.RealObject;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class NativeCarServiceTest {
    private static final int HOST_UID = 10042;
    private static final String HOST = "app.seb3thehacker.gearslip";
    private ServiceController<NativeCarService> controller;
    private NativeCarService service;
    private IBinder car;

    @Before public void startService() {
        controller = Robolectric.buildService(NativeCarService.class).create();
        service = controller.get();
        car = service.onBind(new Intent("androidx.car.app.CarAppService"));
        ShadowBinder.setCallingUid(HOST_UID);
        shadowOf(service.getPackageManager()).setPackagesForUid(HOST_UID, HOST);
    }
    @After public void stopService() {
        controller.destroy(); shadowOf(Looper.getMainLooper()).idle(); ShadowBinder.reset();
    }

    @Test public void appInfoIsAvailableBeforeTheHostCanObtainCapabilities() throws Exception {
        Response info = call(car, "ICarApp", 10, data -> {});
        assertEquals(2, info.code);
        assertEquals("androidx.car.app.AppInfo", info.value.getString("tag_class_name"));
        Response manager = call(car, "ICarApp", 9, data -> data.writeString("app"));
        assertSecurity(manager);
    }

    @Test public void explicitComponentBindingWithoutAnActionStillRequiresAnAuthenticatedHandshake() throws Exception {
        Intent explicit = new Intent().setComponent(new ComponentName("org.ungoogled.android.apps.maps", NativeCarService.class.getName()));
        IBinder binder = service.onBind(explicit);
        assertNotNull("Android Auto's explicit component bind must receive the protocol Binder", binder);
        Response info = call(binder, "ICarApp", 10, data -> {});
        assertEquals(2, info.code);
        assertSecurity(call(binder, "ICarApp", 9, data -> data.writeString("app")));
    }

    @Test public void managerRemainsBoundToTheAuthenticatedBinderUid() throws Exception {
        handshake(HOST);
        IBinder app = manager();
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(app, "IAppManager", 2, data -> {}));
    }

    @Test public void managerResponseDecodesAsATypedInterfaceForTheActualCarAppLibraryHost() throws Exception {
        handshake(HOST);
        Response response = call(car, "ICarApp", 9, data -> data.writeString("app"));
        Parcel wire = Parcel.obtain();
        try {
            wire.writeBundle(response.value); wire.setDataPosition(0);
            Object manager = Bundleable.CREATOR.createFromParcel(wire).get();
            assertTrue("Android Auto casts the decoded manager to IAppManager", manager instanceof IAppManager);
        } finally { wire.recycle(); }
    }

    @Test public void navigationManagerUsesTheActualLibraryInterfaceAndRejectsReplacedSessions()throws Exception{
        handshake(HOST);
        Response response=call(car,"ICarApp",9,data->data.writeString("navigation"));
        Parcel wire=Parcel.obtain();
        try{wire.writeBundle(response.value);wire.setDataPosition(0);assertTrue(Bundleable.CREATOR.createFromParcel(wire).get() instanceof androidx.car.app.navigation.INavigationManager);}
        finally{wire.recycle();}
        IBinder navigation=response.value.getBinder("tag_value");handshake(HOST);
        assertSecurity(call(navigation,"navigation.INavigationManager",2,data->{}));
    }

    @Test public void nativeGuidanceOwnsNavigationAndStopWaitsForActualNativeConfirmation()throws Exception{
        handshake(HOST);
        java.lang.reflect.Field active=NativeCarService.class.getDeclaredField("active");active.setAccessible(true);Object session=active.get(service);
        java.util.List<Integer> events=new java.util.ArrayList<>();
        Binder host=new Binder(){@Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            data.enforceInterface("androidx.car.app.navigation.INavigationHost");events.add(code);
            if(code==4)assertNotNull(CarProtocol.readBundleable(data));reply.writeNoException();return true;
        }};
        java.lang.reflect.Field navigationHost=session.getClass().getDeclaredField("navigationHost");navigationHost.setAccessible(true);navigationHost.set(session,host);
        java.lang.reflect.Method update=NativeCarService.class.getDeclaredMethod("navigation",session.getClass(),NativeGuidance.Snapshot.class);update.setAccessible(true);
        update.invoke(service,session,new NativeGuidance.Snapshot(false,null,0,0));assertTrue(events.isEmpty());
        update.invoke(service,session,new NativeGuidance.Snapshot(true,"Turn right",120,15));assertEquals(java.util.Arrays.asList(2,4),events);
        update.invoke(service,session,new NativeGuidance.Snapshot(true,"Turn right",90,12));assertEquals(java.util.Arrays.asList(2,4,4),events);
        IBinder navigation=call(car,"ICarApp",9,data->data.writeString("navigation")).value.getBinder("tag_value");
        Response stopped=new Response();Parcel request=Parcel.obtain();
        try{request.writeInterfaceToken("androidx.car.app.navigation.INavigationManager");request.writeStrongBinder(stopped);request.setDataPosition(0);assertTrue(navigation.transact(2,request,null,IBinder.FLAG_ONEWAY));}
        finally{request.recycle();}
        shadowOf(Looper.getMainLooper()).idle();assertEquals(0,stopped.code);
        Intent stop=shadowOf(service).getNextStartedService();assertNotNull(stop);
        assertEquals("com.google.android.libraries.geo.navcore.service.base.NavigationService",stop.getComponent().getClassName());assertTrue(stop.getBooleanExtra("abortcurrentsession",false));
        update.invoke(service,session,new NativeGuidance.Snapshot(false,null,0,0));assertEquals(2,stopped.code);assertEquals(Integer.valueOf(3),events.get(events.size()-1));
    }

    @Test public void testHostPackageCannotAuthenticateInProduction() throws Exception {
        String testHost = HOST + ".morphetest";
        shadowOf(service.getPackageManager()).setPackagesForUid(HOST_UID, testHost);
        Response response = handshakeResponse(testHost);
        assertSecurity(response);
    }

    @Test public void managerFromAnEarlierHandshakeCannotOperateTheReplacementSession() throws Exception {
        handshake(HOST);
        IBinder earlier = manager();
        handshake(HOST);
        assertSecurity(call(earlier, "IAppManager", 2, data -> {}));
    }
    @Test public void panCapabilityRejectsAnotherUidAndAReplacedSessionWithARealCallback() throws Exception {
        handshake(HOST);
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        Object session = active.get(service);
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses())
                .filter(c -> c.getSimpleName().equals("PanBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass());
        constructor.setAccessible(true); IBinder pan = (IBinder) constructor.newInstance(service, session);
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(pan, "navigation.model.IPanModeListener", 2, data -> data.writeInt(1)));
        ShadowBinder.setCallingUid(HOST_UID); handshake(HOST);
        assertSecurity(call(pan, "navigation.model.IPanModeListener", 2, data -> data.writeInt(0)));
    }

    @Test public void unbindingClosesPreviouslyIssuedCapabilities() throws Exception {
        handshake(HOST);
        IBinder app = manager();
        service.onUnbind(new Intent("androidx.car.app.CarAppService"));
        shadowOf(Looper.getMainLooper()).idle();
        assertSecurity(call(app, "IAppManager", 2, data -> {}));
    }

    @Test public void unbindingAnUnauthenticatedMetadataInterfacePreservesTheOwnersSession() throws Exception {
        handshake(HOST);
        Intent metadata = new Intent("metadata.only");
        IBinder other = service.onBind(metadata);
        assertEquals(2, call(other, "ICarApp", 10, data -> {}).code);
        service.onUnbind(metadata);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(2, call(car, "ICarApp", 9, data -> data.writeString("app")).code);
    }

    @Test public void unbindingAnOlderFilterCannotCloseAReplacementSession() throws Exception {
        handshake(HOST);
        IBinder other = service.onBind(new Intent("replacement.host.interface"));
        assertEquals(2, handshakeResponse(other, HOST).code);
        service.onUnbind(new Intent("androidx.car.app.CarAppService"));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(2, call(other, "ICarApp", 9, data -> data.writeString("app")).code);
    }

    @Test public void anOldPublishedInterfaceCannotOperateAnotherFiltersCurrentSession() throws Exception {
        handshake(HOST);
        IBinder other = service.onBind(new Intent("replacement.host.interface"));
        assertEquals(2, handshakeResponse(other, HOST).code);
        assertSecurity(call(car, "ICarApp", 9, data -> data.writeString("app")));
    }

    @Test public void cachedPublishedBinderRebindsWithoutOldQueuedCleanupClosingTheNewSession() throws Exception {
        Intent owner = new Intent("androidx.car.app.CarAppService");
        handshake(HOST);
        IBinder oldManager = manager();
        assertTrue("Request onRebind because Android caches the published Binder", service.onUnbind(owner));
        service.onRebind(owner);
        assertEquals(2, handshakeResponse(car, HOST).code); // Reuse the cached Binder, without another onBind.
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(2, call(car, "ICarApp", 9, data -> data.writeString("app")).code);
        assertSecurity(call(oldManager, "IAppManager", 2, data -> {}));
    }

    @Test public void templatesCannotPretendToRenderBeforeTheAppIsCreated() throws Exception {
        handshake(HOST);
        Response response = call(manager(), "IAppManager", 2, data -> {});
        assertEquals(3, response.code);
        assertTrue(CarProtocol.member(response.value, "mStackTrace").getString("tag_value").contains("not been created"));
    }

    @Test public void hostBinderDeathClosesTheSessionAndItsIssuedManager() throws Exception {
        handshake(HOST);
        IBinder app = manager();
        DyingHost host = new DyingHost();
        call(car, "ICarApp", 2, data -> {
            data.writeStrongBinder(host); data.writeInt(0); data.writeInt(0);
        });
        assertNotNull(host.death);
        host.death.binderDied();
        shadowOf(Looper.getMainLooper()).idle();
        assertSecurity(call(app, "IAppManager", 2, data -> {}));
    }

    @Test @Config(shadows = ReleasedSurface.class)
    public void queuedDestructionAfterUnbindAcknowledgesCleanupAndReleasesItsParcelReference() throws Exception {
        handshake(HOST);
        DyingHost host = new DyingHost();
        call(car, "ICarApp", 2, data -> { data.writeStrongBinder(host); data.writeInt(0); data.writeInt(0); });
        assertNotNull(host.surface);
        Surface surface = new Surface(new SurfaceTexture(0));
        Bundle container = CarProtocol.object("androidx.car.app.SurfaceContainer");
        Bundle value = new Bundle(); value.putInt("tag_class_type", 0); value.putParcelable("tag_value", surface);
        CarProtocol.field(container, "mSurface", value);
        Response response = new Response();
        sendDestruction(host.surface, container, response);
        service.onUnbind(new Intent("androidx.car.app.CarAppService"));
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(2, response.code);
        assertNotNull(ReleasedSurface.lastReleased);
        assertFalse(ReleasedSurface.lastReleased.isValid());
        surface.release();
    }

    @Test public void closedSurfaceCapabilityStillRejectsAnotherUid() throws Exception {
        handshake(HOST);
        DyingHost host = new DyingHost();
        call(car, "ICarApp", 2, data -> { data.writeStrongBinder(host); data.writeInt(0); data.writeInt(0); });
        assertNotNull(host.surface);
        service.onUnbind(new Intent("androidx.car.app.CarAppService"));
        shadowOf(Looper.getMainLooper()).idle();
        ShadowBinder.setCallingUid(HOST_UID + 1);
        Bundle container = CarProtocol.object("androidx.car.app.SurfaceContainer");
        Bundle value = new Bundle(); value.putInt("tag_class_type", 0);
        CarProtocol.field(container, "mSurface", value);
        Response response = new Response();
        sendDestruction(host.surface, container, response);
        shadowOf(Looper.getMainLooper()).idle();
        assertSecurity(response);
    }

    @Test public void hostKeyboardEditsAndSubmissionReachTheOriginalInputConnectionThenRestoreNativeResults() throws Exception {
        handshake(HOST);
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder manager = manager(), search = searchCallback(manager);
        assertEquals(2, call(search, "model.ISearchCallback", 2, data -> data.writeString("Dam")).code);
        assertEquals("Dam", editor.field.getText().toString());
        assertEquals(2, call(search, "model.ISearchCallback", 2, data -> data.writeString("Dam Square")).code);
        assertEquals("Dam Square", editor.field.getText().toString());
        assertEquals(2, call(search, "model.ISearchCallback", 3, data -> data.writeString("Mr. Visserplein")).code);
        assertEquals("Mr. Visserplein", editor.submitted);
        assertEquals("androidx.car.app.navigation.model.NavigationTemplate", template(manager).getString("tag_class_name"));
        assertSecurity(call(search, "model.ISearchCallback", 2, data -> data.writeString("stale")));
        assertEquals("Mr. Visserplein", editor.field.getText().toString());
    }

    @Test public void anOlderEditorCannotMutateOrPoisonTheCurrentKeyboard() throws Exception {
        handshake(HOST);
        focusEditor("Amsterdam");
        IBinder manager = manager(), previous = searchCallback(manager);
        ProjectedEditor current = focusEditor("Utrecht");
        assertSecurity(call(previous, "model.ISearchCallback", 2, data -> data.writeString("wrong")));
        assertEquals("Utrecht", current.field.getText().toString());
        assertEquals("androidx.car.app.model.SearchTemplate", template(manager).getString("tag_class_name"));
    }

    @Test public void backDismissesTheHostKeyboardAndRevokesItsSearchCapability() throws Exception {
        handshake(HOST);
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder manager = manager(), search = searchCallback(manager);
        assertEquals(2, call(manager, "IAppManager", 3, data -> {}).code);
        assertEquals("androidx.car.app.navigation.model.NavigationTemplate", template(manager).getString("tag_class_name"));
        assertSecurity(call(search, "model.ISearchCallback", 2, data -> data.writeString("wrong")));
        assertEquals("Amsterdam", editor.field.getText().toString());
    }

    @Test public void anotherUidCannotUseTheIssuedSearchCallback() throws Exception {
        handshake(HOST);
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder search = searchCallback(manager());
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(search, "model.ISearchCallback", 2, data -> data.writeString("wrong")));
        assertEquals("Amsterdam", editor.field.getText().toString());
    }

    @Test public void aRealNullSurfaceDestroyedParcelAcknowledgesCleanupAndKeepsTheNativeEditor() throws Exception {
        handshake(HOST);
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder manager = manager(), search = searchCallback(manager);
        Response response = call(surfaceCapability(), "ISurfaceCallback", 5, data -> { data.writeInt(1); data.writeBundle(nullSurfaceContainer()); });
        assertEquals(2, response.code);
        assertEquals("androidx.car.app.model.SearchTemplate", template(manager).getString("tag_class_name"));
        assertEquals(2, call(search, "model.ISearchCallback", 2, data -> data.writeString("Utrecht")).code);
        assertEquals("Utrecht", editor.field.getText().toString());
    }

    @Test public void aRealNullSurfaceAvailableParcelWaitsForOutputWithoutFailingTheSession() throws Exception {
        handshake(HOST);
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder manager = manager(), search = searchCallback(manager);
        Response response = call(surfaceCapability(), "ISurfaceCallback", 2, data -> { data.writeInt(1); data.writeBundle(nullSurfaceContainer()); });
        assertEquals(2, response.code);
        assertEquals("androidx.car.app.model.SearchTemplate", template(manager).getString("tag_class_name"));
        assertEquals(2, call(search, "model.ISearchCallback", 2, data -> data.writeString("Rotterdam")).code);
        assertEquals("Rotterdam", editor.field.getText().toString());
    }

    @Test public void nullSurfaceParcelsDoNotBypassTheCapturedOwnersUid() throws Exception {
        handshake(HOST); focusEditor("Amsterdam");
        IBinder surface = surfaceCapability();
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(surface, "ISurfaceCallback", 5, data -> { data.writeInt(1); data.writeBundle(nullSurfaceContainer()); }));
        assertSecurity(call(surface, "ISurfaceCallback", 2, data -> { data.writeInt(1); data.writeBundle(nullSurfaceContainer()); }));
    }

    private IBinder surfaceCapability() throws Exception {
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        Object session = active.get(service);
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses())
                .filter(candidate -> candidate.getSimpleName().equals("SurfaceBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass());
        constructor.setAccessible(true); return (IBinder) constructor.newInstance(service, session);
    }

    private IBinder actionCapability() throws Exception {
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        Object session = active.get(service);
        java.lang.reflect.Field renderer = session.getClass().getDeclaredField("renderer"); renderer.setAccessible(true);
        renderer.set(session, new ProjectionRenderer(service, error -> { throw new AssertionError(error); }));
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses())
                .filter(candidate -> candidate.getSimpleName().equals("ActionBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass(), NativeControls.Control.class);
        constructor.setAccessible(true); return (IBinder) constructor.newInstance(service, session, null);
    }

    @Test public void standardActionCallbacksRequireTheAuthenticatedHostUid() throws Exception {
        handshake(HOST); IBinder action = actionCapability();
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(action, "model.IOnClickListener", 2, data -> {}));
        ShadowBinder.setCallingUid(HOST_UID);
        assertEquals(2, call(action, "model.IOnClickListener", 2, data -> {}).code);
    }

    @Test public void standardActionCallbacksCannotReviveAReplacedSession() throws Exception {
        handshake(HOST); IBinder action = actionCapability(); handshake(HOST);
        assertSecurity(call(action, "model.IOnClickListener", 2, data -> {}));
    }

    @Test public void oldNavigationActionsCannotInterruptTheHostKeyboard() throws Exception {
        handshake(HOST); IBinder action = actionCapability(); ProjectedEditor editor = focusEditor("Amsterdam");
        assertSecurity(call(action, "model.IOnClickListener", 2, data -> {}));
        assertEquals("androidx.car.app.model.SearchTemplate", template(manager()).getString("tag_class_name"));
        assertEquals("Amsterdam", editor.field.getText().toString());
    }

    public static final class TemplatePresentation {
        private final Window window;
        TemplatePresentation(Window window) { this.window = window; }
        public Window f() { return window; }
    }
    public static final class TemplateController {
        public final TemplatePresentation k;
        TemplateController(Window window) { k = new TemplatePresentation(window); }
        public void m(int state, boolean flag) {}
        public void k() {}
    }
    @Test public void anUnmodifiedCalHostReceivesNativeActionsAndAStandardOverflowList() throws Exception {
        handshake(HOST);
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        java.util.Map<Integer, String> names = new java.util.HashMap<>(); names.put(0x7f990001, "map_buttons_view_container");
        Resources original = activity.getResources();
        Resources resources = new Resources(activity.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return names.containsKey(id) ? names.get(id) : super.getResourceEntryName(id); }
        };
        Context context = new ContextWrapper(activity) { @Override public Resources getResources() { return resources; } };
        FrameLayout root = new FrameLayout(context), group = new FrameLayout(context); group.setId(0x7f990001);
        root.addView(group, new FrameLayout.LayoutParams(640, 480)); activity.setContentView(root);
        java.util.Map<NativeControls.Role, Integer> clicks = new java.util.EnumMap<>(NativeControls.Role.class);
        int id = 0x7f990010;
        for (NativeControls.Role role : NativeControls.Role.values()) {
            names.put(id, role.names[0]); ImageView view = new ImageView(context); view.setId(id++);
            view.setImageDrawable(new ColorDrawable(Color.BLUE)); view.setOnClickListener(v -> clicks.merge(role, 1, Integer::sum));
            group.addView(view, new FrameLayout.LayoutParams(64, 64));
        }
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        ProjectionRenderer renderer = new ProjectionRenderer(service, error -> { throw new AssertionError(error); });
        java.lang.reflect.Field created = ProjectionRenderer.class.getDeclaredField("created"); created.setAccessible(true); created.set(renderer, true);
        java.lang.reflect.Field nativeController = ProjectionRenderer.class.getDeclaredField("controller"); nativeController.setAccessible(true);
        nativeController.set(renderer, new TemplateController(activity.getWindow()));
        java.lang.reflect.Field current = session.getClass().getDeclaredField("renderer"); current.setAccessible(true); current.set(session, renderer);
        IBinder app = manager(); NavigationTemplate navigation = (NavigationTemplate) decodedTemplate(app);
        assertEquals(4, navigation.getActionStrip().getActions().size());
        assertEquals(4, navigation.getMapActionStrip().getActions().size());
        assertEquals(View.INVISIBLE, group.getVisibility());
        new NavigationTemplate.Builder().setActionStrip(navigation.getActionStrip()).setMapActionStrip(navigation.getMapActionStrip()).build();
        assertNotNull(navigation.getPanModeDelegate());
        navigation.getPanModeDelegate().sendPanModeChanged(true, done());
        navigation.getPanModeDelegate().sendPanModeChanged(false, done());
        shadowOf(Looper.getMainLooper()).idle();
        navigation.getActionStrip().getActions().get(3).getOnClickDelegate().sendClick(done());
        shadowOf(Looper.getMainLooper()).idle();
        ListTemplate more = (ListTemplate) decodedTemplate(app);
        Row row = more.getSingleList().getItems().stream().map(item -> (Row) item)
                .filter(item -> item.getTitle().toString().equals("Report incident")).findFirst().get();
        row.getOnClickDelegate().sendClick(done()); shadowOf(Looper.getMainLooper()).idle();
        assertEquals(Integer.valueOf(1), clicks.get(NativeControls.Role.REPORT));
        assertEquals(View.INVISIBLE, group.getVisibility()); assertTrue(decodedTemplate(app) instanceof NavigationTemplate);
    }
    private static androidx.car.app.OnDoneCallback done() {
        return new androidx.car.app.OnDoneCallback() {
            @Override public void onSuccess(Bundleable response) {}
            @Override public void onFailure(Bundleable error) { throw new AssertionError("CAL action was rejected"); }
        };
    }
    private static Object decodedTemplate(IBinder app) throws Exception {
        Response response = call(app, "IAppManager", 2, data -> {}); assertEquals(2, response.code);
        Parcel wire = Parcel.obtain();
        try { wire.writeBundle(response.value); wire.setDataPosition(0); return ((TemplateWrapper) Bundleable.CREATOR.createFromParcel(wire).get()).getTemplate(); }
        finally { wire.recycle(); }
    }

    private static Bundle nullSurfaceContainer() {
        Parcel parcel = Parcel.obtain();
        try {
            Bundleable.create(new SurfaceContainer(null, 800, 400, 160)).writeToParcel(parcel, 0);
            parcel.setDataPosition(0);
            Bundle value = parcel.readBundle(NativeCarServiceTest.class.getClassLoader());
            assertFalse("The real CAL serializer omits null object fields", value.containsKey("androidx.car.app.SurfaceContainermSurface"));
            return value;
        } catch (Exception error) { throw new AssertionError(error); }
        finally { parcel.recycle(); }
    }

    private ProjectedEditor focusEditor(String initial) throws Exception {
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        Object session = active.get(service);
        java.lang.reflect.Field renderer = session.getClass().getDeclaredField("renderer"); renderer.setAccessible(true);
        if (renderer.get(session) == null) {
            // The original Maps service is absent in a JVM. Exercise the transport's real
            // native-input callback boundary without launching that external renderer.
            renderer.set(session, new ProjectionRenderer(service, error -> { throw new AssertionError(error); }));
        }
        ProjectedEditor editor = new ProjectedEditor(initial);
        java.lang.reflect.Method show = NativeCarService.class.getDeclaredMethod("showKeyboard", session.getClass(), IBinder.class, android.view.inputmethod.EditorInfo.class);
        show.setAccessible(true); show.invoke(service, session, editor, editor.info);
        shadowOf(Looper.getMainLooper()).idle();
        return editor;
    }

    private static Bundle template(IBinder manager) throws Exception {
        Response response = call(manager, "IAppManager", 2, data -> {}); assertEquals(2, response.code);
        return CarProtocol.member(response.value, "mTemplate");
    }

    private static IBinder searchCallback(IBinder manager) throws Exception {
        Bundle template = template(manager);
        assertEquals("androidx.car.app.model.SearchTemplate", template.getString("tag_class_name"));
        return CarProtocol.member(CarProtocol.member(template, "mSearchCallbackDelegate"), "mStubCallback").getBinder("tag_value");
    }

    private static void sendDestruction(IBinder surface, Bundle container, Response response) throws Exception {
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken("androidx.car.app.ISurfaceCallback"); data.writeInt(1); data.writeBundle(container);
            data.writeStrongBinder(response); assertTrue(surface.transact(5, data, null, IBinder.FLAG_ONEWAY));
        } finally { data.recycle(); }
    }

    private void handshake(String packageName) throws Exception { assertEquals(2, handshakeResponse(packageName).code); }

    private Response handshakeResponse(String packageName) throws Exception {
        return handshakeResponse(car, packageName);
    }

    private Response handshakeResponse(IBinder target, String packageName) throws Exception {
        Bundle handshake = CarProtocol.object("androidx.car.app.HandshakeInfo");
        CarProtocol.field(handshake, "mHostPackageName", CarProtocol.primitive(packageName));
        CarProtocol.field(handshake, "mHostCarAppApiLevel", CarProtocol.primitive(7));
        return call(target, "ICarApp", 11, data -> { data.writeInt(1); data.writeBundle(handshake); });
    }

    private IBinder manager() throws Exception {
        Response response = call(car, "ICarApp", 9, data -> data.writeString("app"));
        assertEquals(2, response.code);
        IBinder manager = response.value.getBinder("tag_value"); assertNotNull(manager); return manager;
    }

    private static void assertSecurity(Response response) {
        assertEquals(3, response.code);
        assertEquals(4, CarProtocol.member(response.value, "mErrorType").getInt("tag_value"));
    }

    private static Response call(IBinder target, String descriptor, int code, CarProtocol.Writer writer) throws Exception {
        Response response = new Response();
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken("androidx.car.app." + descriptor); writer.write(data); data.writeStrongBinder(response);
            assertTrue(target.transact(code, data, null, IBinder.FLAG_ONEWAY));
            shadowOf(Looper.getMainLooper()).idle();
            assertTrue("callback was not delivered", response.code != 0);
            return response;
        } finally { data.recycle(); }
    }

    private static final class Response extends Binder {
        int code;
        Bundle value;
        @Override protected boolean onTransact(int transaction, Parcel data, Parcel reply, int flags) {
            data.enforceInterface("androidx.car.app.IOnDoneCallback");
            code = transaction; value = CarProtocol.readBundleable(data); reply.writeNoException(); return true;
        }
    }

    private static final class DyingHost extends Binder {
        DeathRecipient death;
        IBinder surface;
        @Override public void linkToDeath(DeathRecipient recipient, int flags) { death = recipient; }
        @Override public boolean unlinkToDeath(DeathRecipient recipient, int flags) { death = null; return true; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            data.enforceInterface("androidx.car.app.ICarHost");
            if (code != 3) return false;
            data.readString(); reply.writeNoException();
            reply.writeStrongBinder(new Binder() {
                @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
                    data.enforceInterface("androidx.car.app.IAppHost");
                    if (code == 4) surface = data.readStrongBinder();
                    reply.writeNoException(); return true;
                }
            }); return true;
        }
    }

    @Implements(Surface.class)
    public static class ReleasedSurface extends ShadowSurface {
        @RealObject private Surface real;
        static Surface lastReleased;
        @Implementation @Override protected void release() { super.release(); lastReleased = real; }
    }
}
