.class Lcom/immomo/mmdns/WebDNSHandler$MyHostnameVerifier;
.super Lorg/apache/http/conn/ssl/AbstractVerifier;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/mmdns/WebDNSHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MyHostnameVerifier"
.end annotation


# instance fields
.field private originHost:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/apache/http/conn/ssl/AbstractVerifier;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/mmdns/WebDNSHandler$MyHostnameVerifier;->originHost:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/net/ssl/SSLException;
        }
    .end annotation

    .line 1
    const-string v0, "MMDNS"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/immomo/mmdns/WebDNSHandler$MyHostnameVerifier;->originHost:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/immomo/mmdns/WebDNSHandler$MyHostnameVerifier;->originHost:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v1, p2, p3, v2}, Lorg/apache/http/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v2}, Lorg/apache/http/conn/ssl/AbstractVerifier;->verify(Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    :goto_0
    const-string v1, "WebDNSHandler ip %s -> host %s"

    .line 24
    .line 25
    iget-object p0, p0, Lcom/immomo/mmdns/WebDNSHandler$MyHostnameVerifier;->originHost:Ljava/lang/String;

    .line 26
    .line 27
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, v1, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljavax/net/ssl/SSLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_1
    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {p3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const-string p2, "WebDNSHandler host=%s, cns=%s, subjectAlts=%s"

    .line 48
    .line 49
    invoke-static {v0, p0, p2, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    .line 51
    .line 52
    throw p0
.end method
