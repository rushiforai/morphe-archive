.class final Le/e/a/WatchRequestHeaders;
.super Ljava/lang/Object;
.source "WatchRequestHeaders.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static apply(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .registers 4

    .line 7
    const-string v0, "https://www.nicovideo.jp/watch/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    .line 8
    const-string v0, "https://www.nicovideo.jp/api/watch/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_12

    .line 7
    const/4 p1, 0x0

    goto :goto_13

    :cond_12
    const/4 p1, 0x1

    .line 9
    :goto_13
    if-eqz p1, :cond_18

    const-string v0, "*/*"

    goto :goto_1a

    :cond_18
    const-string v0, "application/json"

    :goto_1a
    const-string v1, "Accept"

    invoke-virtual {p0, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    if-eqz p1, :cond_2f

    .line 11
    const-string p1, "User-Agent"

    const-string v0, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    const-string p1, "Referer"

    const-string v0, "https://www.nicovideo.jp/"

    invoke-virtual {p0, p1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    :cond_2f
    return-void
.end method
