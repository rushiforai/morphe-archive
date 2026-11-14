package e.e.a;

public final class NicolivePopupCorner202Test {
    private static void check(boolean ok,String what) {
        if(!ok)throw new AssertionError(what);
    }
    public static void main(String[] args) {
        check(NicolivePopupCorner202.hit(1,1,300,170,1),"top left hit");
        check(NicolivePopupCorner202.hit(299,1,300,170,1),"top right hit");
        check(NicolivePopupCorner202.hit(1,169,300,170,1),"bottom left hit");
        check(NicolivePopupCorner202.hit(299,169,300,170,1),"bottom right hit");
        check(!NicolivePopupCorner202.hit(140,1,300,170,1),"top-center controls unclaimed");
        check(!NicolivePopupCorner202.hit(180,165,300,170,1),"bottom buttons unclaimed");
        check(!NicolivePopupCorner202.hit(160,90,300,170,1),"center drag unclaimed");
        float ratio=16f/9f;
        for(boolean left:new boolean[]{false,true})for(boolean top:new boolean[]{false,true}){
            int initialWidth=300,initialHeight=Math.round(initialWidth/ratio);
            int x=100,y=160;
            int[] result=NicolivePopupCorner202.bounds(initialWidth,x,y,
                    left?-40:40,top?-20:20,left,top,ratio,1080,2400,192);
            check(result[0]>initialWidth,"corner enlarge");
            check(Math.abs(result[1]-result[0]/ratio)<2,"aspect preserved");
            check(left?result[2]+result[0]==x+initialWidth:result[2]==x,"x anchor");
            check(top?result[3]+result[1]==y+initialHeight:result[3]==y,"y anchor");
            check(result[0]>=192&&result[0]<=1080,"width bounds");
        }
        int[] clamped=NicolivePopupCorner202.bounds(300,0,0,3000,3000,false,false,
                ratio,400,600,192);
        check(clamped[0]<=400&&clamped[1]<=600,"screen limit");
        System.out.println("PASS: four-corner resizing, aspect ratio, anchors and touch hit areas");
    }
}
