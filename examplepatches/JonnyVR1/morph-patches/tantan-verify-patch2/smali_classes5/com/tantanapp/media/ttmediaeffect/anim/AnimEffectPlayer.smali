.class public Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;
.super Lcom/immomo/svgaplayer/view/MomoSVGAImageView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method public loadAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;Z)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;

    .line 4
    .line 5
    invoke-direct {v0, p0, p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$1;-><init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-virtual {p0, p1, p2, v0, p4}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->loadSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public startSVGAAnimWithListener(Ljava/lang/String;ILcom/tantanapp/media/ttmediaeffect/anim/AnimListener;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer$2;-><init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lcom/immomo/svgaplayer/view/MomoSVGAImageView;->startSVGAAnimWithListener(Ljava/lang/String;ILcom/immomo/svgaplayer/SVGAAnimListenerAdapter;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
