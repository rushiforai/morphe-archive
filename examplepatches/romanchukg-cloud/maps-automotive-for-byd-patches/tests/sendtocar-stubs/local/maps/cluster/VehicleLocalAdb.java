// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;
/** Test double: records commands; can simulate approval or unavailability and apply the exemption. */
public final class VehicleLocalAdb implements AutoCloseable{
 public static final class ApprovalRequiredException extends java.io.IOException{}
 static final java.util.List<String> commands=new java.util.ArrayList<>();static String mode="ok";static boolean allowKey;
 public static VehicleLocalAdb open(java.io.File d,boolean allowPublicKey,java.util.function.BooleanSupplier allowed)throws java.io.IOException{
  allowKey=allowPublicKey;if(!allowed.getAsBoolean())throw new java.io.IOException("cancelled");
  if(mode.equals("approval"))throw new ApprovalRequiredException();if(mode.equals("down"))throw new java.net.ConnectException();return new VehicleLocalAdb();}
 public String execute(String c){commands.add(c);if(c.endsWith("+app.revanced.android.gms")&&!mode.equals("ignored"))android.os.PowerManager.exempt.add("app.revanced.android.gms");if(c.endsWith("-app.revanced.android.gms"))android.os.PowerManager.exempt.remove("app.revanced.android.gms");return "";}
 public void close(){}}
