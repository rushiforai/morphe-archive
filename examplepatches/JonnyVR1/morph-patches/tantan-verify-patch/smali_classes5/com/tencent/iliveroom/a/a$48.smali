.class Lcom/tencent/iliveroom/a/a$48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
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
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$48;->a:Lcom/tencent/iliveroom/a/a;

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
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$48;->a:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/iliveroom/a/a/e;

    .line 4
    .line 5
    invoke-direct {v0}, Lcom/tencent/iliveroom/a/a/e;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/a/a/e;)Lcom/tencent/iliveroom/a/a/e;

    .line 9
    .line 10
    .line 11
    const-string p0, "TRTCAdapter-ext"

    .line 12
    .line 13
    const-string v0, "sendCustomVideoTexture: video combiner create in gl thread."

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
