package dev.sfehhrths.ekispert.patches.responsetap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/*
 * R8 keeps class names in this app and only mangles members, so fingerprints are built from
 * the (stable) defining class, return/parameter types and un-obfuscated library calls.
 * Method names such as `d()` are deliberately NOT used.
 */

/**
 * `AbsDownloader.d()` — the single place the app builds its OkHttpClient
 * (cached per subclass in `AbsDownloader.j()`).
 *
 * ```smali
 * .method protected d()Lokhttp3/OkHttpClient;
 *     .locals 4
 *     new-instance v0, Lokhttp3/OkHttpClient$Builder;
 *     invoke-direct {v0}, Lokhttp3/OkHttpClient$Builder;-><init>()V   <- filter 0
 *     ...
 * ```
 */
object OkHttpClientBuildFingerprint : Fingerprint(
    definingClass = "/AbsDownloader;",
    returnType = "Lokhttp3/OkHttpClient;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            smali = "Lokhttp3/OkHttpClient\$Builder;-><init>()V",
            opcode = Opcode.INVOKE_DIRECT,
        ),
    ),
)

/**
 * `TransferAlarmCourseDAO.b(Class, AioSearchCondition, String courseXml, long, long, MyClipDataType)`
 * — the non-abstract helper on the Room DAO that persists the transfer-alarm course.
 * The String parameter is the ResultSet XML reduced to the single chosen course.
 *
 * ```smali
 * .method public b(Ljava/lang/Class;L...AioSearchCondition;Ljava/lang/String;JJL...MyClipDataType;)J
 *     .locals 0
 *     invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;
 *     ...
 *     invoke-static {p3}, L.../CompressUtils;->a(Ljava/lang/String;)[B   <- filter 0 (register = the XML)
 * ```
 */
object TransferAlarmCourseSaveFingerprint : Fingerprint(
    definingClass = "/TransferAlarmCourseDAO;",
    returnType = "J",
    parameters = listOf("Ljava/lang/Class;", "L", "Ljava/lang/String;", "J", "J", "L"),
    filters = listOf(
        methodCall(
            smali = "Ljp/co/val/expert/android/commons/utils/CompressUtils;->a(Ljava/lang/String;)[B",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)

/**
 * `AbsDISRxSearchResultDetailParentFragmentPresenter.bc(int index, boolean)` — invoked by the
 * detail screen's ViewPager2 page-selected callback for the first course shown and every swipe.
 * Distinguished from `pg(IZ)V` in the same class by its call to
 * `HistorySelectRouteUseCase.g(AioCourse, long)`.
 *
 * ```smali
 * .method public bc(IZ)V
 *     .locals 4                      ; p0 = v4 (this), p1 = v5 (index), p2 = v6
 *     ...
 *     invoke-virtual {v0, v1, v2, v3}, L.../HistorySelectRouteUseCase;->g(L.../AioCourse;J)Lio/reactivex/Completable;
 * ```
 */
object DetailCourseSelectedFingerprint : Fingerprint(
    definingClass = "/AbsDISRxSearchResultDetailParentFragmentPresenter;",
    returnType = "V",
    parameters = listOf("I", "Z"),
    filters = listOf(
        methodCall(
            definingClass = "Ljp/co/val/expert/android/aio/architectures/domain/sr/usecases/HistorySelectRouteUseCase;",
            returnType = "Lio/reactivex/Completable;",
            parameters = listOf("Ljp/co/val/expert/android/aio/webapi_data_middle_layer/AioCourse;", "J"),
        ),
    ),
)

/**
 * `SearchRouteMyClipEntity.g()` — builds the middle-layer course list from the MyClip
 * (お気に入り) row's single-course XML. Only called when a MyClip detail screen opens.
 *
 * ```smali
 * .method public g()L.../AioCourseList;
 *     .locals 5
 *     ...
 *     iget-object v3, p0, L.../SearchRouteMyClipEntity;->c:Ljava/lang/String;   ; the XML
 *     invoke-static {v3}, Lorg/apache/commons/io/IOUtils;->toInputStream(Ljava/lang/String;)Ljava/io/InputStream;   <- filter 0
 * ```
 */
object MyClipCourseLoadFingerprint : Fingerprint(
    definingClass = "/SearchRouteMyClipEntity;",
    returnType = "Ljp/co/val/expert/android/aio/webapi_data_middle_layer/AioCourseList;",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            smali = "Lorg/apache/commons/io/IOUtils;->toInputStream(Ljava/lang/String;)Ljava/io/InputStream;",
            opcode = Opcode.INVOKE_STATIC,
        ),
    ),
)

/**
 * `AbsDISRxSearchResultDetailParentFragmentUseCase.f(Arguments)` — builds the detail screen's
 * initial state; runs once per detail screen open (new search result or MyClip), before the
 * MyClip entity is loaded and before the first page-selected callback.
 * Used as a "detail opened" marker so the companion can pair a following `myclip_course`
 * with the `selected_course` that comes after it.
 */
object DetailOpenFingerprint : Fingerprint(
    definingClass = "/AbsDISRxSearchResultDetailParentFragmentUseCase;",
    returnType = "Ljp/co/val/expert/android/aio/architectures/ui/datacontainer/sr/viewmodels/AbsDISRxSearchResultDetailParentFragmentViewModelInstanceState;",
    parameters = listOf("Ljp/co/val/expert/android/aio/architectures/ui/datacontainer/sr/fragments/AbsDISRxSearchResultDetailParentFragmentArguments;"),
)

/**
 * `AioApplication.onCreate()` — Application class is fixed by the manifest.
 *
 * ```smali
 * .method public onCreate()V
 *     .locals 3
 *     invoke-super {p0}, Landroid/app/Application;->onCreate()V   <- filter 0
 *     ...
 * ```
 */
object AioApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/co/val/expert/android/aio/app/AioApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            smali = "Landroid/app/Application;->onCreate()V",
            opcode = Opcode.INVOKE_SUPER,
        ),
    ),
)
