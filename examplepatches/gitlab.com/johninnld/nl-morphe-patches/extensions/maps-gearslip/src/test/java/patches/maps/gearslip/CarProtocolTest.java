package patches.maps.gearslip;

import static org.junit.Assert.*;
import android.os.Binder;
import android.os.Bundle;
import android.os.Parcel;
import android.os.RemoteException;
import androidx.car.app.OnDoneCallback;
import androidx.car.app.model.Row;
import androidx.car.app.model.SearchTemplate;
import androidx.car.app.model.TemplateWrapper;
import androidx.car.app.navigation.model.NavigationTemplate;
import androidx.car.app.serialization.Bundleable;
import java.lang.reflect.InvocationTargetException;
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
            assertEquals(100,trip.getStepTravelEstimates().get(0).getRemainingDistance().getDisplayDistance(),0);
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
    @Test public void clusterTripCarriesTheNativeManeuverAndLanes()throws Exception{
        NativeGuidance.Direction direction=new NativeGuidance.Direction("NORMAL",true,true);
        NativeGuidance.Step current=new NativeGuidance.Step("Turn right",null,"TURN","SIDE_RIGHT","TURN_NORMAL","RIGHT",-1,-1,
                Collections.singletonList(Collections.singletonList(direction)));
        NativeGuidance.Snapshot snapshot=new NativeGuidance.Snapshot(true,current.cue,120,15,current,null,55000,2220,12000,600);
        androidx.car.app.navigation.model.Trip trip=decodeTrip(CarProtocol.trip(snapshot,1700000000000L));
        androidx.car.app.navigation.model.Step step=trip.getSteps().get(0);
        assertEquals("Turn right",step.getCue().toString());
        assertEquals(androidx.car.app.navigation.model.Maneuver.TYPE_TURN_NORMAL_RIGHT,step.getManeuver().getType());
        assertEquals(128,step.getManeuver().getIcon().getIcon().getBitmap().getWidth());
        assertNotNull(step.getLanesImage());
        assertNull("Lane colors must retain the recommended/unrecommended distinction",step.getLanesImage().getTint());
        assertEquals(androidx.car.app.navigation.model.LaneDirection.SHAPE_NORMAL_RIGHT,step.getLanes().get(0).getDirections().get(0).getShape());
        assertTrue(step.getLanes().get(0).getDirections().get(0).isRecommended());
        assertEquals(androidx.car.app.model.Distance.UNIT_METERS,trip.getStepTravelEstimates().get(0).getRemainingDistance().getDisplayUnit());
    }
    @Test public void unknownRoundaboutSideAndMissingExitRemainUnknown(){
        NativeGuidance.Step unknown=new NativeGuidance.Step("Roundabout",null,"ROUNDABOUT_ENTER_AND_EXIT","SIDE_UNSPECIFIED","TURN_UNKNOWN","NONE",-1,-1,Collections.emptyList());
        assertEquals(0,CarNavigationModels.maneuverType(unknown));
        NativeGuidance.Step known=new NativeGuidance.Step("Second exit",null,"ROUNDABOUT_ENTER_AND_EXIT","SIDE_UNSPECIFIED","TURN_UNKNOWN","RIGHT",90,2,Collections.emptyList());
        assertEquals(androidx.car.app.navigation.model.Maneuver.TYPE_ROUNDABOUT_ENTER_AND_EXIT_CCW,CarNavigationModels.maneuverType(known));
    }
    @Test public void nativeYardsPreferenceIsNotCollapsedIntoFeet()throws Exception{
        NativeGuidance.Snapshot snapshot=new NativeGuidance.Snapshot(true,"Continue",100,15,null,null,55000,2220,12000,600,"MILES_YARDS");
        androidx.car.app.navigation.model.Trip trip=decodeTrip(CarProtocol.trip(snapshot,0));
        assertEquals(androidx.car.app.model.Distance.UNIT_YARDS,trip.getStepTravelEstimates().get(0).getRemainingDistance().getDisplayUnit());
    }
    @Test public void nativeTemplateIsAPlainMapScreenTheRealLibraryAccepts()throws Exception{
        NavigationTemplate template=(NavigationTemplate)decode(CarProtocol.mapTemplate(new android.os.Binder()));
        assertNotNull(template.getActionStrip());assertTrue(template.getActionStrip().getActions().isEmpty());
        // Hosts send drags and pinches only when the map strip offers Pan (not drawn on a touchscreen).
        assertEquals(1,template.getMapActionStrip().getActions().size());
        assertEquals(androidx.car.app.model.Action.TYPE_PAN,template.getMapActionStrip().getActions().get(0).getType());
        assertNotNull(template.getPanModeDelegate());
        assertNull(template.getNavigationInfo());assertNull(template.getDestinationTravelEstimate());
        // The real library's builder accepts the same strips.
        new NavigationTemplate.Builder().setActionStrip(template.getActionStrip()).setMapActionStrip(template.getMapActionStrip()).build();
    }
    @Test public void searchRowsKeepEveryNativeResultAndAGenuineClickDelegate()throws Exception{
        java.util.List<Bundle> rows=new java.util.ArrayList<>();
        for(int i=0;i<80;i++)rows.add(CarProtocol.contentRow("Place "+i,Collections.singletonList("2 km"),clickListener(),true));
        rows.add(CarProtocol.contentRow("Powered by Google",Collections.emptyList(),null,true));
        SearchTemplate template=(SearchTemplate)decode(CarProtocol.searchTemplate("Dam","Find a place",clickListener(),rows));
        assertEquals(81,template.getItemList().getItems().size());
        Row last=(Row)template.getItemList().getItems().get(79);assertEquals("Place 79",last.getTitle().toString());assertTrue(last.isBrowsable());
        Row footer=(Row)template.getItemList().getItems().get(80);assertFalse(footer.isBrowsable());assertNull(footer.getOnClickDelegate());
        boolean[] completed={false};
        last.getOnClickDelegate().sendClick(new OnDoneCallback(){
            @Override public void onSuccess(Bundleable response){completed[0]=true;}
            @Override public void onFailure(Bundleable error){throw new AssertionError("Row click failed");}
        });
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        assertTrue(completed[0]);
    }

    private static Object decode(Bundle value) throws Exception {
        Parcel wire = Parcel.obtain();
        try { wire.writeBundle(value); wire.setDataPosition(0); return ((TemplateWrapper) Bundleable.CREATOR.createFromParcel(wire).get()).getTemplate(); }
        finally { wire.recycle(); }
    }
    private static androidx.car.app.navigation.model.Trip decodeTrip(Bundle value) throws Exception {
        Parcel wire = Parcel.obtain();
        try { wire.writeBundle(value); wire.setDataPosition(0); return (androidx.car.app.navigation.model.Trip) Bundleable.CREATOR.createFromParcel(wire).get(); }
        finally { wire.recycle(); }
    }

    @Test public void realLibraryDecodesTheTopFirstScreenStackAndClassFields() throws Exception {
        Bundle encoded=CarProtocol.searchTemplate("Amst","Find",clickListener());
        CarProtocol.screenStack(encoded);
        Parcel wire=Parcel.obtain();
        try{
            wire.writeBundle(encoded);wire.setDataPosition(0);
            TemplateWrapper wrapper=(TemplateWrapper)Bundleable.CREATOR.createFromParcel(wire).get();
            assertEquals(2,wrapper.getTemplateInfosForScreenStack().size());
            assertEquals(SearchTemplate.class,wrapper.getTemplateInfosForScreenStack().get(0).getTemplateClass());
            assertEquals(NavigationTemplate.class,wrapper.getTemplateInfosForScreenStack().get(1).getTemplateClass());
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
