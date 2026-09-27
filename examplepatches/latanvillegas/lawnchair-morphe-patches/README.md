# Lawnchair Morphe Patches

Fuente de parches Morphe para Lawnchair mantenida en una sola rama: `main`.

## Objetivo

Convertir las personalizaciones realizadas en Lawnchair en parches `.mpp` instalables desde Morphe Manager mediante la URL del repositorio.

Parches previstos:

- Barra de estado en All Apps.
- Tema AMOLED negro puro / blanco puro.
- Eliminación del indicador (handle) de All Apps.

## Fuente remota

En Morphe Manager usa el repositorio:

`https://github.com/latanvillegas/lawnchair-morphe-patches`

Morphe requiere `patches-bundle.json` en `main` y un bundle `.mpp` publicado para que la fuente pueda descargarse y actualizarse automáticamente.

## Estado

La infraestructura Gradle/Morphe está en preparación. Los antiguos archivos `.patch` son diferencias de código fuente y deben convertirse a parches Morphe de bytecode antes de publicar el primer bundle `.mpp`.
