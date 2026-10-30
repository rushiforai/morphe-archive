// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Pure policy. Caller serializes access. An absolute override cannot accumulate. */
final class ClusterZoomPolicy {
    static final float MIN=3f,MAX=21f;
    private float manual=Float.NaN;
    static boolean valid(float value){return !Float.isNaN(value)&&!Float.isInfinite(value)&&value>=MIN&&value<=MAX;}
    boolean manual(){return valid(manual);}
    float chosen(){return manual;}
    static boolean bounds(float lower,float upper){return valid(lower)&&valid(upper)&&lower<=upper;}
    private static float clamp(float value,float lower,float upper){
        // Fractional viewport bounds must survive a float +1/-1 round trip.
        if(value<=lower+.00001f)return lower;if(value>=upper-.00001f)return upper;return value;
    }
    float apply(float original){return apply(original,MIN,MAX);}
    float apply(float original,float lower,float upper){
        if(!valid(original)||!manual()||!bounds(lower,upper))return original;
        manual=clamp(manual,lower,upper);return manual;
    }
    boolean step(int direction,float current){return step(direction,current,MIN,MAX);}
    boolean step(int direction,float current,float lower,float upper){
        if((direction!=1&&direction!=-1)||!valid(current)||!bounds(lower,upper))return false;
        float previous=manual()?manual:current;
        float next=clamp(clamp(previous,lower,upper)+direction,lower,upper);
        if(next==previous)return false;
        manual=next;return true;
    }
    void reset(){manual=Float.NaN;}
    static boolean isolated(Object mainManager,Object mainDispatcher,Object mainLegacy,Object mainModern,
                            Object clusterManager,Object clusterDispatcher,Object clusterLegacy,Object clusterModern){
        return mainManager!=null&&mainDispatcher!=null&&mainLegacy!=null&&mainModern!=null
            &&clusterManager!=null&&clusterDispatcher!=null&&clusterLegacy!=null&&clusterModern!=null
            &&mainManager!=clusterManager&&mainDispatcher!=clusterDispatcher
            &&mainLegacy!=clusterLegacy&&mainModern!=clusterModern;
    }
}
