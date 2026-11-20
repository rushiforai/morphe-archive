# Contribuir

¡Gracias por ayudar con los parches de Facemoji!

## Antes de abrir una incidencia

- Comprueba que no exista ya una incidencia igual.
- Indica **siempre** la versión de Facemoji y, si es un fallo de parcheo, el mensaje de error
  de Morphe Manager.
- Si un parche "no hace nada", adjunta la salida de:

  ```bash
  python3 tools/analizar_apk.py tu-facemoji.apkm --comprobar
  ```

## Enviar cambios

1. Trabaja sobre una rama propia y haz commits semánticos:
   - `feat: ...` nueva función o parche
   - `fix: ...` corrección
   - `chore: ...` cambios internos (no aparecen en el changelog)
2. Mantén el estilo descrito en [docs/DESARROLLO.md](docs/DESARROLLO.md).
3. Si añades un parche nuevo, documenta qué método interceptas y por qué.
4. Abre la pull request explicando qué versiones de la app has probado.

## Qué se acepta

- Parches que funcionen sobre una APK real y estén probados en dispositivo.
- Huellas basadas en API pública de SDK (preferido) o en el código propio de la app,
  pero en ese caso indica la versión exacta en la que se verificaron.

## Qué no se acepta

- Parches que no se hayan probado nunca.
- Cambios en `patches-list.json`, `patches-bundle.json` o `CHANGELOG.md`: los genera la
  publicación automática.
