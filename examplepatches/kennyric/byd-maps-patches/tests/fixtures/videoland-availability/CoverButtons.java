package fixtures.availability;
import java.lang.reflect.*;import java.util.*;
import com.bedrockstreaming.tornado.tv.molecule.CoverView;
import com.bedrockstreaming.tornado.compose.molecule.button.TornadoButton;
public class CoverButtons {
 public static int run()throws Exception{
  if(android.os.Looper.getMainLooper()==null)android.os.Looper.prepareMainLooper();
  Class<?> thread=Class.forName("android.app.ActivityThread");Object activity=thread.getMethod("systemMain").invoke(null);
  android.content.Context context=(android.content.Context)thread.getMethod("getSystemContext").invoke(activity);
  CoverView cover=new CoverView(context);cover.setButtonText("Abonneren op Videoland");TornadoButton button=cover.getButtonView();button.setOnClickListener(v->{});
  Object binder=AvailabilityPaging.allocate.invoke(AvailabilityPaging.unsafe,Class.forName("Eo.a"));AvailabilityPaging.set(binder,"b",cover);
  Method bind=binder.getClass().getMethod("r",List.class);bind.invoke(binder,Collections.singletonList(null));
  AvailabilityPaging.check(cover.j0==null&&button.text==null&&button.getVisibility()==android.view.View.GONE&&button.listener==null,"native recycled cover clears absent subscription CTA and focus target");
  Object available=Class.forName("kn.f$e").getConstructor(String.class,android.graphics.drawable.Drawable.class,String.class).newInstance("Afspelen",null,"Afspelen");bind.invoke(binder,Collections.singletonList(available));
  AvailabilityPaging.check("Afspelen".equals(cover.j0)&&button.getVisibility()==android.view.View.VISIBLE&&button.listener!=null,"native recycled cover restores available action visibility and listener");
  bind.invoke(binder,Collections.emptyList());AvailabilityPaging.check(button.getVisibility()==android.view.View.GONE&&cover.j0==null,"native recycled cover clears an empty action list");
  return 0; // checks counted by AvailabilityPaging.check
 }
}
