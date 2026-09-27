.class final Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;
.super Ljava/lang/Object;
.source "NativeCaptionBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Selection"
.end annotation


# instance fields
.field final asr:Z

.field final language:Ljava/lang/String;

.field final manager:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final off:Z

.field final origin:Ljava/lang/Object;

.field final reason:I

.field final selectedUrl:Ljava/lang/String;

.field final track:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final translated:Z

.field final video:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .registers 7

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->video:Ljava/lang/String;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->manager:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->track:Ljava/lang/ref/WeakReference;

    .line 76
    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->origin:Ljava/lang/Object;

    iput p5, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->reason:I

    const/4 p1, 0x0

    const/4 p2, 0x1

    if-eqz p3, :cond_2a

    const-string p4, "DISABLE_CAPTIONS_OPTION"

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p4, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_28

    goto :goto_2a

    :cond_28
    move p4, p1

    goto :goto_2b

    :cond_2a
    :goto_2a
    move p4, p2

    :goto_2b
    iput-boolean p4, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->off:Z

    .line 77
    const-string p5, ""

    if-eqz p4, :cond_33

    move-object v0, p5

    goto :goto_37

    :cond_33
    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_37
    iput-object v0, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->selectedUrl:Ljava/lang/String;

    if-eqz p4, :cond_3c

    goto :goto_40

    :cond_3c
    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->language(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    :goto_40
    iput-object p5, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->language:Ljava/lang/String;

    if-nez p4, :cond_50

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->url(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Lapp/yydarlinker/deepseekcaptions/TargetLanguage;->fromUrl(Ljava/lang/String;)Lapp/yydarlinker/deepseekcaptions/TargetLanguage;

    move-result-object p5

    if-eqz p5, :cond_50

    move p5, p2

    goto :goto_51

    :cond_50
    move p5, p1

    :goto_51
    iput-boolean p5, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->translated:Z

    if-nez p4, :cond_62

    invoke-static {p3}, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge;->vss(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    const-string p4, "a."

    invoke-virtual {p3, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_62

    move p1, p2

    :cond_62
    iput-boolean p1, p0, Lapp/yydarlinker/deepseekcaptions/NativeCaptionBridge$Selection;->asr:Z

    return-void
.end method
