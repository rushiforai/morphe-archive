.class final Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;
.super Ljava/lang/Object;
.source "SubtitleStyleMetrics.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static alpha(I)I
    .registers 2

    const/16 v0, 0x64

    .line 3
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    int-to-float p0, p0

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr p0, v0

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p0, v0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static previewTextPx(IFFFF)F
    .registers 5

    div-float p2, p1, p2

    .line 7
    invoke-static {p0, p2}, Lapp/yydarlinker/deepseekcaptions/SubtitleStyleMetrics;->scaledSp(IF)F

    move-result p0

    mul-float/2addr p0, p3

    mul-float/2addr p0, p4

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p2, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    div-float/2addr p0, p1

    return p0
.end method

.method static scaledSp(IF)F
    .registers 2

    int-to-float p0, p0

    mul-float/2addr p0, p1

    const/high16 p1, 0x43b40000    # 360.0f

    div-float/2addr p0, p1

    const/high16 p1, 0x41400000    # 12.0f

    .line 5
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method
