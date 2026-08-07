.class public final Ll/oxw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Object;

.field public final b:Ljava/lang/Object;

.field public final c:[B

.field public final d:Lcom/google/android/gms/internal/ads/zzgvz;

.field public final e:I

.field public final f:Ljava/lang/String;

.field public final g:Ll/xww0;

.field public final h:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;[BILcom/google/android/gms/internal/ads/zzgvz;ILjava/lang/String;Ll/xww0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/oxw0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    iput-object p2, p0, Ll/oxw0;->b:Ljava/lang/Object;

    .line 7
    .line 8
    array-length p1, p3

    .line 9
    invoke-static {p3, p1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/oxw0;->c:[B

    .line 14
    .line 15
    iput p4, p0, Ll/oxw0;->h:I

    .line 16
    .line 17
    iput-object p5, p0, Ll/oxw0;->d:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 18
    .line 19
    iput p6, p0, Ll/oxw0;->e:I

    .line 20
    .line 21
    iput-object p7, p0, Ll/oxw0;->f:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p8, p0, Ll/oxw0;->g:Ll/xww0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/oxw0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public final b()Ll/xww0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxw0;->g:Ll/xww0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Lcom/google/android/gms/internal/ads/zzgvz;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxw0;->d:Lcom/google/android/gms/internal/ads/zzgvz;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxw0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxw0;->b:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oxw0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()[B
    .locals 1

    .line 1
    iget-object p0, p0, Ll/oxw0;->c:[B

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    array-length v0, p0

    .line 8
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/oxw0;->h:I

    .line 2
    .line 3
    return p0
.end method
