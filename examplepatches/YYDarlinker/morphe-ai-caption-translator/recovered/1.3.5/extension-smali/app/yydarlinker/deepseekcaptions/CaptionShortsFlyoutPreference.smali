.class public final Lapp/yydarlinker/deepseekcaptions/CaptionShortsFlyoutPreference;
.super Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;
.source "CaptionShortsFlyoutPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 6
    invoke-direct {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 7
    invoke-direct {p0, p1, p2}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 8
    invoke-direct {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 9
    invoke-direct {p0, p1, p2, p3, p4}, Lapp/yydarlinker/deepseekcaptions/CaptionFlyoutPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method protected save(Z)V
    .registers 2

    .line 11
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionShortsFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->saveShortsFlyoutMenuEnabled(Landroid/content/Context;Z)V

    return-void
.end method

.method protected saved()Z
    .registers 1

    .line 10
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionShortsFlyoutPreference;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekConfig;->shortsFlyoutMenuEnabled(Landroid/content/Context;)Z

    move-result p0

    return p0
.end method

.method protected title()Ljava/lang/String;
    .registers 1

    .line 12
    const-string p0, "Shorts \u5f39\u51fa\u83dc\u5355\u4e2d\u7684 AI \u5b57\u5e55\u5f00\u5173"

    return-object p0
.end method
