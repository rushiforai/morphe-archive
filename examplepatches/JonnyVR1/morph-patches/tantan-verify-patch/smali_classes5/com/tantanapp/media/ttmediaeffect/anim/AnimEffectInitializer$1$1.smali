.class Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/media/ttmediaeffect/IResLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;->loadSVGARes(ZLjava/lang/String;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;

.field final synthetic val$svgaResLoadCallBack:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;


# direct methods
.method public constructor <init>(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;->this$1:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;->val$svgaResLoadCallBack:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFail()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;->val$svgaResLoadCallBack:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;->onResLoadFail()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectInitializer$1$1;->val$svgaResLoadCallBack:Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/immomo/svgaplayer/adaptercallback/SVGAResLoadCallBack;->onResLoadSuccess(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
