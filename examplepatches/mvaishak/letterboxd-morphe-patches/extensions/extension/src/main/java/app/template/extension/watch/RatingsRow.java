package app.template.extension.watch;

import android.content.Context;
import android.content.Intent;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import app.template.extension.settings.Prefs;
import app.template.extension.settings.ModSettingsActivity;
import app.template.extension.settings.HideSections;
import java.util.List;

/** Independent film summary row and its full ratings destination. */
public final class RatingsRow {
    public static final String TAG = "morphe.external.ratings.row";
    private RatingsRow() {}

    static void bind(View host, WatchAvailability.Film film) {
        if (!(host instanceof LinearLayout)) return;
        LinearLayout parent = (LinearLayout) host;
        View old = parent.findViewWithTag(TAG);
        if (old != null) parent.removeView(old);
        if (!Prefs.getBoolean(Prefs.KEY_EXTERNAL_RATINGS_ENABLED, false) || film.tmdb() == null
                || ExternalRatings.key(host.getContext()) == null) {
            HideSections.refreshWhereToWatch(parent);
            return;
        }
        Context context = host.getContext();
        LinearLayout row = new LinearLayout(context);
        row.setTag(TAG);
        row.setOrientation(LinearLayout.VERTICAL);
        View divider = WatchViews.inflate(parent, "include_divider");
        row.addView(divider, new LinearLayout.LayoutParams(-1, WatchViews.dp(context,1)));
        LinearLayout heading = new LinearLayout(context);
        heading.setGravity(Gravity.CENTER_VERTICAL);
        heading.setMinimumHeight(WatchViews.dp(context,48));
        heading.setPaddingRelative(WatchViews.dp(context,16),0,WatchViews.dp(context,16),0);
        TextView title = text(context,"External ratings","LabelLarge");
        heading.addView(title,new LinearLayout.LayoutParams(0,-2,1));
        ImageView arrow = new ImageView(context);
        arrow.setImageResource(WatchViews.resource(context,"drawable","chevron_right"));
        arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        heading.addView(arrow,new LinearLayout.LayoutParams(WatchViews.dp(context,24),WatchViews.dp(context,24)));
        row.addView(heading);
        HorizontalScrollView scroll = new HorizontalScrollView(context);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout scores = new LinearLayout(context);
        scores.setPaddingRelative(WatchViews.dp(context,16),0,WatchViews.dp(context,16),WatchViews.dp(context,12));
        scroll.addView(scores);
        row.addView(scroll);
        Runnable open = () -> context.startActivity(new Intent(context,ModSettingsActivity.class)
                .putExtra("externalRatingsTmdb",film.tmdb()).putExtra("externalRatingsTitle",film.title()));
        heading.setOnClickListener(v -> open.run());
        heading.setFocusable(true);
        // The native content child fills its parent until a second row is inserted.
        if (parent.getChildCount() > 1) {
            View content = parent.getChildAt(1);
            ViewGroup.LayoutParams params = content.getLayoutParams();
            params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            content.setLayoutParams(params);
        }
        parent.addView(row,new LinearLayout.LayoutParams(-1,-2));
        HideSections.refreshWhereToWatch(parent);
        TextView status=text(context,"Loading ratings…","BodyMedium");scores.addView(status);
        load(scores,film.tmdb(),true,open);
    }

    public static View page(Context context,String tmdb,String title) {
        ScrollView scroll = new ScrollView(context);
        LinearLayout body=new LinearLayout(context);body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(WatchViews.dp(context,16),WatchViews.dp(context,8),WatchViews.dp(context,16),WatchViews.dp(context,16));
        scroll.addView(body);
        if(title!=null) body.addView(text(context,title,"TitleMedium"));
        LinearLayout results=new LinearLayout(context);results.setOrientation(LinearLayout.VERTICAL);body.addView(results);
        results.addView(text(context,"Loading ratings…","BodyMedium"));
        load(results,tmdb,false,null);
        TextView credit=text(context,"Ratings supplied by MDBList","BodySmall");
        credit.setPadding(0,WatchViews.dp(context,16),0,0);body.addView(credit);
        return scroll;
    }

    private static void load(LinearLayout target,String tmdb,boolean compact,Runnable open) {
        ExternalRatings.fetch(target.getContext(),tmdb,(ratings,error) -> target.post(() -> {
            if(!target.isAttachedToWindow()) return;
            target.removeAllViews();
            if(error!=null) {
                TextView retry=text(target.getContext(),compact?"Ratings unavailable · Retry":error+" Tap to retry.","BodyMedium");
                retry.setMinHeight(WatchViews.dp(target.getContext(),48));
                retry.setOnClickListener(v -> { retry.setText("Loading ratings…");load(target,tmdb,compact,open); });target.addView(retry);return;
            }
            String selected=","+Prefs.getString(Prefs.KEY_EXTERNAL_RATINGS_SOURCES,ExternalRatings.DEFAULT_SOURCES)+",";
            for(ExternalRatings.Rating rating:ratings) {
                if(!selected.contains(","+rating.source+",")) continue;
                String name=name(rating.source); if(name==null) continue;
                Context c=target.getContext();LinearLayout item=new LinearLayout(c);item.setGravity(Gravity.CENTER_VERTICAL);
                item.setMinimumHeight(WatchViews.dp(c,48));item.setPaddingRelative(0,0,WatchViews.dp(c,16),0);
                ImageView logo=new ImageView(c);logo.setImageResource(WatchViews.resource(c,"drawable","morphe_rating_"+rating.source));
                logo.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);logo.setScaleType(ImageView.ScaleType.FIT_CENTER);
                item.addView(logo,new LinearLayout.LayoutParams(WatchViews.dp(c,24),WatchViews.dp(c,24)));
                TextView value=text(c,(compact?"":name+"  ")+score(rating),"BodyMedium");value.setPaddingRelative(WatchViews.dp(c,6),0,0,0);item.addView(value);
                item.setContentDescription(name+", "+score(rating));
                if(open!=null){item.setOnClickListener(v -> open.run());item.setFocusable(true);}
                target.addView(item);
            }
            if(target.getChildCount()==0)target.addView(text(target.getContext(),"No selected ratings available","BodyMedium"));
        }));
    }
    private static String score(ExternalRatings.Rating rating) {
        String value = rating.value;
        if (rating.source.equals("tmdb") || rating.source.equals("trakt")) {
            try { value = String.format(java.util.Locale.US, "%.1f", Double.parseDouble(value) / 10.0); }
            catch (NumberFormatException ignored) { }
        }
        return value+(rating.source.equals("tomatoes")||rating.source.equals("popcorn")?"%":rating.source.equals("metacritic")?"/100":"/10");
    }
    private static String name(String source) {
        String[] ids=ExternalRatings.sourceIds(),names=ExternalRatings.sourceNames();
        for(int i=0;i<ids.length;i++)if(ids[i].equals(source))return names[i];return null;
    }
    private static TextView text(Context c,String value,String style) {
        TextView view=new TextView(c);int id=WatchViews.resource(c,"style","TextAppearance.Letterboxd."+style);
        if(id!=0)view.setTextAppearance(id);
        if (id == 0) {
            int secondary = WatchViews.resource(c,"color","textColorSecondary");
            view.setTextSize(14);
            view.setTextColor(secondary == 0 ? 0xFF99AABB : c.getColor(secondary));
        }
        view.setText(value);return view;
    }
}
