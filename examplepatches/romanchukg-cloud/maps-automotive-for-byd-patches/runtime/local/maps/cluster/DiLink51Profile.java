// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** Measured profile facts only. Unknown firmware/theme/size never selects another layer. */
public final class DiLink51Profile {
    public enum Theme { UNKNOWN, MAP, SCENARIO, SIMPLE }
    private static final String JULY22="BYD-AUTO/IVI/IVI:13/TP1A.220624.014/eng.build20260722.221155:user/release-keys";
    private static final String JULY05="BYD-AUTO/IVI/IVI:13/TP1A.220624.014/eng.build20260705.021352:user/release-keys";
    private DiLink51Profile(){}
    public static boolean supported(String fingerprint){return JULY22.equals(fingerprint)||JULY05.equals(fingerprint);}
    public static String displayName(Theme theme){
        if(theme==Theme.MAP)return "shared_fission_bg_XDJAScreenProjection_0";
        if(theme==Theme.SCENARIO||theme==Theme.SIMPLE)return "shared_fission_bg_XDJAScreenProjection_1";
        return null;
    }
    public static Area area(Theme theme,int width,int height){
        if(width!=1920||height!=720)return null;
        if(theme==Theme.MAP)return new Area(0,144,1920,480);
        if(theme==Theme.SCENARIO||theme==Theme.SIMPLE)return new Area(1320,0,600,720);
        return null;
    }
    public static final class Area {
        public final int left,top,width,height,right,bottom;
        private Area(int left,int top,int width,int height){this.left=left;this.top=top;this.width=width;this.height=height;right=left+width;bottom=top+height;}
    }
}
