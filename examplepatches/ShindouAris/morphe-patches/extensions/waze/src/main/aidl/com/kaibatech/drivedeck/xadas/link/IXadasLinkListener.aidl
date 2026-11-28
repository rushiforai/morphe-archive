package com.kaibatech.drivedeck.xadas.link;

import com.kaibatech.drivedeck.xadas.link.LeadAlert;
import com.kaibatech.drivedeck.xadas.link.LeadState;

/** Callbacks from xADAS. One-way: xADAS never waits for the app. */
oneway interface IXadasLinkListener {
    /** On every change, at most 10 times a second, and at least once a second. */
    void onState(in LeadState state) = 0;

    void onAlert(in LeadAlert alert) = 1;

    /** One of IXadasLink.ACCESS_*. */
    void onAccessChanged(int access) = 2;
}
