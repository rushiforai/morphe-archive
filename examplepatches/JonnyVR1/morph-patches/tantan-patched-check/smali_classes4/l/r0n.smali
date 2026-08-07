.class public Ll/r0n;
.super Ll/q0n;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/q0n;->f()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->ne()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r0n;->n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->c(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 11
    .line 12
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 21
    .line 22
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x1

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->h(Z)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->a()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->k(Lcom/p1/mobile/putong/data/PushMessage;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
