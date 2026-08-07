.class final Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;
.super Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;
.source "SourceFile"


# static fields
.field static final zba:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;


# instance fields
.field final transient zbb:[Ljava/lang/Object;

.field private final transient zbc:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    new-array v2, v1, [Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;-><init>([Ljava/lang/Object;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zba:Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbi;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbb:[Ljava/lang/Object;

    .line 5
    .line 6
    iput p2, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final get(I)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    .line 2
    .line 3
    const-string v1, "index"

    .line 4
    .line 5
    invoke-static {p1, v0, v1}, Ll/t8r0;->a(IILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbb:[Ljava/lang/Object;

    .line 9
    .line 10
    aget-object p0, p0, p1

    .line 11
    .line 12
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public final size()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    return p0
.end method

.method public final zba([Ljava/lang/Object;I)I
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbb:[Ljava/lang/Object;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iget v1, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    .line 5
    .line 6
    invoke-static {p2, v0, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    .line 10
    .line 11
    return p0
.end method

.method public final zbb()I
    .locals 0

    iget p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbc:I

    return p0
.end method

.method public final zbc()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final zbe()[Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/mlkit_language_id_bundled/zbj;->zbb:[Ljava/lang/Object;

    return-object p0
.end method
