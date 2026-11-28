package com.kaibatech.drivedeck.xadas.link;

/** Distance to the vehicle ahead, as xADAS shows it on screen. */
parcelable LeadState {
    /** One of IXadasLink.STATUS_*. */
    int status;
    /** Distance to the vehicle ahead in metres, as shown on screen; -1 when there is none. */
    int distanceM = -1;
    /** Age of that measurement in milliseconds when this state was sent; -1 when there is none. */
    int distanceAgeMs = -1;
    /** One of IXadasLink.VERDICT_*. */
    int verdict;
    /** Goes up by one for every state sent, so gaps can be detected. */
    int seq;
}
