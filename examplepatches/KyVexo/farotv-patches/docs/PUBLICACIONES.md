# Publicación y pruebas

Por indicación del responsable del proyecto, cada ajuste funcional debe guardarse en GitHub y publicarse primero como una versión de prueba `.dev`. No se publican cambios funcionales directamente como estables.

Se incrementa la versión de prueba tantas veces como sea necesario (`dev.1`, `dev.2`, `dev.3`, etc.). Cada corrección se prueba sobre el bundle publicado correspondiente. Las pruebas y sus límites se registran; un resultado no comprobado no se marca como aprobado.

Solo después de comprobar la versión candidata se promueve a estable. La rama `dev` genera las versiones de prueba y `main` las estables. Los registros y las capturas que contienen datos de la cuenta permanecen locales; no se publican APK de Google.

La versión `1.5.0` se promovió desde `1.5.0-dev.1` después de las pruebas documentadas. El siguiente ajuste retira la marca experimental de YouTube TV `8.02.300` y pasa primero por `1.5.1-dev.1` antes de promoverse a `1.5.1`. El número del bundle de parches y el número de la aplicación YouTube son independientes.

Siguen pendientes por decisión del responsable: el cierre cuando el sistema detiene MicroG y la instalación completa desde la interfaz de Morphe Manager.
