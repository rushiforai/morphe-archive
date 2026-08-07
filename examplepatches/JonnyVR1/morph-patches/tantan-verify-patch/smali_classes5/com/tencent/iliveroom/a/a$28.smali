.class Lcom/tencent/iliveroom/a/a$28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->startPublishCDNStream(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$28;->b:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a$28;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a$28;->a:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {v0, v1}, Lcom/tencent/iliveroom/a/c/c;->a(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$28;->b:Lcom/tencent/iliveroom/a/a;

    .line 8
    .line 9
    iget-object v1, v0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$28;->a:Ljava/lang/String;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    invoke-static {v0, p0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->H(Lcom/tencent/iliveroom/a/a;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, p0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
