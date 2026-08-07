.class public Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/request/RequestCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->h(Ljava/lang/String;ILl/wo0;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/wo0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Ll/wo0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->a:Ll/wo0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLoadFailed(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/exception/SVGAException;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 6
    .line 7
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->e(Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lcom/tantan/library/svga/exception/SVGAException;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->a:Ll/wo0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/wo0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onResourceReady(Lcom/tantan/library/svga/ResourceKey;Lcom/tantan/library/svga/data/cache/Resource;)V
    .locals 0
    .param p1    # Lcom/tantan/library/svga/ResourceKey;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/cache/Resource;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tantan/library/svga/ResourceKey;",
            "Lcom/tantan/library/svga/data/cache/Resource<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    instance-of p1, p1, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$b;->a:Ll/wo0;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-interface {p2}, Lcom/tantan/library/svga/data/cache/Resource;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/tantan/library/svga/compose/SVGAVideoEntity;

    .line 20
    .line 21
    invoke-static {p1}, Ll/so0;->a(Lcom/tantan/library/svga/compose/SVGAVideoEntity;)Ll/so0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/wo0;->d(Ll/so0;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/wo0;->c()V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method
