.class final Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;
.super Ljava/lang/Object;
.source "CaptionOverlayV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "LayoutBudget"
.end annotation


# instance fields
.field final minimumPx:F

.field final preferredPx:F

.field final width:I


# direct methods
.method constructor <init>(IF)V
    .registers 3

    .line 35
    invoke-direct {p0, p1, p2, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;-><init>(IFF)V

    return-void
.end method

.method constructor <init>(IFF)V
    .registers 4

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->width:I

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->minimumPx:F

    iput p3, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->preferredPx:F

    return-void
.end method


# virtual methods
.method approximateColumns()I
    .registers 3

    .line 59
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->width:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->minimumPx:F

    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    div-float/2addr v0, p0

    float-to-int p0, v0

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method fits(Ljava/lang/String;)Z
    .registers 6

    .line 43
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 44
    :cond_8
    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    .line 45
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 46
    iget v2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->minimumPx:F

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 47
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->width:I

    invoke-static {v1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/4 v3, 0x0

    invoke-static {p1, v3, v2, v0, p0}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 48
    invoke-virtual {p0, v3}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    const/4 p1, 0x2

    .line 49
    invoke-virtual {p0, p1}, Landroid/text/StaticLayout$Builder;->setBreakStrategy(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 50
    invoke-virtual {p0, v3}, Landroid/text/StaticLayout$Builder;->setHyphenationFrequency(I)Landroid/text/StaticLayout$Builder;

    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object p0

    .line 52
    invoke-virtual {p0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result p0

    if-gt p0, p1, :cond_3e

    return v1

    :cond_3e
    return v3
.end method

.method preferredColumns()I
    .registers 3

    .line 56
    iget v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->width:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->preferredPx:F

    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    div-float/2addr v0, p0

    float-to-int p0, v0

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method
