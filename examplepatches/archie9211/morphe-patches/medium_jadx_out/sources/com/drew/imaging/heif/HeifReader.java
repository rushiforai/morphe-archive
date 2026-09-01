package com.drew.imaging.heif;

import com.drew.lang.SequentialReader;
import com.drew.lang.StreamReader;
import com.drew.metadata.heif.HeifDirectory;
import com.drew.metadata.heif.boxes.Box;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HeifReader {
    private static final Set<String> ACCEPTABLE_PRE_META_BOX_TYPES = new HashSet(Arrays.asList("ftyp", "meta"));

    private HeifHandler<?> processBox(SequentialReader sequentialReader, Box box, HeifHandler<?> heifHandler) {
        if (heifHandler.shouldAcceptContainer(box)) {
            heifHandler.processContainer(box, sequentialReader);
            return processBoxes(sequentialReader, (sequentialReader.getPosition() + box.size) - 8, heifHandler);
        }
        boolean zShouldAcceptBox = heifHandler.shouldAcceptBox(box);
        long j = box.size;
        if (zShouldAcceptBox) {
            return heifHandler.processBox(box, sequentialReader.getBytes(((int) j) - 8));
        }
        if (j > 1) {
            sequentialReader.skip(j - 8);
        }
        return heifHandler;
    }

    private HeifHandler<?> processBoxes(SequentialReader sequentialReader, long j, HeifHandler<?> heifHandler) {
        while (true) {
            if (j != -1) {
                try {
                    if (sequentialReader.getPosition() >= j) {
                        break;
                    }
                } catch (IOException unused) {
                }
            }
            heifHandler = processBox(sequentialReader, new Box(sequentialReader), heifHandler);
        }
        return heifHandler;
    }

    private void processTopLevelBoxes(InputStream inputStream, SequentialReader sequentialReader, long j, HeifHandler<?> heifHandler, boolean z) throws IOException {
        HeifDirectory heifDirectory;
        boolean z2 = false;
        boolean z3 = false;
        while (true) {
            if (j != -1) {
                try {
                    if (sequentialReader.getPosition() >= j) {
                        break;
                    }
                } catch (IOException unused) {
                }
            }
            Box box = new Box(sequentialReader);
            if (!z2 && !ACCEPTABLE_PRE_META_BOX_TYPES.contains(box.type)) {
                z3 = true;
            }
            if ("meta".equalsIgnoreCase(box.type)) {
                z2 = true;
            }
            heifHandler = processBox(sequentialReader, box, heifHandler);
        }
        if (z3 && z) {
            inputStream.reset();
            processBoxes(new StreamReader(inputStream), -1L, heifHandler);
        } else {
            if (!z3 || (heifDirectory = (HeifDirectory) heifHandler.metadata.getFirstDirectoryOfType(HeifDirectory.class)) == null) {
                return;
            }
            heifDirectory.addError("Unable to extract Exif data because inputStream was not resettable and 'meta' was not first box");
        }
    }

    public final void extract(InputStream inputStream, HeifHandler<?> heifHandler) {
        boolean z;
        try {
            if (inputStream.markSupported()) {
                inputStream.mark(inputStream.available() + 1);
                z = true;
            } else {
                z = false;
            }
            StreamReader streamReader = new StreamReader(inputStream);
            streamReader.setMotorolaByteOrder(true);
            processTopLevelBoxes(inputStream, streamReader, -1L, heifHandler, z);
        } catch (IOException unused) {
        }
    }
}
