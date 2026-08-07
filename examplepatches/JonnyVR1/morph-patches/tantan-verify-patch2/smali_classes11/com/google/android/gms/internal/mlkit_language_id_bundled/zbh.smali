.class final Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;
.super Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;
.source "SourceFile"


# instance fields
.field final transient zba:I

.field final transient zbb:I

.field final synthetic zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zba:I

    .line 7
    .line 8
    iput p3, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbb:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbb:I

    .line 2
    .line 3
    const-string v1, "index"

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/t8r0;->a(IILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 9
    .line 10
    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zba:I

    .line 11
    .line 12
    add-int/2addr p1, p0

    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final size()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbb:I

    return p0
.end method

.method public final bridge synthetic subList(II)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;->zbf(II)Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final zbb()I
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbf;->zbc()I

    move-result v0

    iget v1, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zba:I

    add-int/2addr v0, v1

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbb:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final zbc()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbf;->zbc()I

    move-result v0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zba:I

    add-int/2addr v0, p0

    return v0
.end method

.method public final zbe()[Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    invoke-virtual {p0}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbf;->zbe()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final zbf(II)Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbb:I

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Ll/t8r0;->c(III)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zba:I

    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbh;->zbc:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 9
    .line 10
    add-int/2addr p1, v0

    .line 11
    add-int/2addr p2, v0

    .line 12
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;->zbf(II)Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
