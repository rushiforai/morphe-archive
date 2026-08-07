.class final Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pxd0$a;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "WatchedDurationData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/pxd0$a<",
        "Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private treeMap:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/TreeMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/TreeMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/TreeMap;Ll/wdv;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;-><init>(Ljava/util/TreeMap;)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;)Ljava/util/TreeMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    return-object p0
.end method


# virtual methods
.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/TreeMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public trimAndCopy()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-static {v0, v1, v2}, Ll/d3t;->d(Ljava/util/Map;IZ)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->treeMap:Ljava/util/TreeMap;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;-><init>(Ljava/util/TreeMap;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public bridge synthetic trimAndCopy()Ljava/lang/Object;
    .locals 0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->trimAndCopy()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    move-result-object p0

    return-object p0
.end method
