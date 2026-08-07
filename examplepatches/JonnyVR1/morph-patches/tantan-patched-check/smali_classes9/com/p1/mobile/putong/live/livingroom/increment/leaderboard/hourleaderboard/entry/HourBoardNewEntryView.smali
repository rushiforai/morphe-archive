.class public Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/gil;",
        ">;"
    }
.end annotation


# static fields
.field public static final o:Ljava/lang/String;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;

.field public b:Landroid/view/View;

.field public c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

.field public d:Lv/VImage;

.field public e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

.field public f:Ll/gil;

.field public g:J

.field public h:Ll/byd0;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

.field public j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

.field public k:Z

.field public l:Landroid/animation/Animator;

.field public m:Landroid/animation/Animator;

.field public n:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m6:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->o:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 7
    .line 8
    new-instance p1, Ll/byd0;

    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v1, "show_hint_time_"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-wide/16 v1, 0x0

    .line 31
    .line 32
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->h:Ll/byd0;

    .line 40
    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 42
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, -0x1

    .line 43
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 44
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "show_hint_time_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 45
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->h:Ll/byd0;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 46
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0x1

    .line 47
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 48
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "show_hint_time_"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 49
    invoke-virtual {p3}, Ll/wrv;->D0()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->h:Ll/byd0;

    return-void
.end method

.method private E()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->b:Landroid/view/View;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->m:Landroid/animation/Animator;

    .line 17
    .line 18
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->z(J)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->v()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Landroid/util/Pair;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->y(Landroid/util/Pair;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->x(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setRankTextWithAni(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 7

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 8
    .line 9
    if-nez v3, :cond_3

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 15
    .line 16
    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v3, Ljava/lang/CharSequence;

    .line 19
    .line 20
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    if-nez v3, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->B(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Landroid/util/Pair;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 31
    .line 32
    cmp-long v5, v3, v0

    .line 33
    .line 34
    if-eqz v5, :cond_2

    .line 35
    .line 36
    const-wide/16 v5, -0x1

    .line 37
    .line 38
    cmp-long v5, v3, v5

    .line 39
    .line 40
    if-eqz v5, :cond_2

    .line 41
    .line 42
    const-wide/16 v5, 0x64

    .line 43
    .line 44
    cmp-long v3, v3, v5

    .line 45
    .line 46
    if-ltz v3, :cond_1

    .line 47
    .line 48
    cmp-long v3, v0, v5

    .line 49
    .line 50
    if-gez v3, :cond_2

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->C(J)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->A(JLandroid/util/Pair;)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->b:Landroid/view/View;

    .line 60
    .line 61
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 62
    .line 63
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k(J)F

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->s()V

    .line 73
    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 77
    .line 78
    :cond_3
    :goto_0
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 79
    .line 80
    return-void
.end method

.method private synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gil;->P3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final A(JLandroid/util/Pair;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 8
    .line 9
    iget-object p1, p3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->D(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final B(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Landroid/util/Pair;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 4
    .line 5
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setRollAction(Ll/ezs;)V

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/qjl;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/qjl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/rjl;

    .line 19
    .line 20
    invoke-direct {p1, p0, p2, v0}, Ll/rjl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Landroid/util/Pair;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 24
    .line 25
    const-wide/16 v0, 0x1f4

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, p1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final C(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 6
    .line 7
    const-wide/16 v2, 0x190

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setPreAnim(J)V

    .line 16
    .line 17
    .line 18
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->G(Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->p(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setRollAction(Ll/ezs;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 37
    .line 38
    new-instance v2, Ll/pjl;

    .line 39
    .line 40
    invoke-direct {v2, p0, p1, p2}, Ll/pjl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;J)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public F(FF)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->b:Landroid/view/View;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v7, v1, [F

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aput p1, v7, v1

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    aput p2, v7, p1

    .line 16
    .line 17
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    const-wide/16 v4, 0xc8

    .line 22
    .line 23
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l:Landroid/animation/Animator;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final G(Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;Z)V
    .locals 1

    .line 1
    const-string v0, "progress"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;->SHOW:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;->HIDE:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;->OTHER:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 18
    .line 19
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 20
    .line 21
    return-void
.end method

.method public H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->n:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;->SHOW:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->L()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->s()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;->HIDE:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView$BgShowType;

    .line 15
    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->I()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->K()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public I()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 2
    .line 3
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 4
    .line 5
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v7, v1, [F

    .line 10
    .line 11
    fill-array-data v7, :array_0

    .line 12
    .line 13
    .line 14
    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 15
    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    const-wide/16 v4, 0xc8

    .line 19
    .line 20
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->m:Landroid/animation/Animator;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    nop

    .line 31
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public J(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 10
    .line 11
    iget-wide v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 15
    .line 16
    :goto_0
    long-to-int v0, v0

    .line 17
    int-to-long v0, v0

    .line 18
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k(J)F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->F(FF)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public L()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 13
    .line 14
    const-string v2, "progress"

    .line 15
    .line 16
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 29
    .line 30
    const/4 v2, 0x0

    .line 31
    invoke-virtual {v0, v2, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->n(FII)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->o()V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 40
    .line 41
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 42
    .line 43
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 44
    .line 45
    .line 46
    const/4 v0, 0x2

    .line 47
    new-array v10, v0, [F

    .line 48
    .line 49
    fill-array-data v10, :array_0

    .line 50
    .line 51
    .line 52
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 53
    .line 54
    const-wide/16 v5, 0x0

    .line 55
    .line 56
    const-wide/16 v7, 0xc8

    .line 57
    .line 58
    invoke-static/range {v3 .. v10}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->m:Landroid/animation/Animator;

    .line 63
    .line 64
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 68
    .line 69
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 70
    .line 71
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 72
    .line 73
    const/high16 v3, 0x3f800000    # 1.0f

    .line 74
    .line 75
    if-lez v1, :cond_0

    .line 76
    .line 77
    iget-wide v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 78
    .line 79
    long-to-float v0, v4

    .line 80
    mul-float/2addr v0, v3

    .line 81
    int-to-float v1, v1

    .line 82
    div-float v2, v0, v1

    .line 83
    .line 84
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 85
    .line 86
    cmpl-float v0, v2, v3

    .line 87
    .line 88
    if-lez v0, :cond_1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    move v3, v2

    .line 92
    :goto_0
    const/16 v0, 0xc8

    .line 93
    .line 94
    const/16 v1, 0x64

    .line 95
    .line 96
    invoke-virtual {p0, v3, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->n(FII)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 101
    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->m()V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->J(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->E()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->m()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->reset()V

    .line 21
    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 24
    .line 25
    return-void
.end method

.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vjl;->a(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gil;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j(Ll/gil;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public init()V
    .locals 3

    .line 1
    new-instance v0, Ll/ujl;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ujl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 10
    .line 11
    const/4 v1, -0x2

    .line 12
    const/4 v2, -0x1

    .line 13
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    const v1, 0x800013

    .line 17
    .line 18
    .line 19
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setContentLayoutGravity(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->m6:I

    .line 29
    .line 30
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->D(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 38
    .line 39
    const/16 v1, 0x4b0

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->setMarqueeTime(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 45
    .line 46
    const/16 v1, 0x1f4

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->setMarqueeDelayTime(I)V

    .line 49
    .line 50
    .line 51
    const-string v0, "#ff539c"

    .line 52
    .line 53
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    filled-new-array {v1, v0}, [I

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 66
    .line 67
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;->setColors([I)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->c:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardProgressViewNew;

    .line 71
    .line 72
    const/high16 v0, 0x41000000    # 8.0f

    .line 73
    .line 74
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {p0, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public j(Ll/gil;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 2
    .line 3
    return-void
.end method

.method public final k(J)F
    .locals 2

    .line 1
    const-wide/16 v0, 0xb

    cmp-long p0, p1, v0

    if-gez p0, :cond_0

    const-wide/16 v0, 0x0

    cmp-long p0, p1, v0

    if-lez p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Landroid/util/Pair;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 2
    .line 3
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->p(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->h:Ll/byd0;

    .line 10
    .line 11
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    check-cast v4, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 28
    .line 29
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->scrollTexts:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-lez v4, :cond_0

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->scrollTexts:Ljava/util/List;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ljava/lang/String;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->h:Ll/byd0;

    .line 49
    .line 50
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    const-string v4, "sprint"

    .line 63
    .line 64
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    if-eqz v4, :cond_1

    .line 69
    .line 70
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->gap:J

    .line 71
    .line 72
    long-to-int p1, v4

    .line 73
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->q(IJ)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    const-string v4, "start"

    .line 79
    .line 80
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 87
    .line 88
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t6:I

    .line 89
    .line 90
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v1}, Ll/p6s;->s0()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 99
    .line 100
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 101
    .line 102
    int-to-long v4, p1

    .line 103
    invoke-static {v1, v4, v5}, Ll/icr;->a(ZJ)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    goto :goto_0

    .line 116
    :cond_2
    const-string v4, "progress"

    .line 117
    .line 118
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    if-eqz v4, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    goto :goto_0

    .line 129
    :cond_3
    const-string p1, "normal"

    .line 130
    .line 131
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-nez p1, :cond_4

    .line 136
    .line 137
    const-string p1, "unknown_"

    .line 138
    .line 139
    invoke-static {v2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    :cond_4
    iget-wide v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 146
    .line 147
    const-wide/16 v6, 0x0

    .line 148
    .line 149
    cmp-long p1, v4, v6

    .line 150
    .line 151
    if-lez p1, :cond_5

    .line 152
    .line 153
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->n(J)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    goto :goto_0

    .line 158
    :cond_5
    const-string p1, ""

    .line 159
    .line 160
    :goto_0
    invoke-static {v3, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    return-object p0
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->target:I

    .line 6
    .line 7
    int-to-long v2, p0

    .line 8
    cmp-long p1, v0, v2

    .line 9
    .line 10
    if-ltz p1, :cond_0

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->q6:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    long-to-int p1, v0

    .line 20
    invoke-static {p1, p0}, Ll/icr;->d(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public final n(J)Ljava/lang/String;
    .locals 4

    .line 1
    const-wide/16 v0, 0xa

    .line 2
    .line 3
    cmp-long p1, p1, v0

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 8
    .line 9
    cmp-long p2, v2, v0

    .line 10
    .line 11
    if-gtz p2, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 14
    .line 15
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->p6:I

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    if-gtz p1, :cond_1

    .line 23
    .line 24
    iget-wide p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 25
    .line 26
    cmp-long p0, p0, v0

    .line 27
    .line 28
    if-lez p0, :cond_1

    .line 29
    .line 30
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 31
    .line 32
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o6:I

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    const-string p0, ""

    .line 40
    .line 41
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(J)Ljava/lang/String;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-lez p0, :cond_1

    .line 6
    .line 7
    const-wide/16 v0, 0x64

    .line 8
    .line 9
    cmp-long p0, p1, v0

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 15
    .line 16
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->s6:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->o:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0
.end method

.method public final q(IJ)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/p6s;->s0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p1

    .line 10
    invoke-static {p0, v0, v1}, Ll/icr;->a(ZJ)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-wide/16 v0, 0x1

    .line 15
    .line 16
    cmp-long p1, p2, v0

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->n6:I

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const-wide/16 v0, 0xa

    .line 28
    .line 29
    cmp-long p1, p2, v0

    .line 30
    .line 31
    if-gtz p1, :cond_1

    .line 32
    .line 33
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 34
    .line 35
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y6:I

    .line 36
    .line 37
    const/4 p3, 0x1

    .line 38
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    filled-new-array {p3, p0}, [Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_1
    const-wide/16 v0, 0x14

    .line 52
    .line 53
    cmp-long p1, p2, v0

    .line 54
    .line 55
    if-gtz p1, :cond_2

    .line 56
    .line 57
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 58
    .line 59
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->y6:I

    .line 60
    .line 61
    const/16 p3, 0xa

    .line 62
    .line 63
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    filled-new-array {p3, p0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_2
    const-string p0, ""

    .line 77
    .line 78
    return-object p0
.end method

.method public s()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->g:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k(J)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->F(FF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setNewRank(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->setRankTextWithAni(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->t()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 7
    .line 8
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Landroid/util/Pair;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->A(JLandroid/util/Pair;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->b:Landroid/view/View;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 20
    .line 21
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k(J)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 32
    .line 33
    return-void
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const-wide/16 v1, 0x190

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setPreAnim(J)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->G(Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Landroid/util/Pair;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 21
    .line 22
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p1, Ljava/lang/String;

    .line 25
    .line 26
    new-instance v1, Ll/tjl;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/tjl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic x(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->f:Ll/gil;

    .line 16
    .line 17
    const-wide/16 v0, 0x7d0

    .line 18
    .line 19
    invoke-virtual {p0, v0, v1, p1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic y(Landroid/util/Pair;Ljava/lang/Runnable;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 2
    .line 3
    const-wide/16 v1, 0x190

    .line 4
    .line 5
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->setNextAnim(J)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 9
    .line 10
    const/4 v1, 0x5

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->setGap(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->G(Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 23
    .line 24
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ljava/lang/String;

    .line 27
    .line 28
    new-instance v1, Ll/sjl;

    .line 29
    .line 30
    invoke-direct {v1, p0, p2}, Ll/sjl;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;->G(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic z(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 10
    .line 11
    iget-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 12
    .line 13
    cmp-long p1, v1, p1

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->l(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Landroid/util/Pair;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->A(JLandroid/util/Pair;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->b:Landroid/view/View;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->j:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 27
    .line 28
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k(J)F

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->e:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveTextRollView;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/widget/ViewAnimator;->getCurrentView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Ll/icr;->f(Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/entry/HourBoardNewEntryView;->k:Z

    .line 48
    .line 49
    return-void
.end method
