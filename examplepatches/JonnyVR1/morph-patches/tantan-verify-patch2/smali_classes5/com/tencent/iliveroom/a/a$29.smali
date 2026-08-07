.class Lcom/tencent/iliveroom/a/a$29;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->stopPublishCDNStream()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$29;->a:Lcom/tencent/iliveroom/a/a;

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
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/c/c;->a(ZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$29;->a:Lcom/tencent/iliveroom/a/a;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$29;->a:Lcom/tencent/iliveroom/a/a;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->I(Lcom/tencent/iliveroom/a/a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
