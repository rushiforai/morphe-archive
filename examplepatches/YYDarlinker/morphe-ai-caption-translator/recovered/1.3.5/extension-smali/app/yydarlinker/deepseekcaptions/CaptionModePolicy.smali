.class final Lapp/yydarlinker/deepseekcaptions/CaptionModePolicy;
.super Ljava/lang/Object;
.source "CaptionModePolicy.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static mayCallApi(ZZZ)Z
    .registers 3

    if-nez p0, :cond_8

    if-nez p1, :cond_8

    if-nez p2, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method static mayTranslateSelection(ZZZ)Z
    .registers 3

    if-eqz p0, :cond_8

    if-eqz p1, :cond_8

    if-eqz p2, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
