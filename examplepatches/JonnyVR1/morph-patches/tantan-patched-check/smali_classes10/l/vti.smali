.class public Ll/vti;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(F)[I
    .locals 4

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    cmpg-float v1, p0, v1

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-gez v1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/vwt;->q5()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    aput p0, v0, v3

    .line 21
    .line 22
    int-to-float p0, p0

    .line 23
    const v1, 0x3fe38e39

    .line 24
    .line 25
    .line 26
    mul-float/2addr p0, v1

    .line 27
    float-to-int p0, p0

    .line 28
    aput p0, v0, v2

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_0
    sget v1, Ll/fti;->i:I

    .line 32
    .line 33
    aput v1, v0, v2

    .line 34
    .line 35
    int-to-float v1, v1

    .line 36
    mul-float/2addr v1, p0

    .line 37
    float-to-int p0, v1

    .line 38
    aput p0, v0, v3

    .line 39
    .line 40
    return-object v0
.end method
