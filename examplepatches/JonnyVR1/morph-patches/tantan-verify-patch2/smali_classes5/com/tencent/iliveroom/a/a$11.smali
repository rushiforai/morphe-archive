.class Lcom/tencent/iliveroom/a/a$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->setRemoteVideoStreamType(Ljava/lang/String;I)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;ILjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$11;->c:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$11;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/iliveroom/a/a$11;->b:Ljava/lang/String;

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
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/iliveroom/a/a$11;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$11;->c:Lcom/tencent/iliveroom/a/a;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$11;->b:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {v1, p0, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$11;->b:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-static {v1, p0, v0}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    return-void
.end method
