package xyz.urro.transit;

/** Native navigation state, independent of whichever reminder or alert is displayed. */
final class GoVehicleState {
 enum State { UNKNOWN, INACTIVE, NOT_ABOARD, ABOARD }
 private GoVehicleState() {}
 private static Object get(Object o,String name)throws ReflectiveOperationException {return o.getClass().getMethod(name).invoke(o);}
 static State fromTrip(Object trip) {
  if(trip==null)return State.UNKNOWN;
  try {
   if(get(trip,"getGoSummaryCard")==null)return State.INACTIVE;
   Object items=get(trip,"getItems");if(!(items instanceof Iterable))return State.UNKNOWN;
   boolean navigation=false;
   for(Object item:(Iterable<?>)items){
    Object kind=get(item,"getItemType");if(!(kind instanceof Enum))return State.UNKNOWN;
    String type=((Enum<?>)kind).name();
    if(type.equals("TransitLeg")){
     Object segments=get(item,"getSegments");if(!(segments instanceof Iterable))return State.UNKNOWN;
     for(Object segment:(Iterable<?>)segments){
      Object header=get(segment,"getHeaderSection");if(header==null)continue;
      Object path=get(header,"getPathType");if(!(path instanceof Enum))return State.UNKNOWN;
      String name=((Enum<?>)path).name();if(name.equals("Riding"))return State.ABOARD;
      // A new enum or missing field isn't an alighting event.
      if(name.matches("Start|FirstAndLastStop|NearestStop|Center|End|Selected|CenterPastSelected|EndPastSelected"))navigation=true;
     }
    }else if(type.matches("WalkOutsideLeg|WalkEntranceLeg|WalkPathwayLeg"))navigation=true;
   }
   return navigation?State.NOT_ABOARD:State.UNKNOWN;
  }catch(ReflectiveOperationException|RuntimeException e){return State.UNKNOWN;}
 }
 static Boolean vehicleMembership(Object vehicle) {
  if(vehicle==null)return null;
  try {Object v=get(vehicle,"getContainsCurrentUser");return v instanceof Boolean?(Boolean)v:null;}
  catch(ReflectiveOperationException|RuntimeException e){return null;}
 }
}
