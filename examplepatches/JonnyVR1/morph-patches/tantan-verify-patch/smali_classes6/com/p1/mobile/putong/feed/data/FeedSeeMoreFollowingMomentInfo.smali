.class public Lcom/p1/mobile/putong/feed/data/FeedSeeMoreFollowingMomentInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ACTION_EXPAND_MORE:I = 0x1

.field public static final ACTION_INVALID:I = -0x1

.field public static final ACTION_JUMP_TO_FOLLOW:I = 0x2

.field public static final ACTION_SHOW_DEADLINE:I = 0x3


# instance fields
.field public action:I

.field public followingMoments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public unReadfollowingFeeds:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
