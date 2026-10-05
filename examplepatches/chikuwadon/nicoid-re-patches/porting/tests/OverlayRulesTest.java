package e.e.a;
public final class OverlayRulesTest {
 static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
 public static void main(String[] args){for(float density:new float[]{1,2,3,4}){int previous=0;for(int heightDp:new int[]{90,120,175,240,360}){int height=Math.round(heightDp*density),width=Math.round(heightDp*16f/9*density);int toolbar=OverlayRules.toolbar(width,height,density),central=OverlayRules.central(height,density);check(toolbar>=previous,"toolbar follows popup size");check(OverlayRules.slot(toolbar)*6<=width+3,"all top controls fit horizontally");check(toolbar<=height*.16f+1,"toolbar doesn't dominate video");check(central<=height*.27f+1&&central<=64*density+1,"central control remains proportionate");previous=toolbar;}}check(OverlayRules.slot(OverlayRules.toolbar(160,400,1))*6<=160,"narrow portrait window also fits");System.out.println("Popup geometry: 81 fit/proportion checks passed");}
}
