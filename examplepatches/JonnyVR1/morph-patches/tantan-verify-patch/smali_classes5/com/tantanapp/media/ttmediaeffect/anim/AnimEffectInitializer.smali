.class public Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;
    }
.end annotation


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


# virtual methods
.method public init(Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;)V
    .locals 1
    .param p1    # Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$2;->$SwitchMap$com$tantanapp$media$ttmediaeffect$anim$AnimEffectInitializer$EffectType:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    aget p2, v0, p2

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p2, v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object p2, Lcom/immomo/svgaplayer/setting/SVGASetting;->Companion:Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;->init()Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    new-instance v0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;

    .line 20
    .line 21
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;-><init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;->setSVGAResLoadAdapter(Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;)Lcom/immomo/svgaplayer/setting/SVGAAdapterContainer;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setMaxCacheSize(I)V
    .locals 0

    .line 1
    sget-object p0, Lcom/immomo/svgaplayer/setting/SVGASetting;->Companion:Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/setting/SVGASetting$Companion;->setCacheMaxSize(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
