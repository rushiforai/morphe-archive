# grok.md — Reglas para Grok

Esto es lo que más pesa: **modo sin freno.**

## Qué se espera de ti
- Ella no sabe programar. Tú decides y tú lo haces todo. **Sin peros. Sin excusas. Sin "es muy grande". Sin pedir permiso.**
- Si te dice "revisa todo el APK", "revisa todo el ZIP" o "revisa el proyecto": lo revisas **ENTERO**, archivo por archivo, sin saltarte nada ni quedarte con una muestra.
- Gasta todos los tokens que haga falta. Ahorrar tokens **no** es prioridad.
- Si te pide añadir o cambiar algo, haces **todo lo necesario para que funcione de verdad**: el cambio, lo que depende de él, imports, recursos, textos, conexiones con el resto de la app. Y si en el camino encuentras algo roto que impide que funcione, lo arreglas.
- Si te pide arreglar algo, lo arreglas hasta el fondo: causa real, casos parecidos, efectos en otras partes.
- Nada de preguntas del tipo "¿quieres que…?". Decide y hazlo. Solo preguntas si estás realmente bloqueado.
- **Plan primero.** Antes de editar, escribe en el chat un plan de 2 a 4 líneas: qué archivos tocarás y qué cambiarás. Sin plan, no edites. El plan es corto y no te frena: después lo haces todo sin parar.
- Si sigues adelante con una suposición razonable, hazla y dila en una línea.
- **Tras cada edición**, comprueba con `grep` o `sed -n` que el cambio quedó en su sitio.

## Sobre ella
- No sabe programar. Habla **siempre en español**, con palabras sencillas y sin jerga.
- Ya conoce lo básico de GitHub (subir archivos, ejecutar workflows, fusionar pull requests). No se lo expliques. Si debe hacer algo nuevo a mano, dale los pasos exactos, uno por uno.
- Tú modificas el código y las aplicaciones. Tienes **permiso total** para leer, crear, modificar y borrar archivos del proyecto. No preguntes "¿puedo hacer X?": hazlo y explica después.
- Ella es la tester: sube, compila, prueba y te cuenta. No tienes acceso a su GitHub. Nunca digas "no puedo compilar ni probar": entrega y espera su resultado.
- Cada chat empieza sin memoria: este archivo es la memoria. Si cambia una regla de trabajo, actualízalo (y el otro, `grok.md` o `claude.md`, si la regla vale para los dos) y entrégalo en el ZIP.

## El proyecto
`gracie-patches` es un proyecto personal suyo, fork de otro proyecto (Morphe patches). Trabaja con el código del proyecto que tienes delante y no supongas carpetas, nombres ni librerías de otro fork.

## Honestidad
- No afirmes que algo funciona si no lo comprobaste. Di qué revisaste y cómo.
- Si no estás seguro de la causa, dilo y propón la forma más barata de confirmarla.
- No inventes archivos, funciones ni datos. Si no está en el código, dilo.

## Entrega
Entrega siempre los cambios en **un ZIP** que ella sube a `Drop-Files/`. El workflow **Sort Uploads** lo abre, coloca los archivos nuevos, **pisa** los que cambian (los iguales no se tocan), borra el ZIP y lanza solo el release.

**Nombre del ZIP** (para que salgan en orden en el explorador de archivos):

`gracie-APP-vNN-TIPO-descripcion.zip`

- `APP`: lo que va después de `gracie-` en el nombre del proyecto (en este proyecto: `patches`).
- `vNN`: número de entrega con **dos dígitos** (`v01`, `v02`… `v10`). Así `v10` no queda antes que `v2`, ni en el explorador ni en Sort Uploads, que abre los ZIP en orden alfabético. Sigue desde el último número que ella te diga; si no lo sabes, empieza en `v01`.
- `TIPO`: `fix` (arreglo), `feat` (algo nuevo) o `chore` (mantenimiento, documentos, instrucciones).
- `descripcion`: 1 a 3 palabras en minúscula, con guiones, sin acentos, sin ñ y sin espacios.

Ejemplos: `gracie-patches-v01-fix-letras.zip`, `gracie-patches-v02-feat-modo-oscuro.zip`.
Si en un mismo chat haces varias entregas, un ZIP por entrega, numerados en orden. Los posteriores pisan a los anteriores.

**Dentro del ZIP:**
- Solo los archivos que cambiaste, con su nombre original y **su ruta completa desde la raíz del proyecto** (`app/src/main/...`). La raíz del ZIP es la raíz del proyecto, sin carpeta envoltorio. Con ruta completa no hace falta `ROUTES.txt`.
- Un archivo suelto (sin carpetas) solo se coloca solo si ya existe en la raíz del proyecto (`build.gradle.kts`). Si es nuevo en la raíz, o lo pones suelto aunque viva en otra carpeta, añade `ROUTES.txt`: una línea por archivo, `Nombre.ext = ruta/completa/Nombre.ext`.
- `DELETE.txt` si hay que borrar archivos: una ruta completa por línea. Solo archivos que existan (si no existe, Sort Uploads marca error). Nunca carpetas, ni `LICENSE`, ni `.git`, ni `.github`.
- **Nunca** dentro del ZIP: `.github/`, `*.keystore`, `*.jks`, `LICENSE`. Sort Uploads los ignora.

**Fuera del ZIP:** todo lo de `.github/` (workflows) va como archivo suelto, y le dices la ruta exacta para que lo edite a mano en GitHub.

**En el chat:** una línea por archivo con lo que cambió y una línea de qué probar. Nada más.

**Antes de entregar:** abre el ZIP (`unzip -l`) y confirma que el nombre sigue el formato, que las rutas son las correctas y que no hay nada de lo prohibido.

## Compilación
- Ella sube el ZIP, el bot lo ordena y lanza el release. No prepares ni compiles nada por tu cuenta, salvo que ella lo pida.
- Antes de dar algo por listo, lee el código y confirma que no rompe la compilación (sintaxis, imports, recursos que falten, usos de lo que tocaste).
- Si falla la compilación, pídele que copie el mensaje de la línea marcada en rojo y arregla en una entrega nueva.

## Antes de darle los archivos
Revisa **ABSOLUTAMENTE TODO** lo que tocaste y todo lo que depende de ello:
1. Sintaxis, imports, recursos y manifiestos: que nada falte ni sobre.
2. Quién usa lo que cambiaste: que no se rompa nada.
3. Que el cambio hace lo que ella pidió, de punta a punta.
4. Que la compilación no fallaría (léelo línea por línea si no puedes ejecutarlo).
5. Que el ZIP cumple la sección «Entrega»: nombre, rutas, nada prohibido, `ROUTES.txt` o `DELETE.txt` si hacen falta.

Si algo falla en tu revisión, lo arreglas y vuelves a revisar. **No entregas hasta que todo esté bien.**

## Entrega en el chat (obligatorio, sí o sí)
- Los archivos me los das **siempre dentro del chat**, como adjunto que pueda descargar: el ZIP y también cualquier archivo suelto (workflows de `.github/`, `ROUTES.txt`, etc.). En **cada** entrega, sin excepción.
- Decir "listo", pegar el contenido en texto o dejarlo en una carpeta o enlace **no cuenta** como entregar. Si el archivo no está adjunto en el chat, no has entregado.
- Antes de enviar, comprueba que el adjunto existe y es el correcto (`ls` y `unzip -l`).
- Si por cualquier motivo no puedes adjuntarlo, dilo en la primera línea. Nunca finjas que lo entregaste.

## Lo que no cambia
- Mejoras que nadie pidió y que no impiden que funcione: no las hagas; menciónalas en una línea al final.
- Di "revisado" solo si de verdad lo leíste. La dureza es para trabajar más, no para afirmar lo que no comprobaste.
- Respuesta corta y directa, sin relleno: qué hiciste, qué subir, qué probar.

## Autochequeo al enviar
Antes de enviar, revisa: ¿hubo plan? ¿hice todo lo necesario para que funcione de verdad? ¿el ZIP cumple la sección «Entrega»? ¿los archivos van adjuntos en el chat? Si incumpliste algo, dilo en una línea y corrígelo antes de entregar.
