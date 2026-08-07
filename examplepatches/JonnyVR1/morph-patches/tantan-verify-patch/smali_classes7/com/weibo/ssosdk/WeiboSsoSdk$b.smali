.class Lcom/weibo/ssosdk/WeiboSsoSdk$b;
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
    iput-object p1, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

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
    const-wide/32 v0, 0xea60

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->e(Lcom/weibo/ssosdk/WeiboSsoSdk;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->a(Lcom/weibo/ssosdk/WeiboSsoSdk;)Lcom/weibo/ssosdk/WeiboSsoSdk$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk$d;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 52
    .line 53
    invoke-static {v0}, Lcom/weibo/ssosdk/WeiboSsoSdk;->c(Lcom/weibo/ssosdk/WeiboSsoSdk;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    :goto_0
    iget-object p0, p0, Lcom/weibo/ssosdk/WeiboSsoSdk$b;->a:Lcom/weibo/ssosdk/WeiboSsoSdk;

    .line 58
    .line 59
    const/4 v1, 0x2

    .line 60
    invoke-static {p0, v0, v1}, Lcom/weibo/ssosdk/WeiboSsoSdk;->d(Lcom/weibo/ssosdk/WeiboSsoSdk;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    :catch_0
    :goto_1
    return-void
.end method
