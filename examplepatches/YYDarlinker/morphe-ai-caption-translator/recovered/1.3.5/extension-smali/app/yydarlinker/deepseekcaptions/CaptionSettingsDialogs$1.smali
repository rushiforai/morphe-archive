.class Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;
.super Landroid/widget/ScrollView;
.source "CaptionSettingsDialogs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs;->show(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$c:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Context;)V
    .registers 3

    .line 41
    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;->val$c:Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected onMeasure(II)V
    .registers 6

    .line 43
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;->val$c:Landroid/content/Context;

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsStyle;->dp(Landroid/content/Context;F)I

    move-result v0

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionSettingsDialogs$1;->val$c:Landroid/content/Context;

    .line 44
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v1, v1

    const v2, 0x3f0ccccd    # 0.55f

    mul-float/2addr v1, v2

    float-to-int v1, v1

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 45
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    if-eqz v1, :cond_2c

    .line 46
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_2c
    const/high16 p2, -0x80000000

    .line 47
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/ScrollView;->onMeasure(II)V

    return-void
.end method
