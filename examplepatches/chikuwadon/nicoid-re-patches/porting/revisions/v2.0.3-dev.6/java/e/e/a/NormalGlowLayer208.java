package e.e.a;
import android.content.Context;
import android.graphics.Canvas;
import android.view.View;

/** A non-interactive ambient plane placed immediately ABOVE the video texture
 * and BELOW all native comment and control views. The glow is measured in
 * decor coordinates, so translate its canvas into the video parent's space.
 */
final class NormalGlowLayer208 extends View {
 private final AmbientLight.Glow glow;
 private final int[] decorPosition=new int[2];
 private final int[] layerPosition=new int[2];
 private int offsetX,offsetY;
 NormalGlowLayer208(Context context,AmbientLight.Glow source){
  super(context);
  glow=source;
  setWillNotDraw(false);
  setClickable(false);
  setFocusable(false);
  setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
  source.setCallback(this);
 }
 void update(View decor){
  if(decor==null)return;
  decor.getLocationOnScreen(decorPosition);
  getLocationOnScreen(layerPosition);
  offsetX=layerPosition[0]-decorPosition[0];
  offsetY=layerPosition[1]-decorPosition[1];
  invalidate();
 }
 @Override protected void onDraw(Canvas canvas){
  super.onDraw(canvas);
  int saved=canvas.save();
  canvas.translate(-offsetX,-offsetY);
  glow.draw(canvas);
  canvas.restoreToCount(saved);
 }
 void detach(){
  if(glow.getCallback()==this)glow.setCallback(null);
 }
}
