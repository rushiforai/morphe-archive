package patches.maps.gearslip;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import java.util.List;

/** Canvas maneuver/lane icons for the host, following Vela's NavGlyphs/LaneImage design. */
final class CarNavigationGlyphs {
    private CarNavigationGlyphs() {}
    static Bitmap maneuver(NativeGuidance.Step step){
        Bitmap result=Bitmap.createBitmap(128,128,Bitmap.Config.ARGB_8888);
        Canvas canvas=new Canvas(result);canvas.scale(128f/96,128f/96);
        Paint stroke=stroke(Color.WHITE,8),fill=fill(Color.WHITE);
        boolean left="SIDE_LEFT".equals(step.side),right="SIDE_RIGHT".equals(step.side);
        String kind=step.maneuver;
        if("DESTINATION".equals(kind)){
            canvas.drawLine(38,76,38,22,stroke);Path flag=new Path();flag.moveTo(38,24);flag.lineTo(66,32);flag.lineTo(38,42);flag.close();canvas.drawPath(flag,fill);
        }else if(kind.startsWith("ROUNDABOUT")){
            canvas.drawCircle(48,52,15,stroke);canvas.drawLine(48,78,48,67,stroke);
            if(step.roundaboutExit>0){Paint text=fill(Color.WHITE);text.setTextSize(20);text.setTextAlign(Paint.Align.CENTER);canvas.drawText(Integer.toString(step.roundaboutExit),48,59,text);}
            canvas.drawLine(48,37,48,22,stroke);head(canvas,48,22,0,fill);
        }else if("MERGE".equals(kind)){
            Path path=new Path();path.moveTo(32,78);path.quadTo(48,60,48,44);path.lineTo(48,26);canvas.drawPath(path,stroke);
            path.reset();path.moveTo(64,78);path.quadTo(48,60,48,44);canvas.drawPath(path,stroke);head(canvas,48,26,0,fill);
        }else if("FERRY".equals(kind)||"FERRY_TRAIN".equals(kind)){
            canvas.drawRoundRect(new RectF(27,23,69,63),5,5,stroke);canvas.drawLine(27,43,69,43,stroke);
            canvas.drawLine(26,74,70,74,stroke);canvas.drawLine(33,64,27,80,stroke);canvas.drawLine(63,64,69,80,stroke);
        }else if(CarNavigationModels.maneuverType(step)==0){
            canvas.drawCircle(48,48,25,stroke);Paint text=fill(Color.WHITE);text.setTextSize(40);text.setTextAlign(Paint.Align.CENTER);canvas.drawText("?",48,63,text);
        }else{
            if(left){canvas.save();canvas.scale(-1,1,48,48);}
            Path path=new Path();
            if("UTURN".equals(kind)||"TURN_UTURN".equals(step.turn)){
                path.moveTo(34,76);path.lineTo(34,42);path.quadTo(34,26,47,26);path.quadTo(60,26,60,42);path.lineTo(60,58);
                canvas.drawPath(path,stroke);head(canvas,60,58,180,fill);
            }else if((left||right)&&("TURN_SLIGHT".equals(step.turn)||"TURN_KEEP".equals(step.turn)||"FORK".equals(kind)||"LANE_CHANGE".equals(kind))){
                path.moveTo(44,78);path.lineTo(44,58);path.lineTo(58,34);canvas.drawPath(path,stroke);head(canvas,58,34,30,fill);
            }else if((left||right)&&"TURN_SHARP".equals(step.turn)){
                path.moveTo(40,78);path.lineTo(40,42);path.lineTo(62,60);canvas.drawPath(path,stroke);head(canvas,62,60,140,fill);
            }else if(left||right){
                path.moveTo(38,76);path.lineTo(38,46);path.quadTo(38,34,50,34);path.lineTo(64,34);canvas.drawPath(path,stroke);head(canvas,64,34,90,fill);
            }else{canvas.drawLine(48,78,48,30,stroke);head(canvas,48,30,0,fill);}
            if(left)canvas.restore();
        }
        return result;
    }

    static Bitmap lanes(List<List<NativeGuidance.Direction>> lanes){
        int cells=0;for(List<NativeGuidance.Direction> lane:lanes)if(!lane.isEmpty())cells++;
        Bitmap result=Bitmap.createBitmap(Math.max(1,cells)*60,60,Bitmap.Config.ARGB_8888);
        Canvas canvas=new Canvas(result);int index=0;
        for(List<NativeGuidance.Direction> lane:lanes){
            if(lane.isEmpty())continue;
            float x=index++*60+30;
            // Unselected alternatives remain dim; selected alternatives draw over them.
            for(boolean recommended:new boolean[]{false,true})for(NativeGuidance.Direction d:lane)if(d.recommended==recommended){
                int color=recommended?Color.WHITE:0xff59616e;
                Paint stroke=stroke(color,4),fill=fill(color);int shape=CarNavigationModels.laneShape(d);
                float angle=shape==3?-40:shape==4?40:shape==5?-90:shape==6?90:shape==7?-135:shape==8?135:shape==9?-180:shape==10?180:0;
                if(shape==1){canvas.drawCircle(x,25,7,stroke);continue;}
                canvas.save();canvas.rotate(angle,x,30);canvas.drawLine(x,49,x,20,stroke);head(canvas,x,20,0,fill);canvas.restore();
            }
        }
        return result;
    }
    private static Paint fill(int color){Paint paint=new Paint(Paint.ANTI_ALIAS_FLAG);paint.setColor(color);paint.setStyle(Paint.Style.FILL);return paint;}
    private static Paint stroke(int color,float width){Paint paint=fill(color);paint.setStyle(Paint.Style.STROKE);paint.setStrokeWidth(width);paint.setStrokeCap(Paint.Cap.ROUND);paint.setStrokeJoin(Paint.Join.ROUND);return paint;}
    private static void head(Canvas canvas,float x,float y,float angle,Paint paint){
        double radians=Math.toRadians(angle);float dx=(float)Math.sin(radians),dy=-(float)Math.cos(radians),px=-dy,py=dx;
        Path path=new Path();path.moveTo(x+dx*8.4f,y+dy*8.4f);path.lineTo(x-dx*5.6f+px*9,y-dy*5.6f+py*9);
        path.lineTo(x-dx*5.6f-px*9,y-dy*5.6f-py*9);path.close();canvas.drawPath(path,paint);
    }
}
