.class public Ll/a1t;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;",
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
.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v0, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 24
    .line 25
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->g6(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/a1t;->m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
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
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
