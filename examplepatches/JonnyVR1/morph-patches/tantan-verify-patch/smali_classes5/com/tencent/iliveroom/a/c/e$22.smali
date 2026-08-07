.class Lcom/tencent/iliveroom/a/c/e$22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c/e;->a()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c/e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c/e$22;->a:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const-string v0, "TXRoomDelegate"

    .line 2
    .line 3
    const-string v1, "TXRoomDelegate->clean Delegate"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/iliveroom/a/c/e$22;->a:Lcom/tencent/iliveroom/a/c/e;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tencent/iliveroom/a/c/e;->a(Lcom/tencent/iliveroom/a/c/e;)Ljava/util/LinkedList;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ljava/util/LinkedList;->clear()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
