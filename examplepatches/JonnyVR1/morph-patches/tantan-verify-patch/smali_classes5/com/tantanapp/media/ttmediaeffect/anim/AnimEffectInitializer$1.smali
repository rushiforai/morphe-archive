.class Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/svgaplayer/adapter/SVGAResLoadAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;->init(Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$EffectType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;

.field final synthetic val$loadResStrategy:Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;->this$0:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;->val$loadResStrategy:Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public loadSVGARes(ZLjava/lang/String;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p1, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;

    .line 2
    .line 3
    invoke-direct {p1, p0, p3}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;-><init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;->val$loadResStrategy:Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;

    .line 7
    .line 8
    invoke-interface {p0, p2, p1}, Lcom/tantanapp/media/ttmediaeffect/ILoadResStrategy;->loadResource(Ljava/lang/String;Lcom/tantanapp/media/ttmediaeffect/IResLoadCallback;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
