.class public Ll/bu6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEntranceList;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Lcom/tantanapp/common/data/JsonAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/bu6$a;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ll/bu6$a;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Ll/bu6;->a:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    new-instance v0, Ll/bu6$b;

    .line 15
    .line 16
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 17
    .line 18
    invoke-static {v1}, Lcom/tantanapp/common/data/JsonAdapter;->MAP_ADAPTER(Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-direct {v0, v1}, Ll/bu6$b;-><init>(Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Ll/bu6;->b:Lcom/tantanapp/common/data/JsonAdapter;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
