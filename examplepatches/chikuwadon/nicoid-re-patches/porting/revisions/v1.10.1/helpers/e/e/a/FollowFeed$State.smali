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

.field autoLoad:Z

.field busy:Z

.field current:Le/e/a/FollowFeed$State;

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

.field initialized:Z

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

.field message:Ljava/lang/CharSequence;

.field more:Landroid/widget/Button;

.field now:J

.field pages:[Le/e/a/FollowFeed$State;

.field progress:Landroid/widget/ProgressBar;

.field refresh:Le/e/a/FeedRefresh209;

.field rows:Le/e/a/FollowFeed$Rows;

.field scroll:Landroid/os/Parcelable;

.field session:Le/e/a/FollowFeed$State;

.field status:Landroid/widget/TextView;

.field stopped:Z

.field swipe:Le/e/a/Ui110$Swipe;

.field tabs:Le/e/a/Ui110$Tabs;

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

    .line 31
    const/4 v0, 0x0

    iput v0, p0, Le/e/a/FollowFeed$State;->filter:I

    .line 34
    const-string v0, ""

    iput-object v0, p0, Le/e/a/FollowFeed$State;->message:Ljava/lang/CharSequence;

    .line 35
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/FollowFeed$State;->autoLoad:Z

    .line 24
    return-void
.end method

.method synthetic constructor <init>(Le/e/a/FollowFeed$State;)V
    .registers 2

    .line 24
    invoke-direct {p0}, Le/e/a/FollowFeed$State;-><init>()V

    return-void
.end method


# virtual methods
.method active()Z
    .registers 2

    .line 36
    iget-object v0, p0, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    if-eqz v0, :cond_c

    iget-object v0, p0, Le/e/a/FollowFeed$State;->session:Le/e/a/FollowFeed$State;

    iget-object v0, v0, Le/e/a/FollowFeed$State;->current:Le/e/a/FollowFeed$State;

    if-eq v0, p0, :cond_c

    const/4 v0, 0x0

    return v0

    :cond_c
    const/4 v0, 0x1

    return v0
.end method
