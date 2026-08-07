.class public final Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/b;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/b;->n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->i:Ll/iam;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/b;->m(Lcom/p1/mobile/android/app/Act;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    xor-int/lit8 p0, p0, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->p7()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 13
    .line 14
    if-ne p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    return v0
.end method

.method public n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalVideoMultiCallFindPeoplePushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
