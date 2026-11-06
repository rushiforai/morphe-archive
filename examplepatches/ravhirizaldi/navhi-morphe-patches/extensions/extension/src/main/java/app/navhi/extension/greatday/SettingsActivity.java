package app.navhi.extension.greatday;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.model.LatLng;

/**
 * The patch menu: pin the attendance location on a map and choose what the
 * app is allowed to notice.
 */
@SuppressWarnings("unused")
public final class SettingsActivity extends Activity {
    private static final String REPO = "https://github.com/ravhirizaldi/navhi-morphe-patches";

    private MapView mapView;
    private TextView status;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        setTitle("Morphe Settings");

        LinearLayout column = new LinearLayout(this);
        column.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(20);
        column.setPadding(pad, pad, pad, pad);

        column.addView(label("Morphe Settings", 22, true, Color.BLACK));
        column.addView(label("navhi patches · GreatDay HR", 13, false, Color.DKGRAY));

        column.addView(section("Attendance location"));
        column.addView(label("Drag the map; the centre is the location sent on attendance.", 13, false, Color.DKGRAY));

        mapView = new MapView(this);
        mapView.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(320)));
        mapView.onCreate(state);
        column.addView(mapView);

        status = label("", 13, false, Color.DKGRAY);
        status.setPadding(0, dp(8), 0, 0);
        column.addView(status);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setPadding(0, dp(8), 0, 0);
        row.addView(button("Save this point", new Runnable() {
            @Override
            public void run() {
                commit();
            }
        }));
        row.addView(button("Use real GPS", new Runnable() {
            @Override
            public void run() {
                clear();
            }
        }));
        column.addView(row);

        column.addView(section("Detection"));
        column.addView(toggle("Laporkan lokasi palsu (mock)", "mock"));
        column.addView(toggle("Laporkan developer options", "devoptions"));
        column.addView(toggle("Laporkan emulator", "emulator"));

        column.addView(section("About"));
        TextView about = label("Patch oleh navhi", 13, false, Color.DKGRAY);
        column.addView(about);
        TextView link = label(REPO, 13, false, Color.parseColor("#1565C0"));
        link.setOnClickListener(new android.view.View.OnClickListener() {
            @Override
            public void onClick(android.view.View view) {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(REPO)));
            }
        });
        column.addView(link);

        ScrollView scroll = new ScrollView(this);
        scroll.addView(column);
        setContentView(scroll);

        mapView.getMapAsync(new com.google.android.gms.maps.OnMapReadyCallback() {
            @Override
            public void onMapReady(GoogleMap map) {
                LocationPicker.listen(map, SettingsActivity.this);
                LatLng saved = LocationPicker.savedPin(SettingsActivity.this);
                if (saved == null) {
                    showStatus();
                    return;
                }
                LocationPicker.pin(saved);
                map.moveCamera(CameraUpdateFactory.newLatLng(saved));
                showStatus();
            }
        });
    }

    /** Camera settled: the centre of the screen becomes the pin. */
    public void r() {
        LocationPicker.centre();
        showStatus();
    }

    /** Map tapped: glide to the tapped point. */
    public void u(LatLng latLng) {
        LocationPicker.move(latLng, true);
    }

    private void commit() {
        LatLng centre = LocationPicker.pin;
        if (centre == null) {
            Toast.makeText(this, "Map is not ready", Toast.LENGTH_SHORT).show();
            return;
        }
        LocationStore.save(this, centre.latitude, centre.longitude);
        Toast.makeText(this, "Attendance point saved", Toast.LENGTH_SHORT).show();
        showStatus();
    }

    private void clear() {
        LocationStore.clear(this);
        LocationPicker.clear();
        Toast.makeText(this, "Back to real GPS", Toast.LENGTH_SHORT).show();
        showStatus();
    }

    private void showStatus() {
        LatLng pin = LocationPicker.pin;
        status.setText(pin == null
                ? "Status: using real GPS"
                : "Status: point " + String.format("%.5f, %.5f", pin.latitude, pin.longitude));
    }

    private Switch toggle(String text, final String key) {
        Switch view = new Switch(this);
        view.setText(text);
        view.setChecked(Flags.get(this, key));
        view.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton button, boolean checked) {
                Flags.put(SettingsActivity.this, key, checked);
            }
        });
        return view;
    }

    private Button button(String text, final Runnable action) {
        Button view = new Button(this);
        view.setText(text);
        view.setOnClickListener(new android.view.View.OnClickListener() {
            @Override
            public void onClick(android.view.View view) {
                action.run();
            }
        });
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        view.setLayoutParams(params);
        return view;
    }

    private TextView label(String text, int size, boolean bold, int colour) {
        TextView view = new TextView(this);
        view.setText(text);
        view.setTextSize(size);
        view.setTextColor(colour);
        if (bold) {
            view.setTypeface(Typeface.DEFAULT_BOLD);
        }
        return view;
    }

    private TextView section(String text) {
        TextView view = label(text, 16, true, Color.BLACK);
        view.setPadding(0, dp(20), 0, dp(4));
        view.setGravity(Gravity.START);
        return view;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    @Override
    protected void onResume() {
        super.onResume();
        mapView.onResume();
        showStatus();
    }

    @Override
    protected void onPause() {
        mapView.onPause();
        super.onPause();
    }

    @Override
    protected void onDestroy() {
        mapView.onDestroy();
        super.onDestroy();
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
        mapView.onLowMemory();
    }
}
