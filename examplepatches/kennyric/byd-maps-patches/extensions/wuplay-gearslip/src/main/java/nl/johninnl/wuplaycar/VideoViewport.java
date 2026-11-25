package nl.johninnl.wuplaycar;
/** Keep video under floating side panels; respect vertical chrome for video and captions. */
public final class VideoViewport {
    public final int left,top,width,height,captionBottomMargin;
    private VideoViewport(int left,int top,int width,int height,int margin){this.left=left;this.top=top;this.width=width;this.height=height;captionBottomMargin=margin;}
    public static VideoViewport fit(int fullWidth,int fullHeight,int left,int top,int right,int bottom,float aspect){
        left=0;right=fullWidth;top=Math.max(0,top);bottom=Math.min(fullHeight,bottom);
        if(bottom<=top){top=0;bottom=fullHeight;}
        if(!(aspect>0)||Float.isInfinite(aspect))aspect=16f/9f;
        int availableWidth=right-left,availableHeight=bottom-top,w=availableWidth,h=Math.round(w/aspect);
        if(h>availableHeight){h=availableHeight;w=Math.round(h*aspect);}
        return new VideoViewport(left+(availableWidth-w)/2,top+(availableHeight-h)/2,w,h,fullHeight-bottom+Math.max(16,availableHeight/12));
    }
}
