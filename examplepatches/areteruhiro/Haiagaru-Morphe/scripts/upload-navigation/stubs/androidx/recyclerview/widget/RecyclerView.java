package androidx.recyclerview.widget;
import android.view.*;
public class RecyclerView {
 public static abstract class getSavedStateRegistryControllerannotations {public final View itemView;public getSavedStateRegistryControllerannotations(View v){itemView=v;}}
 public static abstract class read {public abstract int getItemCount();public abstract getSavedStateRegistryControllerannotations onCreateViewHolder(ViewGroup p,int type);public abstract void onBindViewHolder(getSavedStateRegistryControllerannotations h,int i);public void notifyDataSetChanged(){}}
}