/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/80ff578e21fce1b9825f2f7820d8d910e85f8822/extensions/amznmusic/stub/src/main/java/com/amazon/mp3/amplifyqueue/AmplifyClient.java
 */

package com.amazon.mp3.amplifyqueue;

import com.amazon.digitalmusicxp.callbacks.Outcome;
import com.amazon.digitalmusicxp.inputs.GetNextEntityInput;
import com.amazon.digitalmusicxp.types.GenericQueueEntity;

@SuppressWarnings("unused")
public final class AmplifyClient {
    public Outcome<GenericQueueEntity> a(GetNextEntityInput input) {
        return null;
    }
}

