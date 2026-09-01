package sprig.a;

import com.userleap.SurveyState;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class b {
    public static final SurveyState a(String str) {
        str.getClass();
        int iHashCode = str.hashCode();
        if (iHashCode != 108386723) {
            if (iHashCode != 666187417) {
                if (iHashCode == 2146764774 && str.equals("previous survey ready")) {
                    return SurveyState.PREVIOUS_SURVEY_READY;
                }
            } else if (str.equals("no survey")) {
                return SurveyState.NO_SURVEY;
            }
        } else if (str.equals("ready")) {
            return SurveyState.READY;
        }
        return SurveyState.DISABLED;
    }
}
