.class public Ll/x1v;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p1, p0, Ll/x1v;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e0(Ll/x1v;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x1v;->h0()V

    return-void
.end method

.method public static synthetic f0(Ll/x1v;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1v;->i0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g0(Ll/x1v;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x1v;->j0(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public a0()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/x1v;->k0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic h0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->B()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic i0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->w(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic j0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->A()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final k0()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->getVoiceNoticeList()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/u1v;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/u1v;-><init>(Ll/x1v;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/v1v;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/v1v;-><init>(Ll/x1v;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/w1v;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ll/w1v;-><init>(Ll/x1v;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->postVoiceActivitiesToZero()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public l0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/x1v;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v1, "live-activity"

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v1, ""

    .line 26
    .line 27
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->Q(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, p0, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public m0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object p0, p0, Ll/x1v;->a:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public n0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x1v;->k0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o0(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "all"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x2

    .line 7
    if-ne p1, p0, :cond_1

    .line 8
    .line 9
    const-string p0, "match"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    const/4 p0, 0x3

    .line 13
    if-ne p1, p0, :cond_2

    .line 14
    .line 15
    const-string p0, "likeother"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_2
    const-string p0, "follow"

    .line 19
    .line 20
    :goto_0
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->userId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/external/module/api/VoiceCenterApiProvider;->cancelRelationships(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    return-void
.end method
