/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.entity;


public class MessageInfo extends Entity {

    public MessageInfo(Object obj) {
        super(obj);
    }

    /**
     * The wire name of the message type ("media", "raven_media", "voice_media", ...). It lives on
     * an enum hung off the message. Every name here, the declaring classes included, is rewritten
     * at patch time.
     */
    public String getMessageType() throws Exception {
        Entity itemType = super.getFieldAsEntityIn("itemTypeOwner", "itemTypeField");
        if (itemType.getObject() == null) return null;
        return (String) itemType.getFieldIn("itemTypeNameOwner", "itemTypeNameField");
    }

    public MediaData getAudioMedia() throws Exception {
        // The hook passes the message itself, so the audio field is read straight off it.
        Entity audioData = super.getFieldAsEntityIn("audioOwner", "audioField");
        if (audioData.getObject() != null) {
            Object mediaData = audioData.getFieldIn("audioMediaOwner", "audioMediaField");
            if (mediaData != null) return new MediaData(mediaData);
        }
        return null;
    }
}
