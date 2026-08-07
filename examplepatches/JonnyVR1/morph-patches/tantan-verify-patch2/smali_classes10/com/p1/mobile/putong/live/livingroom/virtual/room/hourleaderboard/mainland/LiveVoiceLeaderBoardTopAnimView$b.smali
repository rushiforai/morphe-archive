.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView$b;
.super Ll/wo0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;->k0(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "com/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView$b",
        "Ll/wo0;",
        "",
        "g",
        "()V",
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
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView$b;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/wo0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wo0;->g()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView$b;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;->i0(Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/LiveVoiceLeaderBoardTopAnimView;)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
