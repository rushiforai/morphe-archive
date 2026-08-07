.class public final Ll/y7p0;
.super Ll/l6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/l6t<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u000c\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u000eR\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0010\u0010\u0011\u001a\u0004\u0008\u0012\u0010\u0013R\u0017\u0010\t\u001a\u00020\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u0018"
    }
    d2 = {
        "Ll/y7p0;",
        "Ll/l6t;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;",
        "leaderBoardView",
        "",
        "name",
        "Ll/ner;",
        "lifecycleProvider",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;",
        "userLeaderBoard",
        "<init>",
        "(Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;Ljava/lang/String;Ll/ner;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;)V",
        "",
        "t",
        "()V",
        "n",
        "e",
        "Ljava/lang/String;",
        "D2",
        "()Ljava/lang/String;",
        "f",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;",
        "getUserLeaderBoard",
        "()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;",
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
.field public final e:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final f:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;Ljava/lang/String;Ll/ner;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p3}, Ll/l6t;-><init>(Ll/ner;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ll/y7p0;->e:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p4, p0, Ll/y7p0;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final D2()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/y7p0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/l6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;->l0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;

    .line 7
    .line 8
    iget-object v1, p0, Ll/y7p0;->e:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p0, p0, Ll/y7p0;->f:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/userleaderboard/page/VoiceUserLeaderBoardPage;->j0(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserLeaderBoard;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
