package e.e.a;
/** Geometry is independent of scroll direction and never recenters visible tabs. */
final class TabUiRules244 {
 static int reveal(int scroll,int width,int left,int right){if(width<=0)return scroll;if(left<scroll)return Math.max(0,left);if(right>scroll+width)return Math.max(0,right-width);return scroll;}
 static boolean related(int type,String url){return type==13||type==14||url!=null&&(url.contains("nicovideo.jp/v1/recommend")||url.contains("nicovideo.jp/recommendations")||url.contains("flapi.nicovideo.jp/api/getrelation"));}
}
