import e.e.a.PlaybackRules;
public final class PlaybackRulesTest {
    private static int checks;
    static void check(boolean ok){checks++;if(!ok)throw new AssertionError("check "+checks);}
    public static void main(String[] args){
        check(PlaybackRules.SPEEDS.length==59);
        float prior=0;
        for(float speed:PlaybackRules.SPEEDS){check(speed>prior);check(PlaybackRules.defaultSpeed(Float.toString(speed))==speed);prior=speed;}
        for(String invalid:new String[]{null,"","bad","NaN","Infinity","0","3.05","4.0"})check(PlaybackRules.defaultSpeed(invalid)==1f);
        check(PlaybackRules.canRestore(20000,60000,0,0));
        check(!PlaybackRules.canRestore(20000,60000,1000,0));
        check(!PlaybackRules.canRestore(20000,60000,0,10000));
        check(!PlaybackRules.canRestore(59000,60000,0,0));
        check(!PlaybackRules.canRestore(0,60000,0,0));
        check(PlaybackRules.checkpoint(59000,60000)==0);
        check(PlaybackRules.checkpoint(20000,60000)==20000);
        check(PlaybackRules.checkpoint(-1,60000)==-1);
        check(PlaybackRules.version(2)==2);check(PlaybackRules.version("2")==2);
        check(PlaybackRules.version(null)==2);check(PlaybackRules.version("bad")==2);
        System.out.println("Playback rules: "+checks+" checks passed");
    }
}
