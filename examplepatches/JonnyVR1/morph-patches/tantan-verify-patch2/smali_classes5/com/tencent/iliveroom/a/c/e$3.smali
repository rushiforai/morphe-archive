.class Lcom/tencent/iliveroom/a/c/e$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c/e;->onQuitRoomFailed(Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:I

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Lcom/tencent/iliveroom/a/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c/e;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c/e$3;->d:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/c/e$3;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/iliveroom/a/c/e$3;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/iliveroom/a/c/e$3;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c/e$3;->d:Lcom/tencent/iliveroom/a/c/e;

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
    iget-object v2, p0, Lcom/tencent/iliveroom/a/c/e$3;->a:Ljava/lang/String;

    .line 26
    .line 27
    iget v3, p0, Lcom/tencent/iliveroom/a/c/e$3;->b:I

    .line 28
    .line 29
    iget-object v4, p0, Lcom/tencent/iliveroom/a/c/e$3;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3, v4}, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;->onQuitRoomFailed(Ljava/lang/String;ILjava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void
.end method
