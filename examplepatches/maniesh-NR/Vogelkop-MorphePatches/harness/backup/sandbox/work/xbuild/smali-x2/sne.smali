.class public final Lsne;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:[Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public final d:[Lrma;

.field public final e:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lsne;->c:Ljava/lang/String;

    iput-object p2, p0, Lsne;->a:Landroid/content/Context;

    const-string p2, "\n"

    invoke-virtual {p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lsne;->b:[Ljava/lang/String;

    array-length p1, p1

    new-array p2, p1, [Lrma;

    iput-object p2, p0, Lsne;->d:[Lrma;

    new-array p1, p1, [Ljava/lang/String;

    iput-object p1, p0, Lsne;->e:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;ILjava/lang/String;Z)V
    .registers 8

    const-string v0, "probe:/send_result/"

    :try_start_2
    new-instance v1, Ljava/net/URI;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "X-Connection-Type"

    sget-object v2, Llcp;->r:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "X-Signal-Quality"

    sget v2, Llcp;->q:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "X-DNS-Resolver-IP"

    iget-object p0, p0, Lsne;->c:Ljava/lang/String;

    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "X-Test-Type"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "X-Probe-Failure"

    if-eqz p4, :cond_49

    const-string p2, "1"

    goto :goto_4b

    :cond_49
    const-string p2, "0"

    :goto_4b
    invoke-virtual {p1, p0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lg77;

    invoke-direct {p0, v1, p1, p3}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_53
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_53} :catch_5e

    :try_start_53
    new-instance p1, Lcom/opera/android/browser/obml/MiniHttpClient$Call;

    sget-object p2, Lhzd;->b:Lhzd;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p3, 0x0

    invoke-direct {p1, p2, p0, p3}, Lcom/opera/android/browser/obml/MiniHttpClient$Call;-><init>(Lhzd;Lg77;Lpp6;)V
    :try_end_5e
    .catchall {:try_start_53 .. :try_end_5e} :catchall_5e

    :catch_5e
    :catchall_5e
    return-void
.end method

.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, [Ljava/lang/Void;

    const-string p1, "p"

    :try_start_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    const-wide/32 v3, 0x10001

    rem-long/2addr v1, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, ".dnsecho.opera.com"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lsne;->c:Ljava/lang/String;
    :try_end_27
    .catch Ljava/net/UnknownHostException; {:try_start_4 .. :try_end_27} :catch_27

    :catch_27
    const/4 p1, 0x0

    move v0, p1

    :goto_29
    iget-object v1, p0, Lsne;->d:[Lrma;

    array-length v2, v1

    if-ge v0, v2, :cond_6a

    :try_start_2e
    iget-object v2, p0, Lsne;->b:[Ljava/lang/String;

    aget-object v2, v2, v0

    iget-object v3, p0, Lsne;->a:Landroid/content/Context;

    invoke-static {v3, v2}, Lrma;->h(Landroid/content/Context;Ljava/lang/String;)Lrma;

    move-result-object v2

    aput-object v2, v1, v0
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_3a} :catch_53

    move v1, p1

    :goto_3b
    :try_start_3b
    iget-object v3, v2, Lrma;->d:Ljava/lang/Object;

    check-cast v3, [I

    array-length v4, v3

    if-ge v1, v4, :cond_5c

    invoke-virtual {v2}, Lrma;->s()I

    move-result v4

    aput v4, v3, v1
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_48} :catch_4b

    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    :catch_4b
    move-exception v1

    :try_start_4c
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lrma;->e:Ljava/lang/Object;
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_52} :catch_53

    goto :goto_5c

    :catch_53
    move-exception v1

    iget-object v2, p0, Lsne;->e:[Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    :cond_5c
    :goto_5c
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_29

    :cond_6a
    const/4 p0, 0x0

    return-object p0
.end method

.method public final onProgressUpdate([Ljava/lang/Object;)V
    .registers 12

    check-cast p1, [Ljava/lang/Integer;

    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v0, :cond_6c

    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lsne;->d:[Lrma;

    aget-object v4, v4, v3

    const/4 v5, 0x1

    if-eqz v4, :cond_47

    iget v3, v4, Lrma;->b:I

    iget-object v6, v4, Lrma;->f:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v7, v4, Lrma;->e:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    if-nez v7, :cond_21

    move v5, v1

    :cond_21
    iget-object v4, v4, Lrma;->d:Ljava/lang/Object;

    check-cast v4, [I

    if-nez v7, :cond_43

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move v8, v1

    :goto_2d
    array-length v9, v4

    if-ge v8, v9, :cond_3f

    if-lez v8, :cond_37

    const/16 v9, 0x2c

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_37
    aget v9, v4, v8

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v8, v8, 0x1

    goto :goto_2d

    :cond_3f
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :cond_43
    invoke-virtual {p0, v6, v3, v7, v5}, Lsne;->a(Ljava/lang/String;ILjava/lang/String;Z)V

    goto :goto_69

    :cond_47
    iget-object v4, p0, Lsne;->b:[Ljava/lang/String;

    aget-object v4, v4, v3

    iget-object v6, p0, Lsne;->e:[Ljava/lang/String;

    aget-object v3, v6, v3

    const-string v6, "#"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_69

    :try_start_57
    const-string v6, ";"

    invoke-virtual {v4, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x3

    aget-object v6, v4, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    aget-object v4, v4, v1
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_66} :catch_69

    invoke-virtual {p0, v4, v6, v3, v5}, Lsne;->a(Ljava/lang/String;ILjava/lang/String;Z)V

    :catch_69
    :cond_69
    :goto_69
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_6c
    return-void
.end method
