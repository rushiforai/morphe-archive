.class Lcom/tencent/iliveroom/a/c/e$17;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/c/e;->onStreamMessageError(Ljava/lang/String;JIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:J

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:Lcom/tencent/iliveroom/a/c/e;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/c/e;Ljava/lang/String;JIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/c/e$17;->f:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/c/e$17;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/iliveroom/a/c/e$17;->b:J

    .line 6
    .line 7
    iput p5, p0, Lcom/tencent/iliveroom/a/c/e$17;->c:I

    .line 8
    .line 9
    iput p6, p0, Lcom/tencent/iliveroom/a/c/e$17;->d:I

    .line 10
    .line 11
    iput p7, p0, Lcom/tencent/iliveroom/a/c/e$17;->e:I

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/c/e$17;->f:Lcom/tencent/iliveroom/a/c/e;

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
    move-object v2, v1

    .line 22
    check-cast v2, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    iget-object v3, p0, Lcom/tencent/iliveroom/a/c/e$17;->a:Ljava/lang/String;

    .line 27
    .line 28
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/c/e$17;->b:J

    .line 29
    .line 30
    iget v6, p0, Lcom/tencent/iliveroom/a/c/e$17;->c:I

    .line 31
    .line 32
    iget v7, p0, Lcom/tencent/iliveroom/a/c/e$17;->d:I

    .line 33
    .line 34
    iget v8, p0, Lcom/tencent/iliveroom/a/c/e$17;->e:I

    .line 35
    .line 36
    invoke-virtual/range {v2 .. v8}, Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;->onStreamMessageError(Ljava/lang/String;JIII)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return-void
.end method
