.class Lcom/tencent/iliveroom/a/c/e$19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c/e;->onStopPublishCDNStream(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/tencent/iliveroom/a/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c/e;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c/e$19;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/c/e$19;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/c/e$19;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c/e$19;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/c/e;->a(Lcom/tencent/iliveroom/a/c/e;)Ljava/util/LinkedList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget v2, p0, Lcom/tencent/iliveroom/a/c/e$19;->a:I

    .line 26
    .line 27
    iget-object v3, p0, Lcom/tencent/iliveroom/a/c/e$19;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;->onStopPublishCDNStream(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    return-void
.end method
