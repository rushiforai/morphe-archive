.class Lcom/tencent/iliveroom/a/a$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->muteRemoteVideo(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;JZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$7;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a$7;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Lcom/tencent/iliveroom/a/a$7;->b:Z

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
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$7;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a$7;->a:J

    .line 9
    .line 10
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-boolean p0, p0, Lcom/tencent/iliveroom/a/a$7;->b:Z

    .line 23
    .line 24
    invoke-static {v0, v1, p0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
