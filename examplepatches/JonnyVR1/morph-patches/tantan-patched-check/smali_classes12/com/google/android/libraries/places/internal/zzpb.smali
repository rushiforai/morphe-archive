.class public abstract Lcom/google/android/libraries/places/internal/zzpb;
.super Lcom/google/android/libraries/places/internal/zzpd;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/libraries/places/internal/zzpd;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static zzd([CII)[C
    .locals 1

    .line 1
    if-ltz p2, :cond_1

    .line 2
    .line 3
    new-array p2, p2, [C

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, v0, p2, v0, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-object p2

    .line 12
    :cond_1
    const-string p0, "Cannot increase internal buffer any further"

    .line 13
    .line 14
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method


# virtual methods
.method public zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public abstract zzb(C)[C
.end method

.method public final zzc(Ljava/lang/String;I)Ljava/lang/String;
    .locals 12

    .line 1
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzpk;->zza()[C

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    move v3, v2

    .line 8
    move v4, v3

    .line 9
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    if-ge p2, v5, :cond_4

    .line 14
    .line 15
    add-int/lit8 v6, p2, 0x1

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v7

    .line 21
    invoke-virtual {p0, v7}, Lcom/google/android/libraries/places/internal/zzpb;->zzb(C)[C

    .line 22
    .line 23
    .line 24
    move-result-object v7

    .line 25
    if-eqz v7, :cond_3

    .line 26
    .line 27
    sub-int v8, p2, v3

    .line 28
    .line 29
    add-int v9, v4, v8

    .line 30
    .line 31
    array-length v10, v7

    .line 32
    add-int v11, v9, v10

    .line 33
    .line 34
    if-ge v1, v11, :cond_0

    .line 35
    .line 36
    sub-int/2addr v5, p2

    .line 37
    add-int/2addr v5, v5

    .line 38
    add-int v1, v11, v5

    .line 39
    .line 40
    invoke-static {v0, v4, v1}, Lcom/google/android/libraries/places/internal/zzpb;->zzd([CII)[C

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :cond_0
    if-lez v8, :cond_1

    .line 45
    .line 46
    invoke-virtual {p1, v3, p2, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 47
    .line 48
    .line 49
    move v4, v9

    .line 50
    :cond_1
    if-lez v10, :cond_2

    .line 51
    .line 52
    invoke-static {v7, v2, v0, v4, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    add-int/2addr v4, v10

    .line 56
    :cond_2
    move v3, v6

    .line 57
    :cond_3
    move p2, v6

    .line 58
    goto :goto_0

    .line 59
    :cond_4
    sub-int p0, v5, v3

    .line 60
    .line 61
    if-lez p0, :cond_6

    .line 62
    .line 63
    add-int/2addr p0, v4

    .line 64
    if-ge v1, p0, :cond_5

    .line 65
    .line 66
    invoke-static {v0, v4, p0}, Lcom/google/android/libraries/places/internal/zzpb;->zzd([CII)[C

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :cond_5
    invoke-virtual {p1, v3, v5, v0, v4}, Ljava/lang/String;->getChars(II[CI)V

    .line 71
    .line 72
    .line 73
    move v4, p0

    .line 74
    :cond_6
    new-instance p0, Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {p0, v0, v2, v4}, Ljava/lang/String;-><init>([CII)V

    .line 77
    .line 78
    .line 79
    return-object p0
.end method
