package defpackage;

import com.medium.android.data.settings.Frequency;
import com.medium.android.data.settings.NotificationNetwork;
import com.medium.android.graphql.UserPreferencesQuery;
import com.medium.android.graphql.fragment.ViewerPreference;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class hee {
    public static final Boolean a(UserPreferencesQuery.Preference preference) {
        ViewerPreference.OnBooleanPreferenceValue onBooleanPreferenceValue = preference.getViewerPreference().getValue().getOnBooleanPreferenceValue();
        if (onBooleanPreferenceValue != null) {
            return Boolean.valueOf(onBooleanPreferenceValue.getBooleanValue());
        }
        return null;
    }

    public static final NotificationNetwork b(UserPreferencesQuery.Preference preference) {
        ViewerPreference.OnEnumPreferenceValue onEnumPreferenceValue = preference.getViewerPreference().getValue().getOnEnumPreferenceValue();
        Object obj = null;
        String enumValue = onEnumPreferenceValue != null ? onEnumPreferenceValue.getEnumValue() : null;
        if (enumValue == null) {
            return null;
        }
        Iterator<E> it2 = NotificationNetwork.getEntries().iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            Object next = it2.next();
            if (g76.L(((NotificationNetwork) next).getServerName(), enumValue)) {
                obj = next;
                break;
            }
        }
        return (NotificationNetwork) obj;
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static final gee c(List list) {
        Iterator it2;
        Object next;
        Iterator it3 = list.iterator();
        Boolean boolA = null;
        Boolean boolA2 = null;
        Boolean boolA3 = null;
        Boolean boolA4 = null;
        NotificationNetwork notificationNetworkB = null;
        Boolean boolA5 = null;
        NotificationNetwork notificationNetworkB2 = null;
        NotificationNetwork notificationNetworkB3 = null;
        Boolean boolA6 = null;
        NotificationNetwork notificationNetworkB4 = null;
        Boolean boolA7 = null;
        NotificationNetwork notificationNetworkB5 = null;
        Boolean boolA8 = null;
        Boolean boolA9 = null;
        Boolean boolA10 = null;
        Boolean boolA11 = null;
        Boolean boolA12 = null;
        Frequency frequency = null;
        while (it3.hasNext()) {
            UserPreferencesQuery.Preference preference = (UserPreferencesQuery.Preference) it3.next();
            String name = preference.getViewerPreference().getName();
            switch (name.hashCode()) {
                case -1485912490:
                    it2 = it3;
                    if (name.equals("allow_discovered_by_addressbook")) {
                        boolA3 = a(preference);
                    }
                    break;
                case -1138563188:
                    it2 = it3;
                    if (name.equals("allow_post_push_notifications")) {
                        notificationNetworkB3 = b(preference);
                    }
                    break;
                case -1030326647:
                    it2 = it3;
                    if (name.equals("allow_item_added_to_followed_catalog_push_notifications")) {
                        boolA5 = a(preference);
                    }
                    break;
                case -792053416:
                    it2 = it3;
                    if (name.equals("show_responses_on_profile")) {
                        boolA12 = a(preference);
                    }
                    break;
                case -601962165:
                    it2 = it3;
                    if (name.equals("allow_response_push_notifications")) {
                        notificationNetworkB5 = b(preference);
                    }
                    break;
                case -576271629:
                    it2 = it3;
                    if (name.equals("allow_social_emails")) {
                        ViewerPreference.OnEnumPreferenceValue onEnumPreferenceValue = preference.getViewerPreference().getValue().getOnEnumPreferenceValue();
                        String enumValue = onEnumPreferenceValue != null ? onEnumPreferenceValue.getEnumValue() : null;
                        if (enumValue == null) {
                            frequency = null;
                        } else {
                            Iterator it4 = Frequency.getEntries().iterator();
                            while (true) {
                                if (it4.hasNext()) {
                                    next = it4.next();
                                    Iterator it5 = it4;
                                    if (!g76.L(((Frequency) next).getServerName(), enumValue)) {
                                        it4 = it5;
                                    }
                                } else {
                                    next = null;
                                }
                            }
                            frequency = (Frequency) next;
                        }
                    }
                    break;
                case -100796426:
                    it2 = it3;
                    if (name.equals("allow_catalog_followed_push_notifications")) {
                        boolA = a(preference);
                    }
                    break;
                case -98014290:
                    it2 = it3;
                    if (name.equals("allow_mention_push_notifications")) {
                        notificationNetworkB2 = b(preference);
                    }
                    break;
                case 242863464:
                    it2 = it3;
                    if (name.equals("allow_digest_push_notifications")) {
                        boolA2 = a(preference);
                    }
                    break;
                case 344475274:
                    it2 = it3;
                    if (name.equals("allow_reposts")) {
                        boolA7 = a(preference);
                    }
                    break;
                case 562998767:
                    it2 = it3;
                    if (name.equals("show_claps_on_profile")) {
                        boolA10 = a(preference);
                    }
                    break;
                case 989246310:
                    it2 = it3;
                    if (name.equals("allow_social_post_push_notifications")) {
                        boolA8 = a(preference);
                    }
                    break;
                case 1212124964:
                    it2 = it3;
                    if (name.equals("allow_highlight_push_notifications")) {
                        notificationNetworkB = b(preference);
                    }
                    break;
                case 1245232519:
                    it2 = it3;
                    if (name.equals("show_highlights_on_profile")) {
                        boolA11 = a(preference);
                    }
                    break;
                case 1246182940:
                    it2 = it3;
                    if (name.equals("allow_recommend_push_notifications")) {
                        notificationNetworkB4 = b(preference);
                    }
                    break;
                case 1296956865:
                    it2 = it3;
                    if (name.equals("allow_editorial_topic_push_notifications")) {
                        boolA4 = a(preference);
                    }
                    break;
                case 1304895372:
                    it2 = it3;
                    if (name.equals("allow_todays_highlights_push_notifications")) {
                        boolA9 = a(preference);
                    }
                    break;
                case 2047012442:
                    it2 = it3;
                    if (name.equals("allow_publication_featured_post_push_notifications")) {
                        boolA6 = a(preference);
                    }
                    break;
                default:
                    it2 = it3;
                    break;
            }
            it3 = it2;
        }
        return new gee(boolA, boolA2, boolA3, boolA4, notificationNetworkB, boolA5, notificationNetworkB2, notificationNetworkB3, boolA6, notificationNetworkB4, boolA7, notificationNetworkB5, boolA8, boolA9, boolA10, boolA11, boolA12, frequency);
    }
}
