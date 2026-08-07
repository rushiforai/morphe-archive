.class public final Ll/oug0;
.super Ll/ksp0;
.source "SourceFile"


# instance fields
.field public final a:Ll/cgg0;

.field public final b:Ll/nzg0;

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public g:Z

.field public h:Z

.field public i:Ll/asg0;

.field public j:Ll/mog0;

.field public final synthetic k:Ll/uwg0;


# direct methods
.method public constructor <init>(Ll/uwg0;Ll/cgg0;Ll/nzg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ksp0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x3e80

    .line 7
    .line 8
    iput p1, p0, Ll/oug0;->c:I

    .line 9
    .line 10
    const/16 p1, 0x10

    .line 11
    .line 12
    iput p1, p0, Ll/oug0;->d:I

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput p1, p0, Ll/oug0;->e:I

    .line 16
    .line 17
    const/16 p1, 0x1900

    .line 18
    .line 19
    iput p1, p0, Ll/oug0;->f:I

    .line 20
    .line 21
    iput-object p2, p0, Ll/oug0;->a:Ll/cgg0;

    .line 22
    .line 23
    iput-object p3, p0, Ll/oug0;->b:Ll/nzg0;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final a(Ll/hsp0;ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ksp0;->a(Ll/hsp0;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "===> onClosed\uff1a code:"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " reason:"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v2, "DoubaoAsrAsyncClient"

    .line 27
    .line 28
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 32
    .line 33
    iget-object p1, p1, Ll/uwg0;->a:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-static {p1, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    new-instance p1, Ll/gtg0;

    .line 57
    .line 58
    invoke-direct {p1, p0}, Ll/gtg0;-><init>(Ll/oug0;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final b(Ll/hsp0;ILjava/lang/String;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ksp0;->b(Ll/hsp0;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1, p2, p3}, Ll/hsp0;->close(ILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "===> onClosing\uff1a code:"

    .line 10
    .line 11
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, " reason:"

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v2, "DoubaoAsrAsyncClient"

    .line 30
    .line 31
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 35
    .line 36
    iget-object p0, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 37
    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final c(Ll/hsp0;Ljava/lang/Throwable;Ll/i5d0;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/ksp0;->c(Ll/hsp0;Ljava/lang/Throwable;Ll/i5d0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "===> onFailure\uff1a Throwable:"

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v1, " Response:"

    .line 19
    .line 20
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "null"

    .line 24
    .line 25
    if-nez p3, :cond_0

    .line 26
    .line 27
    move-object v3, v2

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    invoke-virtual {p3}, Ll/i5d0;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    :goto_0
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v3, "DoubaoAsrAsyncClient"

    .line 41
    .line 42
    invoke-static {v3, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 46
    .line 47
    iget-object p1, p1, Ll/uwg0;->a:Ljava/lang/String;

    .line 48
    .line 49
    new-instance v3, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    if-nez p3, :cond_1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_1
    invoke-virtual {p3}, Ll/i5d0;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-static {p1, p3}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ll/itg0;

    .line 82
    .line 83
    invoke-direct {p1, p0, p2}, Ll/itg0;-><init>(Ll/oug0;Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final e(Ll/hsp0;Lokio/ByteString;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/uwg0;->m:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f(Ll/hsp0;Ll/i5d0;)V
    .locals 3

    .line 1
    const-string v0, "X-Tt-Logid"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "===> onOpen,X-Tt-Logid:"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v2, "DoubaoAsrAsyncClient"

    .line 22
    .line 23
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 27
    .line 28
    iget-object v0, v0, Ll/uwg0;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {v0, p2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance p2, Ll/htg0;

    .line 46
    .line 47
    invoke-direct {p2, p0}, Ll/htg0;-><init>(Ll/oug0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {p2}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Ll/oug0;->i:Ll/asg0;

    .line 54
    .line 55
    if-nez p2, :cond_0

    .line 56
    .line 57
    new-instance p2, Ll/asg0;

    .line 58
    .line 59
    invoke-direct {p2, p0, p1}, Ll/asg0;-><init>(Ll/oug0;Ll/hsp0;)V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Ll/oug0;->i:Ll/asg0;

    .line 63
    .line 64
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 65
    .line 66
    .line 67
    :cond_0
    iget-object p1, p0, Ll/oug0;->j:Ll/mog0;

    .line 68
    .line 69
    if-nez p1, :cond_1

    .line 70
    .line 71
    new-instance p1, Ll/mog0;

    .line 72
    .line 73
    invoke-direct {p1, p0}, Ll/mog0;-><init>(Ll/oug0;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Ll/oug0;->j:Ll/mog0;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uwg0;->j()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/oug0;->b:Ll/nzg0;

    .line 7
    .line 8
    invoke-interface {p0}, Ll/nzg0;->b()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic h(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/oug0;->b:Ll/nzg0;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/nzg0;->c(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final i(Ll/hsp0;)V
    .locals 10

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/oug0;->a:Ll/cgg0;

    .line 7
    .line 8
    iget-object v1, v1, Ll/cgg0;->e:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "uid"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    new-instance v1, Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "format"

    .line 21
    .line 22
    const-string v3, "pcm"

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v2, "codec"

    .line 28
    .line 29
    const-string v3, "raw"

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/oug0;->c:I

    .line 35
    .line 36
    const-string v3, "rate"

    .line 37
    .line 38
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    iget v2, p0, Ll/oug0;->d:I

    .line 42
    .line 43
    const-string v3, "bits"

    .line 44
    .line 45
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    iget v2, p0, Ll/oug0;->e:I

    .line 49
    .line 50
    const-string v3, "channel"

    .line 51
    .line 52
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Ll/oug0;->a:Ll/cgg0;

    .line 56
    .line 57
    iget-object v2, v2, Ll/cgg0;->g:Ljava/lang/String;

    .line 58
    .line 59
    const-string v3, "language"

    .line 60
    .line 61
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/oug0;->a:Ll/cgg0;

    .line 65
    .line 66
    iget-object v2, v2, Ll/cgg0;->k:Lorg/json/JSONObject;

    .line 67
    .line 68
    const/4 v3, 0x1

    .line 69
    if-nez v2, :cond_0

    .line 70
    .line 71
    new-instance v2, Lorg/json/JSONObject;

    .line 72
    .line 73
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Ll/oug0;->a:Ll/cgg0;

    .line 77
    .line 78
    iget-object v4, v4, Ll/cgg0;->h:Ljava/lang/String;

    .line 79
    .line 80
    const-string v5, "model_name"

    .line 81
    .line 82
    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 83
    .line 84
    .line 85
    const-string v4, "enable_punc"

    .line 86
    .line 87
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 88
    .line 89
    .line 90
    const-string v4, "enable_itn"

    .line 91
    .line 92
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 93
    .line 94
    .line 95
    const-string v4, "enable_nonstream"

    .line 96
    .line 97
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    const-string v4, "end_window_size"

    .line 101
    .line 102
    const/16 v5, 0xc8

    .line 103
    .line 104
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 105
    .line 106
    .line 107
    const-string v4, "force_to_speech_time"

    .line 108
    .line 109
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 110
    .line 111
    .line 112
    const-string v4, "result_type"

    .line 113
    .line 114
    const-string v5, "single"

    .line 115
    .line 116
    invoke-virtual {v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 117
    .line 118
    .line 119
    :cond_0
    new-instance v4, Lorg/json/JSONObject;

    .line 120
    .line 121
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 122
    .line 123
    .line 124
    const-string v5, "user"

    .line 125
    .line 126
    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    .line 128
    .line 129
    const-string v0, "audio"

    .line 130
    .line 131
    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    .line 133
    .line 134
    const-string v0, "request"

    .line 135
    .line 136
    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iget-object v1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 144
    .line 145
    iget-object v1, v1, Ll/uwg0;->a:Ljava/lang/String;

    .line 146
    .line 147
    new-instance v2, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    const-string v4, "\u53d1\u9001\u5b8c\u6574\u5ba2\u6237\u7aef\u8bf7\u6c42: "

    .line 150
    .line 151
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v1, v2}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    const-string v2, "DoubaoAsrAsyncClient"

    .line 177
    .line 178
    invoke-static {v2, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    array-length v1, v0

    .line 186
    invoke-static {v0, v1}, Ll/uwg0;->i([BI)[B

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    const/4 v1, 0x4

    .line 191
    new-array v4, v1, [B

    .line 192
    .line 193
    fill-array-data v4, :array_0

    .line 194
    .line 195
    .line 196
    array-length v5, v0

    .line 197
    invoke-static {v5}, Ll/uwg0;->h(I)[B

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-static {v3}, Ll/uwg0;->h(I)[B

    .line 202
    .line 203
    .line 204
    move-result-object v6

    .line 205
    array-length v7, v0

    .line 206
    const/16 v8, 0xc

    .line 207
    .line 208
    add-int/2addr v7, v8

    .line 209
    new-array v7, v7, [B

    .line 210
    .line 211
    const/4 v9, 0x0

    .line 212
    invoke-static {v4, v9, v7, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 213
    .line 214
    .line 215
    invoke-static {v6, v9, v7, v1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 216
    .line 217
    .line 218
    const/16 v4, 0x8

    .line 219
    .line 220
    invoke-static {v5, v9, v7, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 221
    .line 222
    .line 223
    array-length v1, v0

    .line 224
    invoke-static {v0, v9, v7, v8, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 225
    .line 226
    .line 227
    invoke-static {v7}, Lokio/ByteString;->of([B)Lokio/ByteString;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    invoke-interface {p1, v0}, Ll/hsp0;->c(Lokio/ByteString;)Z

    .line 232
    .line 233
    .line 234
    move v0, v3

    .line 235
    :goto_0
    iget-object v1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 236
    .line 237
    iget-boolean v4, v1, Ll/uwg0;->b:Z

    .line 238
    .line 239
    if-eqz v4, :cond_5

    .line 240
    .line 241
    iget-boolean v4, p0, Ll/oug0;->h:Z

    .line 242
    .line 243
    if-eqz v4, :cond_1

    .line 244
    .line 245
    iget-object p1, v1, Ll/uwg0;->a:Ljava/lang/String;

    .line 246
    .line 247
    const-string v0, "\u5df2\u7ecf\u53d1\u4e86\u6700\u540e\u4e00\u4e2a\u5305\uff0c\u4e0d\u518d\u53d1\u9001\u6570\u636e\u5305"

    .line 248
    .line 249
    invoke-static {p1, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 253
    .line 254
    .line 255
    new-instance p1, Ll/jtg0;

    .line 256
    .line 257
    invoke-direct {p1, p0}, Ll/jtg0;-><init>(Ll/oug0;)V

    .line 258
    .line 259
    .line 260
    invoke-static {p1}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_1
    iget-boolean v4, p0, Ll/oug0;->g:Z

    .line 265
    .line 266
    if-eqz v4, :cond_2

    .line 267
    .line 268
    iget-object v1, v1, Ll/uwg0;->a:Ljava/lang/String;

    .line 269
    .line 270
    const-string v4, "\u7ed9\u540e\u7aef\u53d1\u9001\u6700\u540e\u4e00\u4e2a\u6570\u636e\u5305"

    .line 271
    .line 272
    invoke-static {v1, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-static {v2, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 276
    .line 277
    .line 278
    add-int/2addr v0, v3

    .line 279
    iget v1, p0, Ll/oug0;->f:I

    .line 280
    .line 281
    new-array v1, v1, [B

    .line 282
    .line 283
    neg-int v0, v0

    .line 284
    invoke-virtual {p0, p1, v1, v3, v0}, Ll/oug0;->j(Ll/hsp0;[BZI)V

    .line 285
    .line 286
    .line 287
    iput-boolean v3, p0, Ll/oug0;->h:Z

    .line 288
    .line 289
    return-void

    .line 290
    :cond_2
    iget-object v1, p0, Ll/oug0;->a:Ll/cgg0;

    .line 291
    .line 292
    iget-object v1, v1, Ll/cgg0;->f:Ll/pkg0;

    .line 293
    .line 294
    iget v4, p0, Ll/oug0;->f:I

    .line 295
    .line 296
    new-array v5, v4, [B

    .line 297
    .line 298
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 299
    .line 300
    .line 301
    move v6, v9

    .line 302
    :goto_1
    if-ge v6, v4, :cond_3

    .line 303
    .line 304
    :try_start_0
    iget-object v7, v1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 305
    .line 306
    invoke-virtual {v7, v5, v6}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->takeBuffer([BI)I

    .line 307
    .line 308
    .line 309
    move-result v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 310
    add-int/2addr v6, v7

    .line 311
    goto :goto_1

    .line 312
    :catch_0
    :cond_3
    if-gtz v6, :cond_4

    .line 313
    .line 314
    iget-object v1, p0, Ll/oug0;->k:Ll/uwg0;

    .line 315
    .line 316
    iget-object v1, v1, Ll/uwg0;->a:Ljava/lang/String;

    .line 317
    .line 318
    const-string v4, "===>read len <= 0,exit"

    .line 319
    .line 320
    invoke-static {v1, v4}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    invoke-static {v2, v4}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 324
    .line 325
    .line 326
    goto :goto_0

    .line 327
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 328
    .line 329
    invoke-virtual {p0, p1, v5, v9, v0}, Ll/oug0;->j(Ll/hsp0;[BZI)V

    .line 330
    .line 331
    .line 332
    goto :goto_0

    .line 333
    :cond_5
    return-void

    .line 334
    nop

    .line 335
    :array_0
    .array-data 1
        0x11t
        0x11t
        0x11t
        0x0t
    .end array-data
.end method

.method public final j(Ll/hsp0;[BZI)V
    .locals 5

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x3

    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    move p3, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move p3, p0

    .line 8
    :goto_0
    or-int/lit8 p3, p3, 0x20

    .line 9
    .line 10
    int-to-byte p3, p3

    .line 11
    const/4 v1, 0x4

    .line 12
    new-array v2, v1, [B

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/16 v4, 0x11

    .line 16
    .line 17
    aput-byte v4, v2, v3

    .line 18
    .line 19
    aput-byte p3, v2, p0

    .line 20
    .line 21
    const/4 p0, 0x2

    .line 22
    aput-byte v4, v2, p0

    .line 23
    .line 24
    aput-byte v3, v2, v0

    .line 25
    .line 26
    invoke-static {p4}, Ll/uwg0;->h(I)[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    array-length p3, p2

    .line 31
    invoke-static {p2, p3}, Ll/uwg0;->i([BI)[B

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    array-length p3, p2

    .line 36
    invoke-static {p3}, Ll/uwg0;->h(I)[B

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    array-length p4, p2

    .line 41
    const/16 v0, 0xc

    .line 42
    .line 43
    add-int/2addr p4, v0

    .line 44
    new-array p4, p4, [B

    .line 45
    .line 46
    invoke-static {v2, v3, p4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 47
    .line 48
    .line 49
    invoke-static {p0, v3, p4, v1, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    .line 51
    .line 52
    const/16 p0, 0x8

    .line 53
    .line 54
    invoke-static {p3, v3, p4, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    array-length p0, p2

    .line 58
    invoke-static {p2, v3, p4, v0, p0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    .line 60
    .line 61
    invoke-static {p4}, Lokio/ByteString;->of([B)Lokio/ByteString;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p1, p0}, Ll/hsp0;->c(Lokio/ByteString;)Z

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final synthetic k()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final l()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/oug0;->k:Ll/uwg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/uwg0;->j()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltech/sud/gip/asr/base/Sudint;

    .line 7
    .line 8
    iget-wide v2, v0, Ll/uwg0;->i:J

    .line 9
    .line 10
    iget-object v4, v0, Ll/uwg0;->k:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, v0, Ll/uwg0;->j:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v6, v0, Ll/uwg0;->g:Ltech/sud/gip/asr/base/Sudnew;

    .line 15
    .line 16
    invoke-direct/range {v1 .. v6}, Ltech/sud/gip/asr/base/Sudint;-><init>(JLjava/lang/String;Ljava/lang/String;Ltech/sud/gip/asr/base/Sudnew;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, v0, Ll/uwg0;->h:Ltech/sud/gip/asr/base/Sudint;

    .line 20
    .line 21
    monitor-enter v1

    .line 22
    :try_start_0
    iget-boolean v0, v1, Ltech/sud/gip/asr/base/Sudint;->Sudcase:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    monitor-exit v1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x1

    .line 29
    :try_start_1
    iput-boolean v0, v1, Ltech/sud/gip/asr/base/Sudint;->Sudcase:Z

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput v0, v1, Ltech/sud/gip/asr/base/Sudint;->Suddo:I

    .line 33
    .line 34
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, v1, Ltech/sud/gip/asr/base/Sudint;->Sudif:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 49
    .line 50
    .line 51
    move-result-wide v2

    .line 52
    iput-wide v2, v1, Ltech/sud/gip/asr/base/Sudint;->Sudchar:J

    .line 53
    .line 54
    iget-object v0, v1, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 55
    .line 56
    iget-object v2, v1, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, v1, Ltech/sud/gip/asr/base/Sudint;->Sudgoto:Landroid/os/Handler;

    .line 62
    .line 63
    iget-object v2, v1, Ltech/sud/gip/asr/base/Sudint;->Sudelse:Ltech/sud/gip/asr/base/Sudfor;

    .line 64
    .line 65
    const-wide/16 v3, 0x2710

    .line 66
    .line 67
    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 68
    .line 69
    .line 70
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    :goto_0
    iget-object p0, p0, Ll/oug0;->b:Ll/nzg0;

    .line 72
    .line 73
    invoke-interface {p0}, Ll/nzg0;->a()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    move-object p0, v0

    .line 79
    monitor-exit v1

    .line 80
    throw p0
.end method
