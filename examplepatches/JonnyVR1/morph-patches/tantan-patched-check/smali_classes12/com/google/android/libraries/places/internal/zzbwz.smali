.class public final Lcom/google/android/libraries/places/internal/zzbwz;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lkotlin/jvm/JvmName;
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public static final zza(Lcom/google/android/libraries/places/internal/zzbwp;I)I
    .locals 5
    .param p0    # Lcom/google/android/libraries/places/internal/zzbwp;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwp;->zzq()[I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwp;->zzr()[[B

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    array-length p0, p0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    add-int/lit8 p0, p0, -0x1

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    if-gt v1, p0, :cond_1

    .line 20
    .line 21
    add-int/lit8 v2, p1, 0x1

    .line 22
    .line 23
    add-int v3, v1, p0

    .line 24
    .line 25
    ushr-int/lit8 v3, v3, 0x1

    .line 26
    .line 27
    aget v4, v0, v3

    .line 28
    .line 29
    if-ge v4, v2, :cond_0

    .line 30
    .line 31
    add-int/lit8 v1, v3, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    if-le v4, v2, :cond_2

    .line 35
    .line 36
    add-int/lit8 p0, v3, -0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    neg-int p0, v1

    .line 40
    add-int/lit8 v3, p0, -0x1

    .line 41
    .line 42
    :cond_2
    if-ltz v3, :cond_3

    .line 43
    .line 44
    return v3

    .line 45
    :cond_3
    not-int p0, v3

    .line 46
    return p0
.end method
