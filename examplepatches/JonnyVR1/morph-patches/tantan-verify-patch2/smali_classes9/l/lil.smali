.class public final synthetic Ll/lil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

.field public final synthetic b:Lv/VText;

.field public final synthetic c:I

.field public final synthetic d:Z

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;Lv/VText;IZJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lil;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    iput-object p2, p0, Ll/lil;->b:Lv/VText;

    iput p3, p0, Ll/lil;->c:I

    iput-boolean p4, p0, Ll/lil;->d:Z

    iput-wide p5, p0, Ll/lil;->e:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lil;->a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;

    iget-object v1, p0, Ll/lil;->b:Lv/VText;

    iget v2, p0, Ll/lil;->c:I

    iget-boolean v3, p0, Ll/lil;->d:Z

    iget-wide v4, p0, Ll/lil;->e:J

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;->b(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardEntryView;Lv/VText;IZJ)V

    return-void
.end method
