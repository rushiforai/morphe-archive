package app.transitpatches.extension.go;

import androidx.annotation.Nullable;

import com.thetransitapp.droid.shared.model.cpp.SmartString;

public interface SmartStringFormatter {
    /**
     * @param smartString A smart string of the GO model.
     * @return The text the app shows for the smart string, or null.
     */
    @Nullable
    String patch_formatSmartString(SmartString smartString);
}
