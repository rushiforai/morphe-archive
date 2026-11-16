package e.e.a;

/** Helps newly received scrolling comments enter naturally and reserve their drawn rows. */
public final class CommentFlow220 {
 private static final float LATE_GRACE_SECONDS=0.18f;
 private CommentFlow220(){}

 /** Only called once for a newly placed comment; never changes an active trajectory. */
 public static float start(float intended,float visualNow){
  if(Float.isNaN(intended)||Float.isNaN(visualNow)||
     Float.isInfinite(intended)||Float.isInfinite(visualNow))return intended;
  return visualNow-intended>LATE_GRACE_SECONDS?visualNow:intended;
 }

 /** Actual painted height of multiline scrolling text (line step is 1.15x). */
 public static float height(String text,float fontHeight){
  if(text==null||text.indexOf('\n')<0)return fontHeight;
  int rows=1;
  for(int i=0;i<text.length();i++)if(text.charAt(i)=='\n')rows++;
  return fontHeight*(1f+1.15f*(rows-1));
 }
}
