.class final Le/e/a/FollowFeed$State;
.super Ljava/lang/Object;
.source "FollowFeed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/FollowFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation


# instance fields
.field actorKey:Ljava/lang/String;

.field final actors:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/FollowFeedData$Actor;",
            ">;"
        }
    .end annotation
.end field

.field authorStamp:Ljava/lang/String;

.field authors:Landroid/widget/LinearLayout;

.field busy:Z

.field final chips:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field cursor:Ljava/lang/String;

.field final cursors:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field end:Z

.field failed:Z

.field filter:I

.field final ids:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Le/e/a/FollowFeedData$Item;",
            ">;"
        }
    .end annotation
.end field

.field list:Landroid/widget/ListView;

.field more:Landroid/widget/Button;

.field now:J

.field progress:Landroid/widget/ProgressBar;

.field rows:Le/e/a/FollowFeed$Rows;

.field status:Landroid/widget/TextView;

.field stopped:Z

.field task:Le/e/a/NetworkTask;

.field final visible:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->items:Ljava/util/ArrayList;

    .line 26
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->ids:Ljava/util/HashSet;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->cursors:Ljava/util/HashSet;

    .line 27
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->actors:Ljava/util/LinkedHashMap;

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->visible:Ljava/util/ArrayList;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/FollowFeed$State;->chips:Ljava/util/ArrayList;

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Le/e/a/FollowFeed$State;->filter:I

    .line 24
    return-void
.end method

.method synthetic constructor <init>(Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 24
    invoke-direct {p0}, Le/e/a/FollowFeed$State;-><init>()V

    return-void
.end method
