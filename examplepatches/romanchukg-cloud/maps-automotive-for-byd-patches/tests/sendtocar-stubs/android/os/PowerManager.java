// SPDX-License-Identifier: GPL-3.0-only
package android.os;
public class PowerManager{public static java.util.Set<String> exempt=new java.util.HashSet<>();public boolean isIgnoringBatteryOptimizations(String p){return exempt.contains(p);}}
