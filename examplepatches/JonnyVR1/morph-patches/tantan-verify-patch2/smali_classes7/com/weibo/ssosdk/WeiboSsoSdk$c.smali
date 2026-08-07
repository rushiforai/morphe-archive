.class Lcom/weibo/ssosdk/WeiboSsoSdk$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/weibo/ssosdk/WeiboSsoSdk;->m(Lcom/weibo/ssosdk/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/weibo/ssosdk/a;

.field final synthetic b:Lcom/weibo/ssosdk/WeiboSsoSdk;


# direct methods
.method public constructor <init>(Lcom/weibo/ssosdk/WeiboSsoSdk;Lcom/weibo/ssosdk/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->b:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->a:Lcom/weibo/ssosdk/a;

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
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->b:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-static {v0, v1, v2}, Lcom/weibo/ssosdk/WeiboSsoSdk;->d(Lcom/weibo/ssosdk/WeiboSsoSdk;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->b:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->b:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 18
    .line 19
    new-instance v1, Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 20
    .line 21
    invoke-direct {v1}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Lcom/weibo/ssosdk/WeiboSsoSdk;->b(Lcom/weibo/ssosdk/WeiboSsoSdk;Lcom/weibo/ssosdk/WeiboSsoSdk$d;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->a:Lcom/weibo/ssosdk/a;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$c;->b:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {v0, p0}, Lcom/weibo/ssosdk/a;->handler(Lcom/weibo/ssosdk/WeiboSsoSdk$d;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
