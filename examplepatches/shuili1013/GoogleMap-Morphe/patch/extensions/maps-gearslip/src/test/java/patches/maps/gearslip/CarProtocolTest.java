package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.os.Binder;
import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import android.graphics.Bitmap;
import android.graphics.Color;
import androidx.car.app.OnDoneCallback;
import androidx.car.app.model.Action;
import androidx.car.app.model.CarColor;
import androidx.car.app.model.ListTemplate;
import androidx.car.app.model.Row;
import androidx.car.app.model.SearchTemplate;
import androidx.car.app.model.TemplateWrapper;
import androidx.car.app.navigation.model.NavigationTemplate;
import androidx.car.app.serialization.Bundleable;
import java.lang.reflect.InvocationTargetException;
import java.util.Arrays;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 32)
public final class CarProtocolTest {
    @Test public void tripDecodesNativeCueAndPairedProgressWithoutInventingDestinations()throws Exception{
        Parcel wire=Parcel.obtain();
        try{
            wire.writeBundle(CarProtocol.trip(new NativeGuidance.Snapshot(true,"Turn right",120,15),1700000000000L));wire.setDataPosition(0);
            androidx.car.app.navigation.model.Trip trip=(androidx.car.app.navigation.model.Trip)Bundleable.CREATOR.createFromParcel(wire).get();
            assertFalse(trip.isLoading());assertTrue(trip.getDestinations().isEmpty());assertTrue(trip.getDestinationTravelEstimates().isEmpty());
            assertEquals("Turn right",trip.getSteps().get(0).getCue().toString());assertNull(trip.getSteps().get(0).getManeuver());
            assertEquals(120,trip.getStepTravelEstimates().get(0).getRemainingDistance().getDisplayDistance(),0);
            assertEquals(15,trip.getStepTravelEstimates().get(0).getRemainingTimeSeconds());
            assertEquals(1700000015000L,trip.getStepTravelEstimates().get(0).getArrivalTimeAtDestination().getTimeSinceEpochMillis());
        }finally{wire.recycle();}
    }
    @Test public void loadingTripContainsNoFabricatedSteps()throws Exception{
        Parcel wire=Parcel.obtain();
        try{wire.writeBundle(CarProtocol.trip(new NativeGuidance.Snapshot(true,null,0,0),0));wire.setDataPosition(0);
            androidx.car.app.navigation.model.Trip trip=(androidx.car.app.navigation.model.Trip)Bundleable.CREATOR.createFromParcel(wire).get();
            assertTrue(trip.isLoading());assertTrue(trip.getSteps().isEmpty());assertTrue(trip.getStepTravelEstimates().isEmpty());
        }finally{wire.recycle();}
    }
    @Test public void nativeControlsDecodeAsStandardHostActionsAndMapActions() throws Exception {
        Bitmap icon = Bitmap.createBitmap(16, 16, Bitmap.Config.ARGB_8888); icon.eraseColor(Color.BLUE);
        NavigationTemplate template = (NavigationTemplate) decode(CarProtocol.template(null,
                Collections.singletonList(CarProtocol.action("Settings", icon, clickListener())),
                Arrays.asList(CarProtocol.panAction(), CarProtocol.action(null, icon, clickListener()))));
        Action settings = template.getActionStrip().getActions().get(0);
        assertEquals("Settings", settings.getTitle().toString()); assertTrue(settings.isEnabled());
        assertEquals(Color.BLUE, settings.getIcon().getIcon().getBitmap().getPixel(0, 0));
        assertEquals(CarColor.DEFAULT, settings.getIcon().getTint());
        assertNotNull(settings.getOnClickDelegate());
        assertEquals(Action.TYPE_PAN, template.getMapActionStrip().getActions().get(0).getType());
        assertNull(template.getMapActionStrip().getActions().get(1).getTitle());
        // Exercise the real library's constraints, not only our own field encoder.
        new NavigationTemplate.Builder().setActionStrip(template.getActionStrip())
                .setMapActionStrip(template.getMapActionStrip()).build();
    }

    @Test public void standardActionDelegateCallsTheOriginalActionAndCompletesTheHostCallback() throws Exception {
        Bitmap icon = Bitmap.createBitmap(16, 16, Bitmap.Config.ARGB_8888);
        NavigationTemplate template = (NavigationTemplate) decode(CarProtocol.template(null,
                Collections.singletonList(CarProtocol.action("Settings", icon, clickListener())), Collections.emptyList()));
        boolean[] completed = {false};
        template.getActionStrip().getActions().get(0).getOnClickDelegate().sendClick(new OnDoneCallback() {
            @Override public void onSuccess(Bundleable response) { completed[0] = true; }
            @Override public void onFailure(Bundleable error) { throw new AssertionError("Standard action failed"); }
        });
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertTrue(completed[0]);
    }
    @Test public void publicPanDelegateDecodesAndAcknowledgesBothModeTransitions() throws Exception {
        java.util.List<Boolean> modes = new java.util.ArrayList<>();
        Binder listener = new Binder() {
            @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
                if (CarProtocol.basic("androidx.car.app.navigation.model.IPanModeListener", code, data, reply)) return true;
                assertEquals(2, code); modes.add(data.readInt() != 0);
                CarProtocol.complete(data.readStrongBinder(), null, null); return true;
            }
        };
        NavigationTemplate template = (NavigationTemplate) decode(CarProtocol.template(null, Collections.emptyList(),
                Collections.singletonList(CarProtocol.panAction()), listener));
        assertNotNull(template.getPanModeDelegate());
        int[] done = {0}; OnDoneCallback callback = new OnDoneCallback() {
            @Override public void onSuccess(Bundleable response) { done[0]++; }
            @Override public void onFailure(Bundleable error) { throw new AssertionError("Pan callback failed"); }
        };
        template.getPanModeDelegate().sendPanModeChanged(true, callback);
        template.getPanModeDelegate().sendPanModeChanged(false, callback);
        assertEquals(Arrays.asList(true, false), modes); assertEquals(2, done[0]);
    }

    @Test public void overflowUsesAStandardListTemplateWithClickableNativeActions() throws Exception {
        ListTemplate template = (ListTemplate) decode(CarProtocol.controlsTemplate("Map controls",
                Collections.singletonList(CarProtocol.controlRow("Sound", clickListener()))));
        assertEquals("Map controls", template.getTitle().toString());
        assertEquals(Action.TYPE_BACK, template.getHeaderAction().getType());
        Row row = (Row) template.getSingleList().getItems().get(0);
        assertEquals("Sound", row.getTitle().toString()); assertTrue(row.isEnabled());
        assertNotNull(row.getOnClickDelegate()); assertNotNull(row.getMetadata());
        new ListTemplate.Builder().setTitle(template.getTitle().toString()).setHeaderAction(template.getHeaderAction())
                .setSingleList(template.getSingleList()).build();
    }

    private static Object decode(Bundle value) throws Exception {
        Parcel wire = Parcel.obtain();
        try { wire.writeBundle(value); wire.setDataPosition(0); return ((TemplateWrapper) Bundleable.CREATOR.createFromParcel(wire).get()).getTemplate(); }
        finally { wire.recycle(); }
    }

    @Test public void realLibraryDecodesTheTopFirstScreenStackAndClassFields() throws Exception {
        Bundle encoded=CarProtocol.searchTemplate("Amst","Find",clickListener());
        CarProtocol.screenStack(encoded,true);
        Parcel wire=Parcel.obtain();
        try{
            wire.writeBundle(encoded);wire.setDataPosition(0);
            TemplateWrapper wrapper=(TemplateWrapper)Bundleable.CREATOR.createFromParcel(wire).get();
            assertEquals(3,wrapper.getTemplateInfosForScreenStack().size());
            assertEquals(SearchTemplate.class,wrapper.getTemplateInfosForScreenStack().get(0).getTemplateClass());
            assertEquals(ListTemplate.class,wrapper.getTemplateInfosForScreenStack().get(1).getTemplateClass());
            assertEquals(NavigationTemplate.class,wrapper.getTemplateInfosForScreenStack().get(2).getTemplateClass());
            assertEquals("morphe-maps-input",wrapper.getTemplateInfosForScreenStack().get(0).getTemplateId());
        }finally{wire.recycle();}
    }
    private static Binder clickListener() {
        return new Binder() {
            @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
                if (CarProtocol.basic("androidx.car.app.model.IOnClickListener", code, data, reply)) return true;
                assertEquals(2, code); CarProtocol.complete(data.readStrongBinder(), null, null); return true;
            }
        };
    }

    @Test public void originalRendererFailureProducesAnErrorScreenWithTheActualCause() {
        Bundle template = CarProtocol.member(CarProtocol.template(new InvocationTargetException(new IllegalStateException("native map unavailable"))), "mTemplate");
        assertEquals("androidx.car.app.model.MessageTemplate", template.getString("tag_class_name"));
        Bundle text = CarProtocol.member(template, "mMessage");
        assertTrue(CarProtocol.member(text, "mText").getString("tag_value").contains("native map unavailable"));
        assertFalse(template.containsKey("androidx.car.app.model.MessageTemplatemIsLoading"));
    }

    @Test public void appInfoAndSerializedFieldKeysMatchThePublishedWireSchema() {
        Bundle info = CarProtocol.appInfo();
        assertEquals(5, info.getBundle("androidx.car.app.AppInfomMinCarAppApiLevel").getInt("tag_value"));
        assertEquals(7, info.getBundle("androidx.car.app.AppInfomLatestCarAppApiLevel").getInt("tag_value"));
        assertEquals(5, info.getInt("tag_class_type"));
    }

    @Test public void callbacksUseSynchronousTransactionsAndReadTheReceiversReply() {
        RecordingCallback callback = new RecordingCallback(true);
        CarProtocol.complete(callback, CarProtocol.appInfo(), null);
        assertEquals(0, callback.flags);
        assertEquals(2, callback.code);
        assertEquals("androidx.car.app.AppInfo", callback.response.getString("tag_class_name"));
        CarProtocol.complete(callback, null, new SecurityException("spoofed caller"));
        assertEquals(3, callback.code);
        assertEquals(4, CarProtocol.member(callback.response, "mErrorType").getInt("tag_value"));
    }

    @Test public void olderGearslipCallbacksWithNoReplyBodyRemainCompatible() {
        RecordingCallback callback = new RecordingCallback(false);
        CarProtocol.complete(callback, null, null);
        assertEquals(2, callback.code);
        assertNull(callback.response);
    }

    @Test public void nullableBundleableRoundTripsTheActualParcelRepresentation() {
        Parcel parcel = Parcel.obtain();
        try {
            parcel.writeInt(1); parcel.writeBundle(CarProtocol.appInfo()); parcel.setDataPosition(0);
            assertEquals("androidx.car.app.AppInfo", CarProtocol.readBundleable(parcel).getString("tag_class_name"));
        } finally { parcel.recycle(); }
    }

    @Test public void searchTemplateDecodesItsRealHostKeyboardAndTypedSearchCallback() throws Exception {
        String[] query = new String[1];
        Binder nativeCallback = new Binder() {
            @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) {
                data.enforceInterface("androidx.car.app.model.ISearchCallback");
                if (code == 16777215) { reply.writeNoException(); reply.writeInt(1); return true; }
                query[0] = data.readString();
                CarProtocol.complete(data.readStrongBinder(), null, null); return true;
            }
        };
        Parcel wire = Parcel.obtain();
        try {
            wire.writeBundle(CarProtocol.searchTemplate("Amst", "Find a place", nativeCallback)); wire.setDataPosition(0);
            TemplateWrapper wrapper = (TemplateWrapper) Bundleable.CREATOR.createFromParcel(wire).get();
            SearchTemplate search = (SearchTemplate) wrapper.getTemplate();
            assertEquals("Amst", search.getInitialSearchText());
            assertEquals("Find a place", search.getSearchHint());
            assertTrue(search.isShowKeyboardByDefault());
            assertEquals(androidx.car.app.model.Action.TYPE_BACK, search.getHeaderAction().getType());
            search.getSearchCallbackDelegate().sendSearchTextChanged("Amsterdam", new OnDoneCallback() {
                @Override public void onSuccess(Bundleable response) {}
                @Override public void onFailure(Bundleable error) { throw new AssertionError("Search callback failed"); }
            });
            assertEquals("Amsterdam", query[0]);
        } finally { wire.recycle(); }
    }

    private static final class RecordingCallback extends Binder {
        final boolean replyBody;
        int code, flags;
        Bundle response;
        RecordingCallback(boolean replyBody) { this.replyBody = replyBody; }
        @Override protected boolean onTransact(int transaction, Parcel data, Parcel reply, int transactionFlags) throws RemoteException {
            data.enforceInterface("androidx.car.app.IOnDoneCallback");
            code = transaction; flags = transactionFlags;
            response = CarProtocol.readBundleable(data);
            if (replyBody) reply.writeNoException();
            return true;
        }
    }
}
