package app.morphe.extension.chmate;

import android.os.ParcelFileDescriptor;

interface ILegacyDataMigrationService {
    String[] listChildren(String relativePath) = 1;
    boolean isDirectory(String relativePath) = 2;
    ParcelFileDescriptor openFile(String relativePath) = 3;
    long lastModified(String relativePath) = 4;
    void repairDestinationOwnership(String destinationPath) = 5;
    void destroy() = 16777114;
}
