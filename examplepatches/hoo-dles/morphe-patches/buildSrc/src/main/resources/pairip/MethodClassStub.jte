@import java.util.List
@import hoodles.morphe.codegen.pairip.*

@param String packageName
@param String className
@param List<String> fieldNames

package ${UtilsKt.safelyReplaceHyphen(packageName)};

import java.lang.reflect.Method;

public class ${className} {
    @for(String field : fieldNames)
        public static Method ${field};
    @endfor
}