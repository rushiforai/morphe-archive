package com.waze;
import java.util.*;
public class NativeManager {
 public static boolean started=true,nativeThread=false,accept=true;
 private static final Queue<Runnable> queue=new ArrayDeque<>();
 public static boolean isAppStarted(){return started;}
 public static boolean Post(Runnable task){if(!accept)return false;queue.add(task);return true;}
 public static void drain(){nativeThread=true;try{while(!queue.isEmpty())queue.remove().run();}finally{nativeThread=false;}}
}
