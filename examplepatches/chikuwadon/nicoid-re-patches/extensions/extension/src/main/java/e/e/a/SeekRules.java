package e.e.a;
final class SeekRules {
 static int seconds(int progress){return Math.max(0,Math.min(60,progress));}
 static int progress(int seconds){return Math.max(0,Math.min(60,seconds));}
 static long target(long current,long duration,int side,int seconds){long offset=(long)Math.min(60,Math.max(0,seconds))*1000;return Math.max(0,Math.min(duration,Math.max(0,current)+(side<0?-offset:offset)));}
}
