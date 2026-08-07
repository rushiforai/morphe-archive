.class Lcom/tencent/liteav/videoencoder/a$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/videoencoder/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/videoencoder/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a$3;->a:Lcom/tencent/liteav/videoencoder/a;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$3;->a:Lcom/tencent/liteav/videoencoder/a;

    .line 2
    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-static {v0, v1, v2}, Lcom/tencent/liteav/videoencoder/a;->b(Lcom/tencent/liteav/videoencoder/a;J)J

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$3;->a:Lcom/tencent/liteav/videoencoder/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->f(Lcom/tencent/liteav/videoencoder/a;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$3;->a:Lcom/tencent/liteav/videoencoder/a;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->g(Lcom/tencent/liteav/videoencoder/a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a$3;->a:Lcom/tencent/liteav/videoencoder/a;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/tencent/liteav/videoencoder/a;->h(Lcom/tencent/liteav/videoencoder/a;)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method
