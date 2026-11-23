package app.jofslash.extension.booking;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Locale;

/**
 * The Contact tab of the {@link Panel}: the property's address with "Open in Maps" and "Copy
 * address", and the property's own contact details from its legal trader information.
 */
final class ContactTab {
    private final Activity activity;
    private final Panel panel;
    private final Panel.Colors colors;
    private final HotelInfo hotel;

    ContactTab(Activity activity, Panel panel, Panel.Colors colors, HotelInfo hotel) {
        this.activity = activity;
        this.panel = panel;
        this.colors = colors;
        this.hotel = hotel;
    }

    View view() {
        ScrollView scroll = new ScrollView(activity);
        LinearLayout column = new LinearLayout(activity);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setPadding(panel.dp(16), panel.dp(16), panel.dp(16), panel.dp(24));
        scroll.addView(column, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));

        // The property's address.
        final String address = address();
        column.addView(panel.text(Strings.CONTACT_ADDRESS, 16, colors.text, true));
        LinearLayout addressBox = new LinearLayout(activity);
        addressBox.setOrientation(LinearLayout.VERTICAL);
        TextView addressText = panel.text(address != null ? address : Strings.CONTACT_NO_ADDRESS, 15,
                address != null ? colors.text : colors.secondaryText, false);
        addressText.setTextIsSelectable(true);
        addressBox.addView(addressText);
        LinearLayout actions = new LinearLayout(activity);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        TextView maps = panel.button(Strings.CONTACT_OPEN_MAPS, v -> openMaps(address));
        actions.addView(maps, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
        if (address != null) {
            TextView copy = panel.button(Strings.CONTACT_COPY_ADDRESS, v -> copy(address));
            // A secondary button: outlined.
            copy.setTextColor(colors.accent);
            android.graphics.drawable.GradientDrawable outline = new android.graphics.drawable.GradientDrawable();
            outline.setColor(colors.background);
            outline.setStroke(panel.dp(1), colors.accent);
            outline.setCornerRadius(panel.dp(8));
            copy.setBackground(outline);
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
            lp.leftMargin = panel.dp(8);
            actions.addView(copy, lp);
        }
        addressBox.addView(panel.spaced(actions, 12));
        column.addView(panel.spaced(panel.card(addressBox), 8));

        // The property's own contact details.
        column.addView(panel.spaced(panel.text(Strings.CONTACT_HEADER, 16, colors.text, true), 24));
        HotelContact.Trader trader = HotelContact.traderOf(hotel.id);
        LinearLayout details = new LinearLayout(activity);
        details.setOrientation(LinearLayout.VERTICAL);
        if (trader == null) {
            details.addView(panel.text(Strings.CONTACT_NOT_LOADED, 14, colors.secondaryText, false));
        } else if (!trader.isTrader) {
            details.addView(panel.text(Strings.CONTACT_PRIVATE_HOST, 14, colors.secondaryText, false));
        } else {
            boolean first = true;
            if (trader.phone != null) {
                details.addView(row(Strings.CONTACT_PHONE, trader.phone, v -> dial(trader.phone), first));
                first = false;
            }
            if (trader.email != null) {
                details.addView(row(Strings.CONTACT_EMAIL, trader.email, v -> email(trader.email), first));
                first = false;
            }
            if (trader.name != null) {
                details.addView(row(Strings.CONTACT_BUSINESS, trader.name, null, first));
                first = false;
            }
            if (trader.address != null && !trader.address.equals(address)) {
                details.addView(row(Strings.CONTACT_BUSINESS_ADDRESS, trader.address, null, first));
                first = false;
            }
            if (trader.registration != null) {
                details.addView(row(Strings.CONTACT_REGISTRATION, trader.registration, null, first));
                first = false;
            }
            if (!trader.hasContact()) {
                details.addView(panel.spaced(panel.text(Strings.CONTACT_NONE, 14, colors.secondaryText, false),
                        first ? 0 : 12));
            }
        }
        column.addView(panel.spaced(panel.card(details), 8));
        column.addView(panel.spaced(panel.text(Strings.CONTACT_SOURCE, 13, colors.secondaryText, false), 12));
        return scroll;
    }

    /** A label and its value. A value with an action is a link; any value is copied on a long press. */
    private View row(String label, final String value, View.OnClickListener onClick, boolean first) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.VERTICAL);
        row.addView(panel.text(label, 13, colors.secondaryText, false));
        TextView text = panel.text(value, 15, onClick != null ? colors.accent : colors.text, onClick != null);
        text.setPadding(0, panel.dp(2), 0, panel.dp(2));
        if (onClick != null) text.setOnClickListener(onClick);
        text.setOnLongClickListener(v -> {
            copy(value);
            return true;
        });
        row.addView(text);
        return first ? row : panel.spaced(row, 12);
    }

    /** The property's address: Booking.com's formatted address, else the street and city. */
    private String address() {
        if (hotel.formattedAddress != null && !hotel.formattedAddress.trim().isEmpty()) {
            return hotel.formattedAddress.trim();
        }
        if (hotel.address == null || hotel.address.trim().isEmpty()) return null;
        if (hotel.city == null || hotel.address.contains(hotel.city)) return hotel.address.trim();
        return hotel.address.trim() + ", " + hotel.city;
    }

    private void openMaps(String address) {
        String name = hotel.name != null ? hotel.name : "";
        String query;
        if (!Double.isNaN(hotel.latitude)) {
            query = String.format(Locale.ROOT, "%.6f,%.6f", hotel.latitude, hotel.longitude)
                    + (name.isEmpty() ? "" : "(" + name + ")");
        } else if (address != null) {
            query = name.isEmpty() ? address : name + ", " + address;
        } else {
            Toast.makeText(activity, Strings.CONTACT_NO_ADDRESS, Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("geo:0,0?q=" + Uri.encode(query)));
            // In its own task, as the app's own map links do, so Back and Recents keep Booking.com apart.
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            // No maps app: the map in the browser.
            String where = !Double.isNaN(hotel.latitude)
                    ? String.format(Locale.ROOT, "%.6f,%.6f", hotel.latitude, hotel.longitude) : query;
            panel.openInBrowser("https://www.google.com/maps/search/?api=1&query=" + Uri.encode(where));
        }
    }

    private void dial(String phone) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + Uri.encode(phone))));
        } catch (ActivityNotFoundException e) {
            copy(phone);
        }
    }

    private void email(String email) {
        String subject = hotel.name != null ? hotel.name : "";
        // The subject both in the address and as an extra: mail apps read one or the other.
        Intent intent = new Intent(Intent.ACTION_SENDTO,
                Uri.parse("mailto:" + Uri.encode(email, "@") + "?subject=" + Uri.encode(subject)));
        intent.putExtra(Intent.EXTRA_SUBJECT, subject);
        try {
            activity.startActivity(intent);
        } catch (ActivityNotFoundException e) {
            copy(email);
        }
    }

    private void copy(String value) {
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        if (clipboard == null) return;
        clipboard.setPrimaryClip(ClipData.newPlainText(hotel.name != null ? hotel.name : "", value));
        // Android 13 and later show their own message.
        if (Build.VERSION.SDK_INT < 33) Toast.makeText(activity, Strings.CONTACT_COPIED, Toast.LENGTH_SHORT).show();
    }
}
