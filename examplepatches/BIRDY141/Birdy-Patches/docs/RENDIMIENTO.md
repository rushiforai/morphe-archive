# Rendimiento: medición inicial y v1.7.0-dev.4

## Resultado del 16 de noviembre de 2026

Equipo: LX352, Android 12, 1 GB de RAM, YouTube TV 8.02.300. La versión de desarrollo incluye los cambios anteriores de volumen y árabe.

Se midieron tres aperturas por versión mediante `am start -S -W`, esperando doce segundos antes de recoger memoria y estadísticas. `WaitTime` mide la espera de la actividad de Android: **no mide la carga completa del contenido web ni el comienzo del vídeo**. Algunos intentos solo informaron `WaitTime`, sin `TotalTime`.

| Espera de Android | dev.3 | dev.4 |
| --- | ---: | ---: |
| Intento 1 | 3443 ms | 5990 ms |
| Intento 2 | 1898 ms | 2861 ms |
| Intento 3 | 2858 ms | 2946 ms |
| Mediana | 2858 ms | 2946 ms |

El primer intento de dev.4 fue posterior a su instalación. Las recomendaciones y las condiciones de caché/red variaron entre sesiones. La muestra es pequeña y **no demuestra una mejora del arranque**, ni permite atribuir a esta modificación la diferencia entre versiones.

También se comprobó navegación entre recomendaciones y reproducción en dev.4. En una apertura de otro vídeo, la sesión de FaroTV se observó en estado `PLAYING` con el título nuevo a los 3,335 segundos desde el envío de OK por ADB. Se sondeó aproximadamente cada medio segundo, incluyendo el coste de ADB. Es una referencia de inicio de sesión multimedia, no una medida exacta del primer fotograma, y no tiene una muestra equivalente en dev.3 para afirmar una mejora.

La memoria PSS del proceso principal estuvo entre 155485 y 157668 KiB en dev.3, y entre 152364 y 161489 KiB en dev.4. No hay una reducción general demostrada. Estas lecturas no suman necesariamente todos los procesos de Cobalt. `gfxinfo` solo mostró 16 fotogramas de la ventana Android en la prueba de dev.3; no se usa como medida de fluidez o FPS de todo el contenido web o del vídeo. Tampoco se convierte el tiempo de ejecución del script ADB —que contiene pausas deliberadas— en latencia del mando.

## Trabajo propio reducido

La prueba reproducible de `tools/benchmark-runtime.cjs` procesa cien respuestas del reproductor para un mismo vídeo antes de recibir la respuesta de Return YouTube Dislike. Compara el código de `v1.7.0-dev.3` con el código actual:

| Operación en esa prueba | dev.3 | dev.4 |
| --- | ---: | ---: |
| Peticiones enviadas al puente nativo | 100 | 1 |
| Instancias de Intl.NumberFormat | 300 | 1 |
| Temporizadores pendientes al recibir las respuestas | 100 | 0 |
| Contadores actualizados correctamente | 100 | 100 |

Son cantidades de una prueba controlada de concurrencia, no una aceleración porcentual de la app ni una afirmación de que cada vídeo produzca cien consultas en uso normal.

Cambios de dev.4:

- Agrupar solicitudes simultáneas por URL, conservando la respuesta para cada consumidor.
- Cancelar el temporizador al responder; liberar solicitudes vencidas y permitir reintentos, ignorando respuestas tardías.
- Reutilizar el formateador de números y renovarlo cuando cambia el idioma.
- Limitar la caché de votos a cien vídeos con diez minutos de vigencia; evitar crecimiento ilimitado durante sesiones largas.

Las catorce pruebas automatizadas incluyen concurrencia, errores, reintentos, caducidad, expulsión de caché, idiomas, SponsorBlock e interruptores. La compilación, firma y atestación de la publicación dev.4 se completaron en GitHub. El primer intento falló al publicar una nota de Git; se recuperó el paquete desde la misma etiqueta, usando la clave habitual del proyecto y sin reemplazar la etiqueta.

## Repetir las mediciones

Desde la raíz del repositorio:

```text
node tools/benchmark-runtime.cjs v1.7.0-dev.3
python tools/measure-tv-startup.py --adb RUTA_AL_ADB --serial IP_DEL_TV:5555 --output CARPETA_DE_RESULTADOS
```

La segunda herramienta reinicia FaroTV tres veces sin borrar sus datos. Guarda resultados JSON, registros, información de memoria/CPU/ventana y una captura local. Su salida no contiene una medida del tiempo hasta la primera recomendación o el primer fotograma del vídeo.

## Pendientes

Medir el tiempo hasta contenido útil y el primer fotograma con una fuente reproducible; perfilar el motor Cobalt para identificar otros costes; probar la percepción de navegación en uso prolongado y en el dispositivo de Yared. No se han desactivado animaciones ni cambiado las preferencias de vistas previas. No promover estas mejoras a estable automáticamente.
