.class public final synthetic Ll/xjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

.field public final synthetic b:I

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;IF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    iput p2, p0, Ll/xjl;->b:I

    iput p3, p0, Ll/xjl;->c:F

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;

    iget v1, p0, Ll/xjl;->b:I

    iget p0, p0, Ll/xjl;->c:F

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;->c(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressView;IFLjava/lang/Long;)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method
