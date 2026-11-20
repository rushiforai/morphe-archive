package app.parchefacemoji.patches.facemoji.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation

/**
 * Descriptor de la clase de la extension que se fusiona en Facemoji.
 * Ver extensions/extension/src/main/java/app/parchefacemoji/extension/facemoji/PatchHooks.java
 */
internal const val EXTENSION_CLASS = "Lapp/parchefacemoji/extension/facemoji/PatchHooks;"

/** Metodos de [EXTENSION_CLASS] que dicen si un parche esta activo en los ajustes. */
internal object Ajustes {
    const val ANUNCIOS = "esAnunciosActivo"
    const val VIP = "esVipActivo"
    const val RASTREO = "esRastreoActivo"
}

/**
 * Devuelve el indice del registro local mas alto del metodo, que esta libre al principio
 * del metodo (los locales aun no se han escrito cuando se inyecta codigo en el indice 0).
 *
 * @return el indice, o `null` si el metodo no tiene ni un solo registro local.
 */
internal fun MethodImplementation?.registroLibre(method: Method): Int? {
    val implementacion = this ?: return null
    val registrosDeParametros =
        method.parameterTypes.size + if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
    val locales = implementacion.registerCount - registrosDeParametros
    return if (locales >= 1) locales - 1 else null
}

/**
 * Neutraliza los metodos `void` de esta huella, pero solo si el ajuste esta activo.
 *
 * El smali insertado es:
 *
 * ```smali
 * invoke-static {}, L.../PatchHooks;-><ajuste>()Z
 * move-result vN
 * if-eqz vN, :parche_apagado
 * const-string vN, "<etiqueta>"
 * invoke-static {vN}, L.../PatchHooks;-><extensionMethod>(Ljava/lang/String;)V
 * return-void
 * :parche_apagado
 * ```
 *
 * Si el usuario apaga el parche en los ajustes, el salto deja ejecutar el codigo original
 * de la app, como si no estuviera parcheada. `vN` es siempre un registro local que aun no
 * se ha usado, asi que no puede corromper ningun valor.
 *
 * @param surface Etiqueta corta que se escribe en logcat (solo ASCII).
 * @param ajuste Metodo de [Ajustes] que decide si el parche actua.
 * @param extensionMethod Metodo de la extension que registra el bloqueo.
 * @return `true` si se ha modificado al menos un metodo.
 */
internal fun Fingerprint.bloquearVoidSiActivo(
    surface: String,
    ajuste: String,
    extensionMethod: String = "logBlocked",
): Boolean {
    var parcheados = 0

    matchAllOrNull().orEmpty().forEach { match ->
        val original = match.originalMethod

        // El codigo insertado termina en `return-void`, por lo que solo vale para metodos void.
        if (original.returnType != "V") return@forEach

        val registro = original.implementation.registroLibre(original) ?: return@forEach

        match.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->$ajuste()Z
                move-result v$registro
                if-eqz v$registro, :parche_apagado
                const-string v$registro, "$surface"
                invoke-static {v$registro}, $EXTENSION_CLASS->$extensionMethod(Ljava/lang/String;)V
                return-void
                :parche_apagado
            """,
        )

        parcheados++
    }

    return parcheados > 0
}

/**
 * Hace que los metodos coincidentes devuelvan siempre `value`, pero solo mientras el ajuste
 * este activo.
 *
 * Se usa para las comprobaciones booleanas de la app (`isVip()`, `getEnable()`, ...).
 *
 * @param value Valor que devolvera el metodo cuando el parche este activo.
 * @param surface Etiqueta corta que se escribe en logcat (solo ASCII).
 * @param ajuste Metodo de [Ajustes] que decide si el parche actua.
 * @return `true` si se ha modificado al menos un metodo.
 */
internal fun Fingerprint.forzarBooleanSiActivo(
    value: Boolean,
    surface: String,
    ajuste: String,
    extensionMethod: String = "logBlocked",
): Boolean = forzarSiActivo(
    tipo = "Z",
    devolver = "const/16 v%REG%, ${if (value) "0x1" else "0x0"}\nreturn v%REG%",
    surface = surface,
    ajuste = ajuste,
    extensionMethod = extensionMethod,
)

/**
 * Variante de [forzarBooleanSiActivo] para los metodos que devuelven un entero.
 *
 * @param value Valor que devolvera el metodo (entre -8 y 7).
 * @param surface Etiqueta corta que se escribe en logcat (solo ASCII).
 * @param ajuste Metodo de [Ajustes] que decide si el parche actua.
 * @return `true` si se ha modificado al menos un metodo.
 */
internal fun Fingerprint.forzarIntSiActivo(
    value: Int,
    surface: String,
    ajuste: String,
    extensionMethod: String = "logBlocked",
): Boolean {
    require(value in -8..7) { "forzarIntSiActivo solo admite valores que quepan en un literal corto" }

    return forzarSiActivo(
        tipo = "I",
        devolver = "const/16 v%REG%, $value\nreturn v%REG%",
        surface = surface,
        ajuste = ajuste,
        extensionMethod = extensionMethod,
    )
}

/**
 * Variante de [forzarBooleanSiActivo] para los metodos que devuelven `java.lang.Boolean`.
 *
 * @param value Valor que devolvera el metodo.
 * @param surface Etiqueta corta que se escribe en logcat (solo ASCII).
 * @param ajuste Metodo de [Ajustes] que decide si el parche actua.
 * @return `true` si se ha modificado al menos un metodo.
 */
internal fun Fingerprint.forzarBooleanObjetoSiActivo(
    value: Boolean,
    surface: String,
    ajuste: String,
    extensionMethod: String = "logBlocked",
): Boolean = forzarSiActivo(
    tipo = "Ljava/lang/Boolean;",
    devolver = "sget-object v%REG%, Ljava/lang/Boolean;->${if (value) "TRUE" else "FALSE"}" +
            ":Ljava/lang/Boolean;\nreturn-object v%REG%",
    surface = surface,
    ajuste = ajuste,
    extensionMethod = extensionMethod,
)

/**
 * Nucleo comun de las tres variantes anteriores.
 *
 * @param tipo Tipo de retorno (formato descriptor) que deben tener los metodos.
 * @param devolver Bloque smali que devuelve el valor, con `%REG%` como marcador del registro.
 * @param surface Etiqueta corta que se escribe en logcat (solo ASCII).
 * @param ajuste Metodo de [Ajustes] que decide si el parche actua.
 * @return `true` si se ha modificado al menos un metodo.
 */
private fun Fingerprint.forzarSiActivo(
    tipo: String,
    devolver: String,
    surface: String,
    ajuste: String,
    extensionMethod: String,
): Boolean {
    var parcheados = 0

    matchAllOrNull().orEmpty().forEach { match ->
        val original = match.originalMethod

        if (original.returnType != tipo) return@forEach

        val registro = original.implementation.registroLibre(original) ?: return@forEach

        val bloqueDeRetorno = devolver.replace("%REG%", registro.toString())

        match.method.addInstructions(
            0,
            """
                invoke-static {}, $EXTENSION_CLASS->$ajuste()Z
                move-result v$registro
                if-eqz v$registro, :parche_apagado
                const-string v$registro, "$surface"
                invoke-static {v$registro}, $EXTENSION_CLASS->$extensionMethod(Ljava/lang/String;)V
                $bloqueDeRetorno
                :parche_apagado
            """,
        )

        parcheados++
    }

    return parcheados > 0
}
