.class public final synthetic Ll/sjl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    iput-object p2, p0, Ll/sjl;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sjl;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

    iget-object p0, p0, Ll/sjl;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Ljava/lang/Runnable;)V

    return-void
.end method
