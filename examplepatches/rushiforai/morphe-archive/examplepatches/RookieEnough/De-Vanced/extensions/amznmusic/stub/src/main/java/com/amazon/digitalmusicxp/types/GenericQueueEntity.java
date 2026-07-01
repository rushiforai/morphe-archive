/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/80ff578e21fce1b9825f2f7820d8d910e85f8822/extensions/amznmusic/stub/src/main/java/com/amazon/digitalmusicxp/types/GenericQueueEntity.java
 */

package com.amazon.digitalmusicxp.types;

import com.amazon.digitalmusicxp.enums.QueueEntityIdTypeEnum;

@SuppressWarnings("unused")
public final class GenericQueueEntity {
    private String entityReferenceId;
    private QueueEntityIdTypeEnum identifierType;

    public String getEntityReferenceId() {
        return entityReferenceId;
    }

    public QueueEntityIdTypeEnum getIdentifierType() {
        return identifierType;
    }
}

