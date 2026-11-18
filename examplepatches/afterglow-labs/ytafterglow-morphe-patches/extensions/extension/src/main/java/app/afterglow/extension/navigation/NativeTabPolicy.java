package app.afterglow.extension.navigation;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/** iOS pivot row/anchor policy, independent of native widget classes and availability timing. */
public final class NativeTabPolicy {
    public static final String CONTROL_CENTER="YTAGControlCenter";
    public static final int NATIVE_CAPACITY=6;
    private NativeTabPolicy() {}
    /** Tracks our added space while recognizing a later native fixed-height reset. */
    public static final class ContainerHeight {
        private int original,last,lastExtra;
        public ContainerHeight(int value){original=value;last=value;}
        public boolean current(int value,int extra){return value==last&&extra==lastExtra;}
        public int apply(int value,int extra) {
            if(value!=last)original=value;
            lastExtra=extra;
            // Negative native sizes retain MATCH_PARENT / WRAP_CONTENT behavior.
            last=original>0?original+extra:original;
            return last;
        }
    }
    public static String canonical(String id) {
        if(id==null)return "";
        if(id.equals("FEvideo_picker"))return "FEuploads";
        if(id.equals("FEexplore") || id.equals("FEtrending"))return "FEhype_leaderboard";
        return id;
    }
    public static final class Plan {
        public final List<String> top,bonus,ordered;
        public final String left,right;
        Plan(List<String> top,List<String> bonus,String left,String right) {
            this.top=Collections.unmodifiableList(top);this.bonus=Collections.unmodifiableList(bonus);this.left=left;this.right=right;
            List<String> all=new ArrayList<>(top);all.addAll(bonus);ordered=Collections.unmodifiableList(all);
        }
        public boolean twoRows(){return !bonus.isEmpty();}
        public boolean anchored(){return twoRows()&&!left.isEmpty()&&!right.isEmpty();}
    }
    public static Plan plan(List<String> active,List<String> available,boolean bonusEnabled,boolean anchors,String desiredLeft,String desiredRight) {
        List<String> top=new ArrayList<>(),bonus=new ArrayList<>();
        for(int i=0;i<Math.min(active.size(),32);i++) {
            String id=canonical(active.get(i));if(!available.contains(id)||top.contains(id)||bonus.contains(id))continue;
            // Missing native renderers do not promote a saved bonus choice into the top row.
            if(i<NATIVE_CAPACITY)top.add(id);else if(bonusEnabled)bonus.add(id);
        }
        String left="",right="";
        if(anchors&&bonusEnabled&&!bonus.isEmpty()&&top.size()>=2) {
            left=top.contains(desiredLeft)?desiredLeft:top.contains(CONTROL_CENTER)?CONTROL_CENTER:top.get(0);
            right=top.contains(desiredRight)&&!desiredRight.equals(left)?desiredRight:top.contains("FElibrary")&&!left.equals("FElibrary")?"FElibrary":"";
            if(right.isEmpty())for(int i=top.size()-1;i>=0;i--)if(!top.get(i).equals(left)){right=top.get(i);break;}
        }
        return new Plan(top,bonus,left,right);
    }
    public static final class Frame {
        public final int left,top,right,bottom;
        Frame(int left,int top,int right,int bottom){this.left=left;this.top=top;this.right=right;this.bottom=bottom;}
        public int width(){return Math.max(0,right-left);}public int height(){return Math.max(0,bottom-top);}
    }
    /** Explicit optional upstream commands keep their selected insertion positions. */
    public static Plan withExtras(Plan original,Map<String,Integer> positions) {
        List<String> top=new ArrayList<>(original.top);
        for(Map.Entry<String,Integer> entry:positions.entrySet()) {
            if(top.size()>=NATIVE_CAPACITY+2)break;
            String id=entry.getKey();
            if(!id.equals(NativeTabProto.COMPAT_SEARCH)&&!id.equals(NativeTabProto.COMPAT_SETTINGS))continue;
            if(!top.contains(id))top.add(Math.max(0,Math.min(entry.getValue(),top.size())),id);
        }
        return new Plan(top,new ArrayList<>(original.bonus),original.left,original.right);
    }
    public static Frame frame(Plan plan,String id,int width,int rowHeight,int bonusHeight,boolean rtl) {
        if(width<=0||rowHeight<=0)return new Frame(0,0,0,0);
        boolean bonus=plan.bonus.contains(id);List<String> row=bonus?plan.bonus:plan.top;
        int index=row.indexOf(id);if(index<0)return new Frame(0,0,0,0);
        int left=0,right=width,top=bonus?rowHeight:0,bottom=bonus?rowHeight+bonusHeight:rowHeight;
        if(plan.anchored()) {
            int inset=Math.min(8*rowHeight/48,width/12),slot=width/6,anchor=Math.max(0,slot-inset-2*rowHeight/48);
            if(id.equals(plan.left)||id.equals(plan.right)) {
                left=id.equals(plan.left)?inset:width-inset-anchor;right=left+anchor;top=0;bottom=Math.max(rowHeight,rowHeight+bonusHeight-18*rowHeight/48);
            }else {
                List<String> center=new ArrayList<>(row);center.remove(plan.left);center.remove(plan.right);index=center.indexOf(id);
                if(index<0)return new Frame(0,0,0,0);
                int start=slot,end=width-slot,span=Math.max(0,end-start);
                left=start+span*index/center.size();right=start+span*(index+1)/center.size();
            }
        }else {left=width*index/row.size();right=width*(index+1)/row.size();}
        return rtl?new Frame(width-right,top,width-left,bottom):new Frame(left,top,right,bottom);
    }
}
