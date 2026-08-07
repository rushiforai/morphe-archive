.class public Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


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

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->b:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wo0;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wo0;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onRepeat()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wo0;->f()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/wo0;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onStep(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer$a;->a:Ll/wo0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, v1}, Ll/wo0;->h(ID)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
