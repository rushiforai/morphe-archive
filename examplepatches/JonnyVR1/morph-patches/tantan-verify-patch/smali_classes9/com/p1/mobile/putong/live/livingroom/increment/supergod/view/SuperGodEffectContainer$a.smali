.class public final Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w8e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\t\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "com/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer$a",
        "Ll/w8e;",
        "Ljava/io/File;",
        "file",
        "",
        "a",
        "(Ljava/io/File;)V",
        "",
        "errMsg",
        "onFailed",
        "(Ljava/lang/String;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;->f(Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;)Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuperGodReward;->resourceId:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-virtual {p1, v0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer$a;->a:Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;->i(Lcom/p1/mobile/putong/live/livingroom/increment/supergod/view/SuperGodEffectContainer;Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public bridge b(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->b(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge c(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->c(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge d(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->d(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge onCancel()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onCancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/w8e;->onFailed(Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "\u5c01\u795e\u5e86\u8d44\u6e90\u4e0b\u8f7d\u5931\u8d25:"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "[live][gift]resource"

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public bridge onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
