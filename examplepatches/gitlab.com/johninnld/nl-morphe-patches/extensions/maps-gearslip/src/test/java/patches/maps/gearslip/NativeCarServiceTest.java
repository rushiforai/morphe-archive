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
        update.invoke(service,session,new NativeGuidance.Snapshot(true,"Turn right",90,12));assertEquals(java.util.Arrays.asList(2,4),events);
        shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(1));assertEquals(java.util.Arrays.asList(2,4,4),events);
        IBinder navigation=call(car,"ICarApp",9,data->data.writeString("navigation")).value.getBinder("tag_value");
        Response stopped=new Response();Parcel request=Parcel.obtain();
        try{request.writeInterfaceToken("androidx.car.app.navigation.INavigationManager");request.writeStrongBinder(stopped);request.setDataPosition(0);assertTrue(navigation.transact(2,request,null,IBinder.FLAG_ONEWAY));}
        finally{request.recycle();}
        shadowOf(Looper.getMainLooper()).idle();assertEquals(0,stopped.code);
        Intent stop=shadowOf(service).getNextStartedService();assertNotNull(stop);
        assertEquals("com.google.android.libraries.geo.navcore.service.base.NavigationService",stop.getComponent().getClassName());assertTrue(stop.getBooleanExtra("abortcurrentsession",false));
        update.invoke(service,session,new NativeGuidance.Snapshot(false,null,0,0));assertEquals(2,stopped.code);assertEquals(Integer.valueOf(3),events.get(events.size()-1));
    }
    @Test public void aHostCannotClaimAPackageItsUidDoesNotOwn() throws Exception {
        shadowOf(service.getPackageManager()).setPackagesForUid(HOST_UID, "some.other.app");
        Response response = handshakeResponse(HOST);
        assertSecurity(response);
    }

    @Test public void managerFromAnEarlierHandshakeCannotOperateTheReplacementSession() throws Exception {
        handshake(HOST);
        IBinder earlier = manager();
        handshake(HOST);
        assertSecurity(call(earlier, "IAppManager", 2, data -> {}));
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

    /** A host search row issued for this session, whose native row Maps no longer offers. */
    private IBinder searchRowCapability() throws Exception {
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        Object session = active.get(service);
        java.lang.reflect.Field renderer = session.getClass().getDeclaredField("renderer"); renderer.setAccessible(true);
        if (renderer.get(session) == null) renderer.set(session, new ProjectionRenderer(service, error -> { throw new AssertionError(error); }));
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses())
                .filter(candidate -> candidate.getSimpleName().equals("ContentActionBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass(), NativeCarContent.Action.class);
        constructor.setAccessible(true);
        return (IBinder) constructor.newInstance(service, session, new NativeCarContent.Action(new Object(), "Destination", "j", -1, true));
    }

    @Test public void searchRowCallbacksRequireTheAuthenticatedHostUid() throws Exception {
        handshake(HOST); IBinder row = searchRowCapability();
        ShadowBinder.setCallingUid(HOST_UID + 1);
        assertSecurity(call(row, "model.IOnClickListener", 2, data -> {}));
        ShadowBinder.setCallingUid(HOST_UID);
        assertSecurity("A row Maps no longer offers is refused without failing the session", call(row, "model.IOnClickListener", 2, data -> {}));
        assertEquals("androidx.car.app.navigation.model.NavigationTemplate", template(manager()).getString("tag_class_name"));
    }

    @Test public void searchRowCallbacksCannotReviveAReplacedSession() throws Exception {
        handshake(HOST); IBinder row = searchRowCapability(); handshake(HOST);
        assertSecurity(call(row, "model.IOnClickListener", 2, data -> {}));
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
    /** Maps' own car scene with its native buttons and cards, attached to the session's renderer. */
    private FrameLayout nativeScene() throws Exception {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        java.util.Map<Integer, String> names = new java.util.HashMap<>(); names.put(0x7f990001, "map_buttons_view_container");
        names.put(0x7f990002, "nav_card_view"); names.put(0x7f990003, "status_card_view");
        Resources original = activity.getResources();
        Resources resources = new Resources(activity.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int id) { return names.containsKey(id) ? names.get(id) : super.getResourceEntryName(id); }
        };
        Context context = new ContextWrapper(activity) { @Override public Resources getResources() { return resources; } };
        FrameLayout root = new FrameLayout(context), group = new FrameLayout(context); group.setId(0x7f990001);
        root.addView(group, new FrameLayout.LayoutParams(640, 480));
        for (int id : new int[]{0x7f990002, 0x7f990003}) { FrameLayout card = new FrameLayout(context); card.setId(id); root.addView(card, new FrameLayout.LayoutParams(420, 88)); }
        int id = 0x7f990010;
        for (String name : new String[]{"main_suggested_destinations_search_box", "map_buttons_view_settings_button", "map_buttons_view_mute_container",
                "map_buttons_view_report_incident_button", "recenter_button_container", "map_buttons_view_zoom_in", "map_buttons_view_zoom_out", "map_buttons_view_compass"}) {
            names.put(id, name); ImageView view = new ImageView(context); view.setId(id++);
            view.setImageDrawable(new ColorDrawable(Color.BLUE)); group.addView(view, new FrameLayout.LayoutParams(64, 64));
        }
        activity.setContentView(root);
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        ProjectionRenderer renderer = new ProjectionRenderer(service, error -> { throw new AssertionError(error); });
        java.lang.reflect.Field created = ProjectionRenderer.class.getDeclaredField("created"); created.setAccessible(true); created.set(renderer, true);
        java.lang.reflect.Field nativeController = ProjectionRenderer.class.getDeclaredField("controller"); nativeController.setAccessible(true);
        nativeController.set(renderer, new TemplateController(activity.getWindow()));
        java.lang.reflect.Field current = session.getClass().getDeclaredField("renderer"); current.setAccessible(true); current.set(session, renderer);
        return root;
    }
    private static void assertAllNativeViewsShown(View view) {
        assertEquals("Maps' own car UI must stay visible: " + view, View.VISIBLE, view.getVisibility());
        if (view instanceof android.view.ViewGroup) for (int i = 0; i < ((android.view.ViewGroup) view).getChildCount(); i++) assertAllNativeViewsShown(((android.view.ViewGroup) view).getChildAt(i));
    }

    @Test public void everyHostShowsMapsOwnCarUiOnAPlainMapScreen() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene();
        IBinder app = manager(); NavigationTemplate navigation = (NavigationTemplate) decodedTemplate(app);
        assertNotNull("The template contract requires an action strip", navigation.getActionStrip());
        assertTrue("Maps draws its own buttons; the host must not duplicate them", navigation.getActionStrip().getActions().isEmpty());
        assertEquals("Only the standard Pan action, which a touchscreen host does not draw", 1, navigation.getMapActionStrip().getActions().size());
        assertEquals(androidx.car.app.model.Action.TYPE_PAN, navigation.getMapActionStrip().getActions().get(0).getType());
        assertNotNull("Pan mode lets hosts send drags and pinches", navigation.getPanModeDelegate());
        navigation.getPanModeDelegate().sendPanModeChanged(true, done());
        navigation.getPanModeDelegate().sendPanModeChanged(false, done());
        shadowOf(Looper.getMainLooper()).idle();
        assertNull(navigation.getNavigationInfo()); assertNull(navigation.getDestinationTravelEstimate());
        shadowOf(Looper.getMainLooper()).idle();
        assertAllNativeViewsShown(root);
    }

    @Test public void guidanceFeedsTheClusterWhileMapsDrawsItsOwnCards() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene();
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        int[] invalidations = {0}; java.util.List<Integer> events = new java.util.ArrayList<>();
        Binder app = new Binder(){@Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            data.enforceInterface("androidx.car.app.IAppHost");if(code==2)invalidations[0]++;if(reply!=null)reply.writeNoException();return true;}};
        Binder host = new Binder(){@Override protected boolean onTransact(int code,Parcel data,Parcel reply,int flags){
            data.enforceInterface("androidx.car.app.navigation.INavigationHost");events.add(code);if(reply!=null)reply.writeNoException();return true;}};
        java.lang.reflect.Field appHost = session.getClass().getDeclaredField("appHost"); appHost.setAccessible(true); appHost.set(session, app);
        java.lang.reflect.Field navigationHost = session.getClass().getDeclaredField("navigationHost"); navigationHost.setAccessible(true); navigationHost.set(session, host);
        java.lang.reflect.Method update = NativeCarService.class.getDeclaredMethod("navigation", session.getClass(), NativeGuidance.Snapshot.class); update.setAccessible(true);
        for (int i = 0; i < 5; i++) update.invoke(service, session, new NativeGuidance.Snapshot(false, null, 0, 0));
        assertTrue("Free-drive reports on every location update reach neither host", events.isEmpty()); assertEquals(0, invalidations[0]);
        update.invoke(service, session, new NativeGuidance.Snapshot(true, "Turn right", 120, 15));
        update.invoke(service, session, new NativeGuidance.Snapshot(true, "Turn right", 90, 12));
        shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofSeconds(1));
        assertEquals("Navigation start plus trip updates for the cluster", java.util.Arrays.asList(2, 4, 4), events);
        assertEquals("Turn changes are drawn by Maps, not by refreshing the host", 0, invalidations[0]);
        NavigationTemplate navigation = (NavigationTemplate) decodedTemplate(manager());
        assertNull("No host turn card on top of Maps' own", navigation.getNavigationInfo());
        assertTrue(navigation.getActionStrip().getActions().isEmpty());
        update.invoke(service, session, new NativeGuidance.Snapshot(false, null, 0, 0));
        assertEquals(Integer.valueOf(3), events.get(events.size() - 1)); assertEquals("Leaving guidance does not refresh the host either", 0, invalidations[0]);
        shadowOf(Looper.getMainLooper()).idle(); assertAllNativeViewsShown(root);
    }

    @Test public void nativeUiStillBridgesTextInputThroughTheHostKeyboard() throws Exception {
        handshake(HOST);
        nativeScene();
        ProjectedEditor editor = focusEditor("Amsterdam");
        IBinder manager = manager(), search = searchCallback(manager);
        assertEquals(2, call(search, "model.ISearchCallback", 2, data -> data.writeString("Dam")).code);
        assertEquals("Dam", editor.field.getText().toString());
        assertEquals(2, call(search, "model.ISearchCallback", 3, data -> data.writeString("Museumplein")).code);
        assertEquals("Museumplein", editor.submitted);
        NavigationTemplate navigation = (NavigationTemplate) decodedTemplate(manager);
        assertTrue("After input, the host returns to Maps' own screen", navigation.getActionStrip().getActions().isEmpty());
        assertSecurity(call(search, "model.ISearchCallback", 2, data -> data.writeString("stale")));
    }

    @Test public void hostBackGoesToMapsOwnBackStack() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); int[] backs = {0};
        root.setFocusable(true); root.requestFocus();
        root.setOnKeyListener((view, key, event) -> { if (key == android.view.KeyEvent.KEYCODE_BACK && event.getAction() == android.view.KeyEvent.ACTION_UP) backs[0]++; return true; });
        assertEquals(2, call(manager(), "IAppManager", 3, data -> {}).code);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The host Back key reaches Maps' native panels", 1, backs[0]);
    }

    @SuppressWarnings("unchecked")
    @Test public void exactHostOverlaysReachMapsOnlyFromTheAuthenticatedHost() throws Exception {
        handshake(HOST);
        nativeScene();
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        java.lang.reflect.Field current = session.getClass().getDeclaredField("renderer"); current.setAccessible(true);
        ProjectionRenderer renderer = (ProjectionRenderer) current.get(session);
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses())
                .filter(candidate -> candidate.getSimpleName().equals("OverlayBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass());
        constructor.setAccessible(true); IBinder callback = (IBinder) constructor.newInstance(service, session);
        java.lang.reflect.Field overlays = ProjectionRenderer.class.getDeclaredField("hostOverlays"); overlays.setAccessible(true);
        sendOverlays(callback, 1, 12, 404, 276, 468);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals(java.util.Collections.singletonList(new android.graphics.Rect(12, 404, 276, 468)), overlays.get(renderer));
        ShadowBinder.setCallingUid(HOST_UID + 1);
        sendOverlays(callback, 0);
        ShadowBinder.setCallingUid(HOST_UID);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Another UID cannot move Maps' elements", 1, ((java.util.List<?>) overlays.get(renderer)).size());
        sendOverlays(callback, NativeCarService.MAX_OVERLAYS + 1);
        shadowOf(Looper.getMainLooper()).idle();
        assertEquals("An oversized update is ignored", 1, ((java.util.List<?>) overlays.get(renderer)).size());
        sendOverlays(callback, 0);
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue(((java.util.List<?>) overlays.get(renderer)).isEmpty());
    }
    @Test public void mapsBoxesReachTheHostAsOneOneWayTransaction() throws Exception {
        handshake(HOST);
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        java.util.List<android.graphics.Rect> received = new java.util.ArrayList<>(); int[] flags = {-1};
        Binder host = new Binder() { @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int f) {
            assertEquals(2, code); flags[0] = f; data.enforceInterface(NativeCarService.OVERLAY_HOST);
            int count = data.readInt();
            for (int i = 0; i < count; i++) received.add(new android.graphics.Rect(data.readInt(), data.readInt(), data.readInt(), data.readInt()));
            return true; } };
        java.lang.reflect.Field overlayHost = session.getClass().getDeclaredField("overlayHost"); overlayHost.setAccessible(true); overlayHost.set(session, host);
        java.lang.reflect.Method send = NativeCarService.class.getDeclaredMethod("sendOccupied", session.getClass(), java.util.List.class); send.setAccessible(true);
        java.util.List<android.graphics.Rect> areas = java.util.Arrays.asList(new android.graphics.Rect(10, 12, 74, 204), new android.graphics.Rect(84, 294, 504, 444));
        send.invoke(service, session, areas);
        assertEquals(areas, received);
        assertEquals(IBinder.FLAG_ONEWAY, flags[0] & IBinder.FLAG_ONEWAY);
    }
    @Test public void onlyTheHostCanTellWhereItsDragBegan() throws Exception {
        handshake(HOST); nativeScene();
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true); Object session = active.get(service);
        java.lang.reflect.Field current = session.getClass().getDeclaredField("renderer"); current.setAccessible(true);
        ProjectionRenderer renderer = (ProjectionRenderer) current.get(session);
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses()).filter(c -> c.getSimpleName().equals("OverlayBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass()); constructor.setAccessible(true);
        IBinder callback = (IBinder) constructor.newInstance(service, session);
        java.lang.reflect.Field x = ProjectionRenderer.class.getDeclaredField("hostStartX"); x.setAccessible(true);
        ShadowBinder.setCallingUid(HOST_UID + 1); sendStart(callback, 300f, 120f); ShadowBinder.setCallingUid(HOST_UID);
        shadowOf(Looper.getMainLooper()).idle(); assertEquals(0f, x.getFloat(renderer), 0f);
        sendStart(callback, 300f, 120f); shadowOf(Looper.getMainLooper()).idle();
        assertEquals(300f, x.getFloat(renderer), 0f);
    }
    // ---- Route preview: telling the host it is up, and pressing Maps' own Start when the host asks.

    private final java.util.List<View> startClicks = new java.util.ArrayList<>();
    private Object activeSession() throws Exception {
        java.lang.reflect.Field active = NativeCarService.class.getDeclaredField("active"); active.setAccessible(true);
        return active.get(service);
    }
    private static ProjectionRenderer rendererOf(Object session) throws Exception {
        java.lang.reflect.Field current = session.getClass().getDeclaredField("renderer"); current.setAccessible(true);
        return (ProjectionRenderer) current.get(session);
    }
    private static void sessionField(Object session, String name, Object value) throws Exception {
        java.lang.reflect.Field field = session.getClass().getDeclaredField(name); field.setAccessible(true); field.set(session, value);
    }
    private static Object sessionField(Object session, String name) throws Exception {
        java.lang.reflect.Field field = session.getClass().getDeclaredField(name); field.setAccessible(true); return field.get(session);
    }
    /** The callback the host gets for its overlay service, as the adapter hands it out. */
    private IBinder overlayCallback(Object session) throws Exception {
        Class<?> type = java.util.Arrays.stream(NativeCarService.class.getDeclaredClasses()).filter(c -> c.getSimpleName().equals("OverlayBinder")).findFirst().get();
        java.lang.reflect.Constructor<?> constructor = type.getDeclaredConstructor(NativeCarService.class, session.getClass()); constructor.setAccessible(true);
        return (IBinder) constructor.newInstance(service, session);
    }
    /** Maps' footer on its route preview: the clickable frame named as in Maps 26.44, labelled with Maps' Start string. */
    private FrameLayout routePreview(FrameLayout root, String label) {
        Context base = root.getContext();
        Resources original = base.getResources();
        int id = 0x7f990100, string = 0x7f990101;
        Resources resources = new Resources(base.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public String getResourceEntryName(int resource) { return resource == id ? NativeRoutePreview.START_NAMES[0] : super.getResourceEntryName(resource); }
            @Override public int getIdentifier(String name, String type, String packageName) {
                return NativeRoutePreview.START_LABEL.equals(name) && "string".equals(type) && base.getPackageName().equals(packageName) ? string : super.getIdentifier(name, type, packageName);
            }
            @Override public String getString(int resource) { return resource == string ? "Start" : super.getString(resource); }
        };
        Context context = new ContextWrapper(base) { @Override public Resources getResources() { return resources; } };
        FrameLayout start = new FrameLayout(context); start.setId(id);
        start.setOnClickListener(startClicks::add);
        android.widget.TextView text = new android.widget.TextView(context); text.setText(label);
        start.addView(text, new FrameLayout.LayoutParams(200, 60));
        root.addView(start, new FrameLayout.LayoutParams(300, 80));
        root.requestLayout(); shadowOf(Looper.getMainLooper()).idle();
        return start;
    }
    private static void sendStartGuidance(IBinder callback) throws Exception {
        Parcel data = Parcel.obtain();
        try { data.writeInterfaceToken(NativeCarService.OVERLAY_CALLBACK); assertTrue(callback.transact(NativeCarService.START_GUIDANCE, data, null, IBinder.FLAG_ONEWAY)); }
        finally { data.recycle(); }
    }
    /** A host overlay service that records what it hears: code, one-way flag and the boolean of a preview report. */
    private static final class RecordingHost extends Binder {
        final java.util.List<String> heard = new java.util.ArrayList<>();
        final boolean knowsPreview;
        RecordingHost(boolean knowsPreview) { this.knowsPreview = knowsPreview; }
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
            // Like DriveDeck's stub: it handles the transactions it knows and answers false to any other.
            if (code != NativeCarService.PREVIEW_SHOWN || !knowsPreview) return false;
            data.enforceInterface(NativeCarService.OVERLAY_HOST);
            heard.add(code + (((flags & IBinder.FLAG_ONEWAY) != 0) ? " oneway " : " twoway ") + (data.readInt() != 0));
            return true;
        }
    }
    /** What the draw observer does: read the layout again and report what changed. */
    private static void drawn(ProjectionRenderer renderer) throws Exception {
        java.lang.reflect.Method report = ProjectionRenderer.class.getDeclaredMethod("reportOccupiedNow"); report.setAccessible(true);
        report.invoke(renderer);
    }
    private void tellPreviewsTo(Object session, ProjectionRenderer renderer, RecordingHost host) throws Exception {
        sessionField(session, "overlayHost", host);
        java.lang.reflect.Method send = NativeCarService.class.getDeclaredMethod("sendPreview", session.getClass(), boolean.class); send.setAccessible(true);
        renderer.setRoutePreviewListener(shown -> { try { send.invoke(service, session, shown); } catch (Exception e) { throw new AssertionError(e); } });
    }

    @Test public void theNewTransactionsFollowTheExistingOnes() {
        assertEquals(3, NativeCarService.PREVIEW_SHOWN);
        assertEquals(3, NativeCarService.START_GUIDANCE);
    }

    @Test public void aHostRequestPressesMapsOwnStartExactlyOnce() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); FrameLayout start = routePreview(root, "Start");
        Object session = activeSession(); IBinder callback = overlayCallback(session);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertEquals("One request, one click, on Maps' own view", java.util.Collections.singletonList(start), startClicks);
        assertNull("Pressing Start is not a failure", sessionField(session, "failure"));
    }

    @Test public void onlyTheAuthenticatedHostCanAskForStart() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); routePreview(root, "Start");
        IBinder callback = overlayCallback(activeSession());
        ShadowBinder.setCallingUid(HOST_UID + 1); sendStartGuidance(callback); ShadowBinder.setCallingUid(HOST_UID);
        shadowOf(Looper.getMainLooper()).idle();
        assertTrue("Another UID cannot start the driver's route", startClicks.isEmpty());
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertEquals(1, startClicks.size());
    }

    @Test public void nothingIsPressedWhileGuidanceRunsOrWithoutAUsableStart() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene();
        Object session = activeSession(); IBinder callback = overlayCallback(session);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertNull("No route preview at all: nothing happens, and it is no failure", sessionField(session, "failure"));
        FrameLayout start = routePreview(root, "Start");
        sessionField(session, "navigating", true);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertTrue("Guidance is already running", startClicks.isEmpty());
        sessionField(session, "navigating", false);
        start.setVisibility(View.INVISIBLE);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertTrue("Start is not shown", startClicks.isEmpty());
        start.setVisibility(View.VISIBLE); start.setEnabled(false);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertTrue("Start is not enabled", startClicks.isEmpty());
        start.setEnabled(true);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Once it can be pressed, it is", 1, startClicks.size());
        assertNull(sessionField(session, "failure"));
    }

    @Test public void aStartWhoseClickThrowsLeavesTheSessionRunningAndReportsFalse() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); FrameLayout start = routePreview(root, "Start");
        Object session = activeSession(); ProjectionRenderer renderer = rendererOf(session);
        IBinder callback = overlayCallback(session);
        start.setOnClickListener(view -> { throw new IllegalStateException("Maps' own click handler failed"); });
        assertFalse("A failed start is reported as not started", renderer.startRoutePreview());
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        java.lang.reflect.Field failed = ProjectionRenderer.class.getDeclaredField("failed"); failed.setAccessible(true);
        assertFalse("The renderer is not failed", failed.getBoolean(renderer));
        assertNull("The session is not failed", sessionField(session, "failure"));
        assertFalse("The session is not closed", (Boolean) sessionField(session, "closed"));
        assertSame("The session is still the active one", session, activeSession());
        assertSame("The renderer is still the session's", renderer, rendererOf(session));
        start.setOnClickListener(startClicks::add);
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The next request still works", java.util.Collections.singletonList(start), startClicks);
    }

    @Test public void anotherActionInTheFootersViewIsNotPressed() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); routePreview(root, "Add stop");
        IBinder callback = overlayCallback(activeSession());
        sendStartGuidance(callback); shadowOf(Looper.getMainLooper()).idle();
        assertTrue("The footer says Add stop; that is not Start", startClicks.isEmpty());
    }

    @Test public void theHostLearnsWhenTheRoutePreviewAppearsAndGoesAndTheLastWordIsNotShown() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene();
        Object session = activeSession(); ProjectionRenderer renderer = rendererOf(session);
        RecordingHost host = new RecordingHost(true);
        tellPreviewsTo(session, renderer, host);
        drawn(renderer);
        assertTrue("A host starts out knowing 'not shown'; nothing to say yet", host.heard.isEmpty());
        FrameLayout start = routePreview(root, "Start");
        drawn(renderer); drawn(renderer);
        assertEquals("Told once, when it appeared, one-way", java.util.Collections.singletonList("3 oneway true"), host.heard);
        start.setVisibility(View.GONE);
        drawn(renderer);
        start.setVisibility(View.VISIBLE);
        drawn(renderer);
        assertEquals(java.util.Arrays.asList("3 oneway true", "3 oneway false", "3 oneway true"), host.heard);
        service.onUnbind(new Intent("androidx.car.app.CarAppService")); shadowOf(Looper.getMainLooper()).idle();
        assertEquals("The session ends with the preview", java.util.Arrays.asList("3 oneway true", "3 oneway false", "3 oneway true", "3 oneway false"), host.heard);
    }

    @Test public void guidanceStartingEndsThePreviewWithoutWaitingForAFrame() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene(); routePreview(root, "Start");
        Object session = activeSession(); ProjectionRenderer renderer = rendererOf(session);
        RecordingHost host = new RecordingHost(true);
        tellPreviewsTo(session, renderer, host);
        assertEquals("A preview already up when the host subscribes is reported at once", java.util.Collections.singletonList("3 oneway true"), host.heard);
        renderer.hostedNavigation(true);
        assertEquals(java.util.Arrays.asList("3 oneway true", "3 oneway false"), host.heard);
        drawn(renderer);
        assertEquals("Start may still be drawn for a frame; guidance wins", 2, host.heard.size());
        service.onUnbind(new Intent("androidx.car.app.CarAppService")); shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Already told 'not shown': nothing more at the end", 2, host.heard.size());
    }

    @Test public void aHostThatNeverSubscribedOrIgnoresTheNewMessageSeesNoChange() throws Exception {
        handshake(HOST);
        FrameLayout root = nativeScene();
        Object session = activeSession(); ProjectionRenderer renderer = rendererOf(session);
        // No overlay service at all: the listener has nowhere to speak.
        tellPreviewsTo(session, renderer, new RecordingHost(true)); sessionField(session, "overlayHost", null);
        routePreview(root, "Start"); drawn(renderer);
        assertFalse(((Boolean) sessionField(session, "previewSent")));
        // A host whose stub does not know transaction 3 answers false and hears nothing else.
        RecordingHost old = new RecordingHost(false);
        tellPreviewsTo(session, renderer, old);
        drawn(renderer);
        service.onUnbind(new Intent("androidx.car.app.CarAppService")); shadowOf(Looper.getMainLooper()).idle();
        assertTrue(old.heard.isEmpty());
        assertNull("An unknown one-way message is not an error", sessionField(session, "failure"));
    }

    private static void sendStart(IBinder callback, float x, float y) throws Exception {
        Parcel data = Parcel.obtain();
        try { data.writeInterfaceToken(NativeCarService.OVERLAY_CALLBACK); data.writeFloat(x); data.writeFloat(y); assertTrue(callback.transact(2, data, null, IBinder.FLAG_ONEWAY)); }
        finally { data.recycle(); }
    }
    private static androidx.car.app.OnDoneCallback done() {
        return new androidx.car.app.OnDoneCallback() {
            @Override public void onSuccess(Bundleable response) {}
            @Override public void onFailure(Bundleable error) { throw new AssertionError("CAL callback was rejected"); }
        };
    }
    private static void sendOverlays(IBinder callback, int count, int... edges) throws Exception {
        Parcel data = Parcel.obtain();
        try {
            data.writeInterfaceToken(NativeCarService.OVERLAY_CALLBACK); data.writeInt(count);
            for (int edge : edges) data.writeInt(edge);
            assertTrue(callback.transact(1, data, null, IBinder.FLAG_ONEWAY));
        } finally { data.recycle(); }
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

    private static void assertSecurity(Response response) { assertSecurity("Expected a security refusal", response); }
    private static void assertSecurity(String message, Response response) {
        assertEquals(message, 3, response.code);
        assertEquals(message, 4, CarProtocol.member(response.value, "mErrorType").getInt("tag_value"));
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
