.class Lcom/weibo/ssosdk/WeiboSsoSdk$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/weibo/ssosdk/WeiboSsoSdk;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/weibo/ssosdk/WeiboSsoSdk;


# direct methods
.method public constructor <init>(Lcom/weibo/ssosdk/WeiboSsoSdk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$a;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

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
    :catch_0
    :goto_0
    const-wide/32 v0, 0x5265c00

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$a;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$a;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$a;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$a;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->c(Lcom/weibo/ssosdk/WeiboSsoSdk;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    :goto_1
    invoke-static {}, Lcom/weibo/ssosdk/WeiboSsoSdk;->i()Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x2

    .line 53
    invoke-static {v1, v0, v2}, Lcom/weibo/ssosdk/WeiboSsoSdk;->d(Lcom/weibo/ssosdk/WeiboSsoSdk;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    goto :goto_0
.end method
