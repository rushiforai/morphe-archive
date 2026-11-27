package com.waze;
import java.util.*;
public class ConfigManager {
 public static final Map<Integer,Boolean> bools=new HashMap<>();
 public static boolean ignoreBool, failBool;
 public static int boolWrites;
 public boolean getConfigValueBoolNTV(int id){if(!NativeManager.nativeThread)throw new AssertionError("Native boolean read on UI thread");return bools.get(id);}
 public void setConfigValueBoolNTV(int id,boolean value){
  if(!NativeManager.nativeThread)throw new AssertionError("Native boolean write on UI thread");
  if(id!=668)throw new AssertionError("Unrelated boolean changed");
  if(value && failBool)throw new IllegalStateException("Rejected boolean");
  if(value && ignoreBool)return;
  bools.put(id,value);boolWrites++;
 }
 private static final ConfigManager INSTANCE=new ConfigManager();
 public static final Map<Integer,Long> values=new HashMap<>();
 public static int failId=-1,ignoreId=-1;
 public static long rejectValue=-1;
 public static int writes;
 static{reset();}
 public static void reset(){values.clear();values.put(863,200L);values.put(864,500L);values.put(867,200L);values.put(999,37L);writes=0;failId=ignoreId=-1;rejectValue=-1;}
 public static ConfigManager getInstance(){return INSTANCE;}
 public long getConfigValueLongNTV(int id){if(!NativeManager.nativeThread)throw new AssertionError("Native config read on UI thread");return values.get(id);}
 public void setConfigValueLongNTV(int id,long value){
  if(!NativeManager.nativeThread)throw new AssertionError("Native config write on UI thread");
  if(id==999)throw new AssertionError("Unrelated config changed");
  if(id==failId && value==rejectValue)throw new IllegalStateException("Rejected fixture value");
  if(id==ignoreId && value==rejectValue)return;
  values.put(id,value);writes++;
 }
}
