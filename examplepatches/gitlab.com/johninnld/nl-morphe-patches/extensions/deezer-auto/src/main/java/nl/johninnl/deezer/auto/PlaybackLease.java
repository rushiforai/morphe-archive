package nl.johninnl.deezer.auto;

/** Pure lifetime policy, independent of screens and their contexts. */
final class PlaybackLease {
    static boolean ongoing(int state){return state==3||state==6||state==8||state==4||state==5||state==9||state==10||state==11;}
    static boolean retain(int state,boolean ui,long pausedRemaining,long requestRemaining){
        return ui||ongoing(state)||state!=7&&requestRemaining>0||state==2&&pausedRemaining>0;
    }
}
