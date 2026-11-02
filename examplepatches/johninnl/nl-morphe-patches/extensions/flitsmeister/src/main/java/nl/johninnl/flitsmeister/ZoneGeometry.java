package nl.johninnl.flitsmeister;

/** Local projection onto the report's directed polyline, all distances in metres. */
final class ZoneGeometry {
    private ZoneGeometry() {}
    static final class Result {
        final boolean inside; final int remaining, percent;
        Result(boolean inside,int remaining,int percent) { this.inside=inside;this.remaining=remaining;this.percent=percent; }
    }
    static boolean beforeStart(double[][] path,double latitude,double longitude) {
        if(path==null || path.length<2)return false;
        double cos=Math.cos(Math.toRadians(latitude));
        double dx=(path[1][1]-path[0][1])*cos,dy=path[1][0]-path[0][0];
        return ((longitude-path[0][1])*cos*dx+(latitude-path[0][0])*dy)<0;
    }
    static Result project(double[][] path,double latitude,double longitude) {
        Result missing=new Result(false,-1,-1);
        if(path==null || path.length<2 || !Double.isFinite(latitude) || !Double.isFinite(longitude))return missing;
        double total=0,best=Double.POSITIVE_INFINITY,along=0,scale=111195.08,cos=Math.cos(Math.toRadians(latitude));
        for(int i=1;i<path.length;i++) {
            if(path[i-1].length<2 || path[i].length<2)return missing;
            double ax=(path[i-1][1]-longitude)*scale*cos,ay=(path[i-1][0]-latitude)*scale;
            double bx=(path[i][1]-longitude)*scale*cos,by=(path[i][0]-latitude)*scale;
            double dx=bx-ax,dy=by-ay,length=Math.hypot(dx,dy);
            if(!Double.isFinite(length))return missing;
            if(length==0)continue;
            double t=Math.max(0,Math.min(1,-(ax*dx+ay*dy)/(length*length)));
            double distance=Math.hypot(ax+t*dx,ay+t*dy);
            if(distance<best) {best=distance;along=total+t*length;}
            total+=length;
        }
        if(total<=0 || best>30 || total>Integer.MAX_VALUE)return missing;
        return new Result(true,(int)Math.round(Math.max(0,total-along)),(int)Math.floor(100*along/total));
    }
}
