package nl.johninnl.wuplaycar;
/** Keep adaptive video/audio selection within the car budget, including native rebuilds. */
final class AdaptiveCap {
 private AdaptiveCap(){}
 static void apply(Object player)throws Exception {
  Object parameters=NativeCalls.call(player,"getTrackSelectionParameters");
  if(Integer.valueOf(9_000_000).equals(NativeCalls.optional(parameters,"maxVideoBitrate"))&&Integer.valueOf(1_000_000).equals(NativeCalls.optional(parameters,"maxAudioBitrate"))&&Boolean.FALSE.equals(NativeCalls.optional(parameters,"exceedVideoConstraintsIfNecessary"))&&Boolean.FALSE.equals(NativeCalls.optional(parameters,"exceedAudioConstraintsIfNecessary")))return;
  Object builder=NativeCalls.call(parameters,"buildUpon");
  builder.getClass().getField("maxVideoBitrate").setInt(builder,9_000_000);
  builder.getClass().getField("maxAudioBitrate").setInt(builder,1_000_000);
  for(String field:new String[]{"exceedVideoConstraintsIfNecessary","exceedAudioConstraintsIfNecessary"}){java.lang.reflect.Field member=builder.getClass().getField(field);member.setAccessible(true);member.setBoolean(builder,false);}
  NativeCalls.call(builder,"clearOverrides");
  NativeCalls.call(player,"setTrackSelectionParameters",NativeCalls.call(builder,"build"));
 }
}
