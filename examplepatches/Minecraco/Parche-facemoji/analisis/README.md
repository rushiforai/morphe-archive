# 🔬 Análisis de la APK real

Aquí están los informes que se usaron para escribir las huellas de los parches. Todos se
generaron con `tools/analizar_apk.py` sobre la **APK 3.7.0 real** de APKMirror
(`com.simejikeyboard`, 2 arquitecturas, 38.996.639 bytes, 4 ficheros DEX, 164.880 cadenas).

Se conservan porque son la prueba de dónde sale cada huella y porque sirven de referencia
cuando cambie la versión: si una huella deja de coincidir, se compara el informe viejo con el
nuevo.

## Primera pasada: qué SDK trae la app

| Fichero | Contenido |
| --- | --- |
| `01-sdk.txt` | Resumen de SDK detectados por descriptor de tipo |
| `02-huellas.txt` | Comprobación de las huellas de los parches (`--comprobar`) |
| `03-vip.txt` | Cadenas y métodos candidatos de VIP (`--vip`) |
| `04-clases-*.txt`, `05-clases-*.txt` | Clases de los paquetes de la app y de los SDK |

Conclusión: la red de anuncios dominante es **Pangle/CSJ (ByteDance)**, AdMob solo está como
stub de mediación y no hay Facebook, Unity, AppLovin ni Adjust.

## Segunda pasada: anuncios propios y VIP

| Fichero | Contenido |
| --- | --- |
| `10-admob-clases.txt` | Clases de AdMob que sí existen (solo mediación y `nativead`) |
| `11-pangle-clases.txt` | API pública de Pangle que queda sin renombrar (`TTAdConstant`, `TTC*Proxy`) |
| `12-ads-app.txt` | Clases de la app relacionadas con anuncios |
| `13-ads-metodos.txt` | Métodos de esas clases |
| `20-vip-clases.txt` | Clases con `Vip`/`VIP` en el nombre |
| `21-vip-metodos.txt`, `22-sdk-metodos.txt` | (vacíos: el volcado de métodos estaba roto) |

## Tercera pasada: objetivos del parche de VIP y de anuncios

| Fichero | Contenido |
| --- | --- |
| `30-clases-ads.txt` | Clases con `ad`/`adm`/`splash`/`reward` sin distinguir mayúsculas |
| `31-ads-metodos.txt` | Métodos de `admaster` y de `plutus.adsuggestion` |
| `32-ads-config.txt` | Beans de configuración de anuncios |
| `33-vip-clases.txt` | Clases de cuenta, usuario y VIP |
| `34-vip-metodos.txt` | **Firmas de los beans VIP** (fuente del parche `unlock-vip`) |
| `35-sdk-metodos.txt` | Clase `sdk/SDKType` (banderas de variante de la app) |
| `36-vip-claves.txt` | Claves de preferencias y columnas SQLite con `vip` |

## Cuarta y quinta pasadas: quién llama a quién

| Fichero | Contenido |
| --- | --- |
| `40-accountinfo.txt` | `AccountInfo` (contenedor de campos, sin métodos útiles) |
| `41-llamadas-pangle.txt` | Resultado: **0 llamadas** desde la app al SDK de Pangle |
| `42-llamadas-admob.txt` | Solo una actividad de depuración usa AdMob (`debug/b`) |
| `43-llamadas-vip.txt` | Uso de `isVipSubscriber` (solo en una pantalla de depuración) |
| `44-clases-subscripcion.txt` | Clases de compra y suscripción |
| `45-metodos-subscripcion.txt` | Métodos de las pantallas de vídeo recompensado y suscripción |
| `50-smali-adsuggestion.txt` | **Bytecode de `AdSuggestionUtils`** (fuente del parche de anuncios) |
| `51-smali-coolfont.txt` | **Bytecode de `CoolFontBean`** (lógica de `isVip`/candado) |
| `52-uso-clave-vip.txt` | Dónde se lee `is_vip_subscriber` |
| `53-metodos-vip.txt` | Todos los métodos con nombre `isVip`/`isPro` de la app |
| `54-splash.txt` | Métodos de `settings/guide/*` (pantalla de bienvenida) |
| `60-api-gestores.txt` | Fachada `g00/a` y su interfaz `h00/a` |
| `61-smali-h00.txt`, `62-smali-gate.txt` | (vacíos: `h00/a` es abstracta y el `grep` falló) |

## Sexta pasada: la pantalla de ajustes (para el parche de ajustes)

| Fichero | Contenido |
| --- | --- |
| `90-descarga.txt` | Comprobación de que la APK se pudo descargar |
| `91-clases-ajustes.txt` | Clases de ajustes, ayuda y feedback |
| `92-metodos-ajustes.txt` | Métodos de `com/baidu/simeji/settings/*` |
| `93-smali-ajustes.txt` | **Bytecode de `SettingsAdvancedFragment`** (es un `PreferenceFragment`) |
| `94-llamadas-ajustes.txt` | Quién usa esa pantalla |
| `95-verificacion.txt` | Registro de haber aplicado el bundle a la APK real |
| `96-verificacion-apk.txt` | **Comprobación de las inyecciones en el APK parcheado** |

## Cómo reproducirlo

```bash
pip install androguard
python3 tools/analizar_apk.py tu-facemoji.apkm --comprobar
```

El resto de opciones (`--clases-regex`, `--metodos`, `--metodos-nombre`, `--llamadas`,
`--smali`, `--vip`, `--informe`) están documentadas en
[`docs/VERIFICAR_HUELLAS.md`](../docs/VERIFICAR_HUELLAS.md).
