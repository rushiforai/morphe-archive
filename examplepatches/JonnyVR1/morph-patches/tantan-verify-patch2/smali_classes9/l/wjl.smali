.class public final synthetic Ll/wjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

.field public final synthetic b:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    iput p2, p0, Ll/wjl;->b:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    iget p0, p0, Ll/wjl;->b:F

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;FLjava/lang/Long;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
