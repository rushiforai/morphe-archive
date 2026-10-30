// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

/** OEM layout choice only. Never replaces native camera ownership or renderer checks. */
public final class ClusterProjectionPolicy {
    private ClusterProjectionPolicy() {}
    public static final class Choice {
        public final boolean profile, draw, zoomVisible;
        public final DiLink51Profile.Theme theme;
        public final String displayName, reason;
        private Choice(boolean profile, boolean draw, boolean zoomVisible,
                       DiLink51Profile.Theme theme, String reason) {
            this.profile=profile;this.draw=draw;this.zoomVisible=zoomVisible;
            this.theme=theme;this.reason=reason;
            displayName=draw?DiLink51Profile.displayName(theme):null;
        }
    }
    public static Choice select(String fingerprint, boolean automatic,
                                DiLink51Profile.Theme manual, ClusterThemeState.Snapshot state) {
        if(!DiLink51Profile.supported(fingerprint))
            return new Choice(false,true,true,DiLink51Profile.Theme.UNKNOWN,"legacy");
        if(!automatic) {
            if(manual==null||manual==DiLink51Profile.Theme.UNKNOWN)
                return new Choice(true,false,false,DiLink51Profile.Theme.UNKNOWN,"manual_layout_required");
            return new Choice(true,true,false,manual,"manual_visibility_unknown");
        }
        if(state==null||!state.reliable)
            return new Choice(true,false,false,DiLink51Profile.Theme.UNKNOWN,
                state==null?"visibility_unknown":state.reason);
        if(!state.mapVisible)
            return new Choice(true,false,false,state.theme,"stock_map_hidden");
        // Mini-map alone establishes logical visibility, but does not identify a theme/layer.
        if(state.theme==null||state.theme==DiLink51Profile.Theme.UNKNOWN)
            return new Choice(true,false,false,DiLink51Profile.Theme.UNKNOWN,"theme_unknown");
        return new Choice(true,true,true,state.theme,"stock_map_visible");
    }
}
