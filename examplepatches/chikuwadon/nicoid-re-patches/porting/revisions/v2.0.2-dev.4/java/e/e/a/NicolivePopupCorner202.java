package e.e.a;

/**
 * Adapted from native nicoid PopupEdge249 / PopupResize236 corner semantics:
 * narrow corners own resize touches, the middle remains normal drag/tap.
 * Only pure geometry lives here, so bounds can be regression tested.
 */
final class NicolivePopupCorner202 {
    private NicolivePopupCorner202() {}

    static boolean hit(float x,float y,int width,int height,float density) {
        if (width<=0||height<=0||density<=0||Float.isNaN(x)||Float.isNaN(y)) return false;
        float horizontal=Math.min(width/4f,16f*density);
        float vertical=Math.min(height/4f,30f*density);
        boolean atX=(x>=0&&x<horizontal)||(x>=width-horizontal&&x<width);
        boolean atY=(y>=0&&y<vertical)||(y>=height-vertical&&y<height);
        return atX&&atY;
    }

    static int[] bounds(int initialWidth,int initialX,int initialY,
                        float deltaX,float deltaY,boolean left,boolean top,
                        float aspect,int screenWidth,int screenHeight,int minWidth) {
        if (initialWidth<1||screenWidth<1||screenHeight<1
                ||!(aspect>0)||Float.isNaN(aspect)||Float.isInfinite(aspect))
            throw new IllegalArgumentException("Invalid popup dimensions");
        int originalHeight=Math.max(1,Math.round(initialWidth/aspect));
        float adjustedX=left?-deltaX:deltaX, adjustedY=top?-deltaY:deltaY;
        // Least-squares projection of both finger deltas onto aspect-ratio
        // preserving width/height movement, like nicoid PopupResize236.
        float change=(adjustedX*aspect+adjustedY)*aspect/(aspect*aspect+1f);
        int min=Math.min(Math.max(1,minWidth),Math.min(screenWidth,Math.round(screenHeight*aspect)));
        int max=Math.max(min,Math.min(screenWidth,Math.round(screenHeight*aspect)));
        int width=Math.max(min,Math.min(max,Math.round(initialWidth+change)));
        int height=Math.max(1,Math.round(width/aspect));
        int x=left?initialX+initialWidth-width:initialX;
        int y=top?initialY+originalHeight-height:initialY;
        x=Math.max(0,Math.min(x,Math.max(0,screenWidth-width)));
        y=Math.max(0,Math.min(y,Math.max(0,screenHeight-height)));
        return new int[]{width,height,x,y};
    }
}
