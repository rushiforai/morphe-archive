package app.bardo.letterboxd.patches

import app.morphe.patcher.Fingerprint

/*
 * Letterboxd para Android no está ofuscada (comprobado en 3.6.7): clases y métodos
 * conservan su nombre, así que los fingerprints usan nombres exactos.
 *
 * Si una versión futura renombra o mueve alguno de estos métodos, el parche fallará
 * al aplicarse con el nombre del fingerprint en el error, en vez de romper la app.
 */

/**
 * Cabecera de la ficha de película. Recibe el Film completo (con sus enlaces, entre
 * ellos el de TMDB) y el binding con las vistas, incluido el botón de tráiler.
 *
 * `public final void configurePoster(Film film, FragmentFilmHeaderBinding binding)`
 */
internal object FilmHeaderConfigurePosterFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmHeaderFragment;",
    name = "configurePoster",
    returnType = "V",
    parameters = listOf(
        "Lcom/letterboxd/api/model/Film;",
        "Lcom/letterboxd/letterboxd/databinding/FragmentFilmHeaderBinding;",
    ),
)

/*
 * Funciones de la API de Letterboxd por las que pasan las acciones del usuario que Bardo
 * replica en la watchlist de Plex. Son `suspend` de Kotlin: el nombre lleva un sufijo
 * (`-BWLJW6A`) derivado de la firma, así que si Letterboxd cambia los parámetros el
 * fingerprint dejará de encontrarlas y el parche fallará al aplicarse.
 */

/** `MeApi.watchlist(filmId, WatchlistUpdateRequest, …)`: guardar o quitar de la watchlist. */
internal object MeWatchlistFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/api/MeApi;",
    name = "watchlist-BWLJW6A",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/letterboxd/api/model/WatchlistUpdateRequest;",
        "Z",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/** `MeApi.watch(filmId, WatchUpdateRequest, …)`: marcar como vista. */
internal object MeWatchFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/api/MeApi;",
    name = "watch-BWLJW6A",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/letterboxd/api/model/WatchUpdateRequest;",
        "Z",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/** `FilmsApi.updateMyRelationshipToFilm(filmId, FilmRelationshipUpdateRequest, …)`. */
internal object FilmsUpdateRelationshipFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/api/FilmsApi;",
    name = "updateMyRelationshipToFilm-BWLJW6A",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/letterboxd/api/model/FilmRelationshipUpdateRequest;",
        "Z",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/** `LogEntriesApi.createLogEntry(…, LogEntryCreationRequest, …)`: registrar en el diario. */
internal object LogEntriesCreateFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/api/LogEntriesApi;",
    name = "createLogEntry-BWLJW6A",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/letterboxd/api/model/LogEntryCreationRequest;",
        "Z",
        "Lkotlin/coroutines/Continuation;",
    ),
)

/**
 * Fila «Dónde verlo» de la ficha: coloca los iconos de los servicios y el distintivo OWN,
 * y oculta la fila si no hay ninguno.
 *
 * `public final void updateServicesIcons(boolean owned, List<ProductionAvailability> services)`
 */
/**
 * Pantalla completa de «Dónde verlo» (lista de servicios), a la que se llega tocando la fila.
 *
 * `public void onViewCreated(View view, Bundle savedInstanceState)`
 */
internal object FilmAvailabilityOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmAvailabilityFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Landroid/os/Bundle;",
    ),
)

internal object WhereToWatchUpdateServicesIconsFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/WhereToWatchFragment;",
    name = "updateServicesIcons",
    returnType = "V",
    parameters = listOf(
        "Z",
        "Ljava/util/List;",
    ),
)
