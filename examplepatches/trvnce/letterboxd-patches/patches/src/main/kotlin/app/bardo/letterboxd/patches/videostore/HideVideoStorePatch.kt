/*
 * Basado en «Hide Video Store» de ethanm6/letterboxd-stremio-morphe-patch
 * (https://github.com/ethanm6/letterboxd-stremio-morphe-patch), GPL-3.0, que a su vez sigue el
 * enfoque del «Hide ads» de De-Vanced. Reescrito para este repositorio y comprobado contra
 * Letterboxd 3.6.7. Ver NOTICE.
 */
package app.bardo.letterboxd.patches.videostore

import app.bardo.letterboxd.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * `FilmFragment.updateVideoStoreBanner(ActivityFilmBinding, VideoStoreProductSummary)`: con el
 * producto a null, el propio método oculta el banner «Rent from Letterboxd Video Store».
 */
internal object UpdateVideoStoreBannerFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/film/FilmFragment;",
    name = "updateVideoStoreBanner",
    returnType = "V",
    parameters = listOf(
        "Lcom/letterboxd/letterboxd/databinding/ActivityFilmBinding;",
        "Lcom/letterboxd/api/model/VideoStoreProductSummary;",
    ),
)

/**
 * `PopularViewModel.UIState.MainView.getVideoStoreHomeData()`: sin datos, el inicio oculta el
 * carrusel del Video Store (y ese hueco lo ocupa «Recién llegado a Bardo», si está aplicado).
 */
internal object GetVideoStoreHomeDataFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/fragments/popular/PopularViewModel\$UIState\$MainView;",
    name = "getVideoStoreHomeData",
    returnType = "Lcom/letterboxd/api/model/VideoStoreHomeResponse;",
    parameters = listOf(),
)

/** `BrowseRecyclerViewAdapter.addVideoStoreRow()`: la única que mete la fila en «Browse by». */
internal object AddVideoStoreRowFingerprint : Fingerprint(
    definingClass = "Lcom/letterboxd/letterboxd/ui/item/BrowseRecyclerViewAdapter;",
    name = "addVideoStoreRow",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val hideVideoStorePatch = bytecodePatch(
    name = "Hide Video Store",
    description = "Oculta el Video Store de Letterboxd: el banner de alquiler de la ficha, el " +
        "carrusel del inicio y la fila de «Browse by» del buscador.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        // p2 = VideoStoreProductSummary: a null, el método oculta el contenedor y vuelve.
        UpdateVideoStoreBannerFingerprint.method.addInstructions(0, "const/4 p2, 0x0")

        GetVideoStoreHomeDataFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        AddVideoStoreRowFingerprint.method.addInstructions(0, "return-void")
    }
}
