.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static e:Z


# instance fields
.field public c:Ll/x1v;

.field public d:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->lambda$initSubscription$0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static Y1(Landroid/content/Context;Z)Landroid/content/Intent;
    .locals 1

    .line 1
    sput-boolean p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->e:Z

    .line 2
    .line 3
    new-instance p1, Landroid/content/Intent;

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;

    .line 6
    .line 7
    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method private synthetic lambda$initSubscription$0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->c:Ll/x1v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x1v;->a0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x1v;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/x1v;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->c:Ll/x1v;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 12
    .line 13
    sget-boolean v1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->e:Z

    .line 14
    .line 15
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;-><init>(Lcom/p1/mobile/android/app/Act;Z)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->d:Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;->c:Ll/x1v;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/i0v;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/i0v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
