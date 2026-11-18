package patches.maps.gearslip;

import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.TimeZone;

/** The car cluster's Trip, built from Maps' actual step observations; Maps draws its own cards. */
final class CarNavigationModels {
    private CarNavigationModels() {}

    static Bundle trip(NativeGuidance.Snapshot value,long now,boolean imperial){
        String units=value.distanceUnits==null?imperial?"MILES":"KILOMETERS":value.distanceUnits;
        Bundle trip=CarProtocol.object("androidx.car.app.navigation.model.Trip");
        CarProtocol.field(trip,"mDestinations",CarProtocol.emptyList());
        CarProtocol.field(trip,"mDestinationTravelEstimates",CarProtocol.emptyList());
        boolean loading=value.cue==null||value.cue.isEmpty()||value.meters<0||value.seconds<0;
        CarProtocol.field(trip,"mIsLoading",CarProtocol.primitive(loading));
        CarProtocol.field(trip,"mSteps",loading?CarProtocol.emptyList():CarProtocol.list(Collections.singletonList(step(value.current,value.cue))));
        CarProtocol.field(trip,"mStepTravelEstimates",loading?CarProtocol.emptyList():CarProtocol.list(Collections.singletonList(estimate(value.meters,value.seconds,now,units))));
        return trip;
    }

    static Bundle distance(double meters,boolean imperial){
        return distance(meters,imperial?"MILES":"KILOMETERS");
    }
    static Bundle distance(double meters,String units){
        if(!Double.isFinite(meters)||meters<0)throw new IllegalArgumentException("Unknown native distance");
        double shown;int unit;
        if("MILES".equals(units)||"MILES_YARDS".equals(units)){
            boolean yards="MILES_YARDS".equals(units);double shortDistance=meters*(yards?1.0936133:3.28084);
            if(shortDistance<1000){shown=round(shortDistance,shortDistance>=100?50:10);unit=yards?7:6;}
            else{shown=meters/1609.344;unit=4;}
        }else if("KILOMETERS".equals(units)){
            if(meters<1000){shown=round(meters,meters>=100?50:10);unit=1;}
            else{shown=meters/1000;unit=2;}
        }else throw new IllegalArgumentException("Unresolved native distance units");
        Bundle distance=CarProtocol.object("androidx.car.app.model.Distance");
        CarProtocol.field(distance,"mDisplayDistance",CarProtocol.primitive(shown));
        CarProtocol.field(distance,"mDisplayUnit",CarProtocol.primitive(unit));
        return distance;
    }
    private static double round(double value,int step){return Math.max(0,Math.round(value/step)*(double)step);}

    static Bundle estimate(int meters,int seconds,long now,boolean imperial){
        return estimate(meters,seconds,now,imperial?"MILES":"KILOMETERS");
    }
    static Bundle estimate(int meters,int seconds,long now,String units){
        if(seconds<0)throw new IllegalArgumentException("Unknown native duration");
        Bundle estimate=CarProtocol.object("androidx.car.app.navigation.model.TravelEstimate");
        CarProtocol.field(estimate,"mRemainingDistance",distance(meters,units));
        CarProtocol.field(estimate,"mRemainingTimeSeconds",CarProtocol.primitive((long)seconds));
        long arrivalMillis=Math.addExact(now,Math.multiplyExact((long)seconds,1000));
        TimeZone zone=TimeZone.getDefault();
        Bundle arrival=CarProtocol.object("androidx.car.app.model.DateTimeWithZone");
        CarProtocol.field(arrival,"mTimeSinceEpochMillis",CarProtocol.primitive(arrivalMillis));
        CarProtocol.field(arrival,"mZoneOffsetSeconds",CarProtocol.primitive(zone.getOffset(arrivalMillis)/1000));
        CarProtocol.field(arrival,"mZoneShortName",CarProtocol.primitive(zone.getDisplayName(zone.inDaylightTime(new java.util.Date(arrivalMillis)),TimeZone.SHORT)));
        CarProtocol.field(estimate,"mArrivalTimeAtDestination",arrival);
        Bundle color=CarProtocol.object("androidx.car.app.model.CarColor");CarProtocol.field(color,"mType",CarProtocol.primitive(1));
        CarProtocol.field(estimate,"mRemainingDistanceColor",color);CarProtocol.field(estimate,"mRemainingTimeColor",color);
        return estimate;
    }

    /** Native instructions can carry line breaks; the host card sizes to every line. */
    static String singleLine(String cue){return cue==null?"":cue.replaceAll("\\s+"," ").trim();}
    static Bundle step(NativeGuidance.Step value,String cue){
        Bundle step=CarProtocol.object("androidx.car.app.navigation.model.Step");
        CarProtocol.field(step,"mCue",CarProtocol.text(singleLine(cue)));
        List<Bundle> lanes=new ArrayList<>();
        if(value!=null){
            Bundle maneuver=CarProtocol.object("androidx.car.app.navigation.model.Maneuver");
            int type=maneuverType(value);
            CarProtocol.field(maneuver,"mType",CarProtocol.primitive(type));
            if((type==32||type==34)&&value.roundaboutExit>0)
                CarProtocol.field(maneuver,"mRoundaboutExitNumber",CarProtocol.primitive(value.roundaboutExit));
            CarProtocol.field(maneuver,"mIcon",CarProtocol.icon(CarNavigationGlyphs.maneuver(value)));
            CarProtocol.field(step,"mManeuver",maneuver);
            for(List<NativeGuidance.Direction> nativeLane:value.lanes){
                List<Bundle> directions=new ArrayList<>();
                for(NativeGuidance.Direction nativeDirection:nativeLane){
                    Bundle direction=CarProtocol.object("androidx.car.app.navigation.model.LaneDirection");
                    CarProtocol.field(direction,"mShape",CarProtocol.primitive(laneShape(nativeDirection)));
                    CarProtocol.field(direction,"mIsRecommended",CarProtocol.primitive(nativeDirection.recommended));directions.add(direction);
                }
                if(!directions.isEmpty()){
                    Bundle lane=CarProtocol.object("androidx.car.app.navigation.model.Lane");
                    CarProtocol.field(lane,"mDirections",CarProtocol.list(directions));lanes.add(lane);
                }
            }
            if(!lanes.isEmpty())CarProtocol.field(step,"mLanesImage",CarProtocol.icon(CarNavigationGlyphs.lanes(value.lanes),false));
        }
        CarProtocol.field(step,"mLanes",CarProtocol.list(lanes));
        return step;
    }

    static int laneShape(NativeGuidance.Direction value){
        switch(value.shape){
            case "STRAIGHT":return 2;
            case "SLIGHT":return value.right?4:3;
            case "NORMAL":return value.right?6:5;
            case "SHARP":return value.right?8:7;
            case "U_TURN":return value.right?10:9;
            default:return 1;
        }
    }

    /** Public CAL1.8 maneuver constants; native Enum.name(), never R8 ordinals. */
    static int maneuverType(NativeGuidance.Step value){
        boolean left="SIDE_LEFT".equals(value.side),right="SIDE_RIGHT".equals(value.side);
        switch(value.maneuver){
            case "DEPART":return 1;
            case "NAME_CHANGE":return 2;
            case "STRAIGHT":return 36;
            case "DESTINATION":return left?41:right?42:39;
            case "FERRY":return left?47:right?48:37;
            case "FERRY_TRAIN":return left?49:right?50:38;
            case "MERGE":return left?27:right?28:29;
            case "FORK":return left?25:right?26:0;
            case "LANE_CHANGE":return left?3:right?4:0;
            case "UTURN":return left?11:right?12:0;
            case "TURN":case "COUNTED_TURN":
                if(!left&&!right)return 0;
                switch(value.turn){
                    case "TURN_SLIGHT":return left?5:6;
                    case "TURN_NORMAL":return left?7:8;
                    case "TURN_SHARP":return left?9:10;
                    case "TURN_UTURN":return left?11:12;
                    case "TURN_KEEP":return left?3:4;
                    case "TURN_STRAIGHT":return 36;
                    default:return 0;
                }
            case "ON_RAMP":
                if(!left&&!right)return 0;
                switch(value.turn){
                    case "TURN_SLIGHT":return left?13:14;
                    case "TURN_NORMAL":return left?15:16;
                    case "TURN_SHARP":return left?17:18;
                    case "TURN_UTURN":return left?19:20;
                    default:return 0;
                }
            case "OFF_RAMP":
                if(!left&&!right)return 0;
                if("TURN_SLIGHT".equals(value.turn))return left?21:22;
                return "TURN_NORMAL".equals(value.turn)?left?23:24:0;
            case "ROUNDABOUT_ENTER":case "ROUNDABOUT_EXIT":case "ROUNDABOUT_ENTER_AND_EXIT":
                boolean clockwise="LEFT".equals(value.drivingSide),counterclockwise="RIGHT".equals(value.drivingSide);
                if(!clockwise&&!counterclockwise)return 0;
                if("ROUNDABOUT_ENTER".equals(value.maneuver))return clockwise?43:45;
                if("ROUNDABOUT_EXIT".equals(value.maneuver))return clockwise?44:46;
                return value.roundaboutExit>0?clockwise?32:34:0;
            default:return 0;
        }
    }
}
