package com.kaibatech.drivedeck.xadas.link;

import com.kaibatech.drivedeck.xadas.link.IXadasLinkListener;
import com.kaibatech.drivedeck.xadas.link.LeadState;

/**
 * xADAS data link, API version 1.
 *
 * Bind with Intent(ACTION_BIND_LINK).setPackage(<xADAS package>). The link only carries data while
 * sharing is on in xADAS Settings, the user has allowed the calling app, and xADAS is measuring
 * from a dashcam or USB camera.
 *
 * Compatibility: method ids, constants and parcelable fields are never removed or renumbered; new
 * ones are only appended, and API_VERSION goes up when they are.
 */
interface IXadasLink {
    const int API_VERSION = 1;

    const String ACTION_BIND_LINK = "com.kaibatech.drivedeck.xadas.action.BIND_LINK";

    // Explicit broadcasts xADAS sends only to apps the user has allowed.
    /** The link started or stopped; EXTRA_RUNNING tells which. Bind when it starts. */
    const String ACTION_LINK_STATE = "com.kaibatech.drivedeck.xadas.action.LINK_STATE";
    /** Same event as IXadasLinkListener.onAlert, for apps that are not bound. */
    const String ACTION_ALERT = "com.kaibatech.drivedeck.xadas.action.ALERT";
    const String EXTRA_RUNNING = "com.kaibatech.drivedeck.xadas.extra.RUNNING";
    const String EXTRA_ALERT_TYPE = "com.kaibatech.drivedeck.xadas.extra.ALERT_TYPE";
    const String EXTRA_DISTANCE_M = "com.kaibatech.drivedeck.xadas.extra.DISTANCE_M";
    const String EXTRA_SEQ = "com.kaibatech.drivedeck.xadas.extra.SEQ";

    // register() results and IXadasLinkListener.onAccessChanged() values.
    /** Allowed: onState and onAlert start now. */
    const int ACCESS_GRANTED = 1;
    /** The user has not decided yet; xADAS asks them. onAccessChanged fires when they decide. */
    const int ACCESS_PENDING = 2;
    /** The user turned this app off in xADAS Settings. */
    const int ACCESS_DENIED = 3;
    /** Sharing is off in xADAS Settings. onAccessChanged fires if it is turned on. */
    const int ACCESS_DISABLED = 4;

    // LeadState.status
    /** This app is not allowed to read data (see ACCESS_*). */
    const int STATUS_NO_ACCESS = 0;
    /** Measuring: distanceM and verdict are live. */
    const int STATUS_MEASURING = 1;
    /** Measuring is paused (low speed, device too hot, frames interrupted). */
    const int STATUS_PAUSED = 2;
    /** No picture from the dashcam or USB camera yet. */
    const int STATUS_NO_CAMERA = 3;
    /** xADAS is using the phone camera; the link does not run with it. */
    const int STATUS_UNSUPPORTED_SOURCE = 4;
    /** xADAS is not measuring (stopped from its notification, or closed). */
    const int STATUS_STOPPED = 5;

    // LeadState.verdict, the same colour xADAS shows on screen.
    /** No vehicle ahead. */
    const int VERDICT_NO_LEAD = 0;
    /** Far enough ("đủ xa", green). */
    const int VERDICT_SAFE = 1;
    /** Too close ("quá gần", red). */
    const int VERDICT_TOO_CLOSE = 2;
    /** A vehicle is ahead but there is no speed to judge the distance by. */
    const int VERDICT_UNKNOWN = 3;

    // LeadAlert.type and EXTRA_ALERT_TYPE
    /** The distance turned red. */
    const int ALERT_TOO_CLOSE = 1;
    /** The distance is no longer red. */
    const int ALERT_CLEARED = 2;

    /** The API version this xADAS build implements. */
    int getApiVersion() = 0;

    /** Subscribes listener to state and alerts. Returns one of ACCESS_*. */
    int register(IXadasLinkListener listener) = 1;

    void unregister(IXadasLinkListener listener) = 2;

    /** The latest state; status is STATUS_NO_ACCESS unless this app is allowed. */
    LeadState getState() = 3;
}
