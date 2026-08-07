.class public Ll/fqf;
.super Ll/sic0;
.source "SourceFile"


# direct methods
.method public constructor <init>(F)V
    .locals 6

    .line 1
    float-to-double v0, p1

    .line 2
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 3
    .line 4
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 5
    .line 6
    .line 7
    move-result-wide v4

    .line 8
    double-to-float p1, v4

    .line 9
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    double-to-float v4, v4

    .line 14
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->pow(DD)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    double-to-float v0, v0

    .line 19
    invoke-direct {p0, p1, v4, v0}, Ll/sic0;-><init>(FFF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
