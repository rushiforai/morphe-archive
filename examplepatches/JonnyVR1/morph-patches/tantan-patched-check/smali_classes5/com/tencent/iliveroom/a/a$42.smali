.class Lcom/tencent/iliveroom/a/a$42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->onAVMemberExit(JLjava/lang/String;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:J

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$42;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$42;->a:J

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/tencent/iliveroom/a/a$42;->b:J

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
    .locals 5

    .line 1
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$42;->a:J

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/tencent/iliveroom/a/a$42;->b:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/tencent/iliveroom/a/b/a;->b(JJ)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$42;->c:Lcom/tencent/iliveroom/a/a;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 15
    .line 16
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a$42;->a:J

    .line 17
    .line 18
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
