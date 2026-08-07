.class public Ll/ppq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/ppq;->b:Ll/y20;

    .line 5
    .line 6
    :try_start_0
    sget-object p2, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 13
    .line 14
    iput-object p1, p0, Ll/ppq;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    return-void

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ppq;->a:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/y20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ppq;->b:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method
