package local.maps.cluster;

import java.util.Objects;
import org.json.JSONObject;

/** Validated EV inputs, including the firmware selection that supplied the readings. */
final class VehicleEvPolicy {
    static final class Input {
        final String session,sourceIdentity;final long epoch,captured,deadline;final double soc,rangeKm;
        Input(String s,long epoch,long captured,long deadline,double soc,double km){this(s,epoch,captured,deadline,soc,km,VehicleSampleCodec.digest("schema1\nCANFD"));}
        Input(String s,long epoch,long captured,long deadline,double soc,double km,String sourceIdentity){session=s;this.epoch=epoch;this.captured=captured;this.deadline=deadline;this.soc=soc;rangeKm=km;this.sourceIdentity=sourceIdentity;}
    }
    static Input read(JSONObject status,long now)throws Exception{
        if(status.getInt("schema")!=1||!status.optBoolean("enabled")||!status.optBoolean("fresh"))throw new IllegalArgumentException("Fresh vehicle readings required");
        String session=status.getString("session");if(!session.matches("[0-9a-f]{32}"))throw new IllegalArgumentException("Reader session required");
        long epoch=status.getLong("access_epoch"),captured=status.getLong("captured_elapsed_ms"),deadline=status.getLong("valid_until_elapsed_ms");
        if(captured<0||now<captured||now-captured>VehicleReadingRules.MAX_AGE_MS||deadline<=0||now>deadline||deadline-captured>VehicleReadingRules.MAX_AGE_MS)throw new IllegalArgumentException("Vehicle readings expired");
        JSONObject values=status.getJSONObject("values"),soc=values.getJSONObject("soc"),range=values.getJSONObject("range");
        if(!"available".equals(soc.getString("status"))||!"available".equals(range.getString("status")))throw new IllegalArgumentException("Battery and electric range required");
        double percent=soc.getDouble("raw"),km=range.getDouble("raw");
        if(!VehicleReadingRules.percent(percent)||!VehicleReadingRules.range(km)||percent<=0||km<=0)throw new IllegalArgumentException("A usable range model is unavailable");
        String identity=status.optString("source_identity",VehicleSampleCodec.digest("schema1\nCANFD"));
        if(!identity.matches("[a-f0-9]{64}"))throw new IllegalArgumentException("Validated vehicle source required");
        return new Input(session,epoch,captured,deadline,percent,km,identity);
    }
    static boolean live(Input i,VehicleDataStore.Access a,VehicleEvProfile.Profile p,long now){
        return i!=null&&p!=null&&p.enabled&&p.epoch==VehicleEvProfile.epoch()&&a!=null&&a.enabled&&a.readerActive&&a.epoch==i.epoch&&i.session.equals(a.session)&&now>=i.captured&&now<=i.deadline
            &&(!a.sourceKnown||a.energyUsable&&Objects.equals(i.sourceIdentity,a.sourceIdentity));
    }
}
