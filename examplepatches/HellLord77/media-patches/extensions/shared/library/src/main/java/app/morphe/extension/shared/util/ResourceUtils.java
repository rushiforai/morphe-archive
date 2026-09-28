package app.morphe.extension.shared.util;

import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.Utils;
import java.io.InputStream;
import org.jetbrains.annotations.NotNull;

public class ResourceUtils {
  @NotNull
  public static InputStream openRawResource(@NotNull String name) {
    var resources = Utils.getResources();
    var resourceId =
        app.morphe.extension.shared.ResourceUtils.getIdentifierOrThrow(ResourceType.RAW, name);
    return resources.openRawResource(resourceId);
  }
}
