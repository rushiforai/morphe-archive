package com.kaibatech.drivedeck.xadas.link;

/** The distance turned red, or stopped being red. */
parcelable LeadAlert {
    /** One of IXadasLink.ALERT_*. */
    int type;
    /** Distance shown when the alert fired, in metres; -1 when there is none. */
    int distanceM = -1;
    /** Goes up by one for every alert, so gaps can be detected. */
    int seq;
}
