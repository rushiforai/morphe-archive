package local.maps.cluster;

/** Physical coordinates, independent of system and per-app language/layout direction. */
final class ClusterButtonPlacement {
    static int columnHeight(int slot,int wantedRows,int available){
        return slot>0&&wantedRows>0&&available>=slot?Math.min(wantedRows,available/slot)*slot:0;
    }
    static int assistantTop(int top,int height,int nativeSlot,int bottom){
        if(height<=0)return -1;
        int y=top+Math.max(nativeSlot,height+Math.max(1,height/8));
        return y+height<=bottom?y:-1;
    }
    /** Beside the search card, on the side facing the screen centre (right of it on a left card), so
     * the driver reaches it next to Search. The other side is tried when that one would leave the
     * screen or cover the native button column. -1 when there is no card or no free side. */
    static int besideCard(int left,int right,int width,int cardLeft,int cardRight,int gap,int columnLeft,int columnRight){
        if(cardRight<=cardLeft||width<=0||right<=left)return -1;
        int after=cardRight+gap,before=cardLeft-gap-width;
        boolean centreSide=cardLeft+cardRight<=left+right;
        for(int x:centreSide?new int[]{after,before}:new int[]{before,after})
            if(x>=left&&x+width<=right&&(x>=columnRight||x+width<=columnLeft))return x;
        return -1;
    }
    /** Centred on the Search box row when it is shown; otherwise level with the native gear. */
    static int besideTop(int anchorTop,int boxTop,int boxBottom,int height){
        return boxBottom>boxTop?boxTop+(boxBottom-boxTop-height)/2:anchorTop;
    }
    static int settingsLeft(int left,int right,int anchorLeft,int anchorRight,int cardLeft,int cardRight){
        int width=anchorRight-anchorLeft;
        boolean columnRight=anchorLeft+anchorRight>left+right;
        int gap=Math.max(0,columnRight?right-anchorRight:anchorLeft-left);
        boolean onLeft=cardRight>cardLeft?cardLeft+cardRight>left+right:columnRight;
        int x=onLeft?left+gap:right-gap-width;
        // Some car layouts move the search card without mirroring the native button column.
        if(x<anchorRight&&x+width>anchorLeft)x=onLeft?anchorRight+gap:anchorLeft-gap-width;
        return Math.max(left,Math.min(x,right-width));
    }
}
