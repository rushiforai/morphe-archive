package com.drew.metadata.apple;

import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.makernotes.AppleRunTimeMakernoteDirectory;
import com.drew.metadata.plist.BplistReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppleRunTimeReader {
    private static void processAppleRunTime(AppleRunTimeMakernoteDirectory appleRunTimeMakernoteDirectory, byte[] bArr) throws IOException {
        BplistReader.PropertyListResults propertyListResults = BplistReader.parse(bArr);
        Set<Map.Entry<Byte, Byte>> entrySet = propertyListResults.getEntrySet();
        if (entrySet != null) {
            HashMap map = new HashMap(entrySet.size());
            for (Map.Entry<Byte, Byte> entry : entrySet) {
                map.put((String) propertyListResults.getObjects().get(entry.getKey().byteValue()), propertyListResults.getObjects().get(entry.getValue().byteValue()));
            }
            Object obj = map.get("flags");
            if (!(obj instanceof Byte)) {
                if (obj instanceof String) {
                    int i = Byte.parseByte((String) obj);
                    if ((i & 1) == 1) {
                        appleRunTimeMakernoteDirectory.setInt(1, i);
                        appleRunTimeMakernoteDirectory.setInt(2, Byte.parseByte((String) map.get("epoch")));
                        appleRunTimeMakernoteDirectory.setLong(3, Long.parseLong((String) map.get("timescale")));
                        appleRunTimeMakernoteDirectory.setLong(4, Long.parseLong((String) map.get("value")));
                        return;
                    }
                    return;
                }
                return;
            }
            int iByteValue = ((Byte) obj).byteValue();
            if ((iByteValue & 1) == 1) {
                appleRunTimeMakernoteDirectory.setInt(1, iByteValue);
                appleRunTimeMakernoteDirectory.setInt(2, ((Byte) map.get("epoch")).byteValue());
                Long l = (Long) map.get("timescale");
                l.longValue();
                appleRunTimeMakernoteDirectory.setObject(3, l);
                Long l2 = (Long) map.get("value");
                l2.longValue();
                appleRunTimeMakernoteDirectory.setObject(4, l2);
            }
        }
    }

    public final void extract(byte[] bArr, Metadata metadata, Directory directory) {
        if (!BplistReader.isValid(bArr)) {
            directory.addError("Input array is not a bplist");
            return;
        }
        AppleRunTimeMakernoteDirectory appleRunTimeMakernoteDirectory = new AppleRunTimeMakernoteDirectory();
        appleRunTimeMakernoteDirectory.setParent(directory);
        try {
            processAppleRunTime(appleRunTimeMakernoteDirectory, bArr);
            if (appleRunTimeMakernoteDirectory.getTagCount() > 0) {
                metadata.addDirectory(appleRunTimeMakernoteDirectory);
            }
        } catch (IOException e) {
            directory.addError("Error processing TAG_RUN_TIME: " + e.getMessage());
        }
    }
}
