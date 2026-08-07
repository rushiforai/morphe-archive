.class Ll/aq50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s1m;


# instance fields
.field private a:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x1f4

    .line 5
    .line 6
    iput-wide v0, p0, Ll/aq50;->a:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/i5d0;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    const-string v0, "tag_oneid"

    .line 5
    .line 6
    const-string v1, "onResponseSuc"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/xu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/i5d0;->k()Ll/k5d0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "status"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const-string v1, "data"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "oneid"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_2

    .line 47
    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    invoke-static {v0}, Ll/xp50;->i(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/uzi0;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Ll/m4f0;->d(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 61
    .line 62
    .line 63
    move-result-wide p0

    .line 64
    invoke-static {p0, p1}, Ll/m4f0;->e(J)V

    .line 65
    .line 66
    .line 67
    sget-object p0, Ll/xp50;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    check-cast p1, Ll/r1m;

    .line 84
    .line 85
    invoke-interface {p1, v0}, Ll/r1m;->onSuccess(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    sget-object p0, Ll/xp50;->c:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    div-int/lit8 p1, p1, 0x64

    .line 96
    .line 97
    const/4 v0, 0x5

    .line 98
    if-ne p1, v0, :cond_3

    .line 99
    .line 100
    invoke-virtual {p0}, Ll/aq50;->onFail()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 101
    .line 102
    .line 103
    :cond_3
    :goto_1
    return-void

    .line 104
    :catch_0
    move-exception p0

    .line 105
    invoke-static {p0}, Ll/xu80;->b(Ljava/lang/Exception;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public onFail()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/aq50;->a:J

    .line 2
    .line 3
    const-wide/16 v2, 0x7d00

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "onResponseFail "

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-wide v1, p0, Ll/aq50;->a:J

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "tag_oneid"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/xu80;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-wide v0, p0, Ll/aq50;->a:J

    .line 31
    .line 32
    invoke-static {v0, v1, p0}, Ll/kj20;->e(JLl/s1m;)V

    .line 33
    .line 34
    .line 35
    iget-wide v0, p0, Ll/aq50;->a:J

    .line 36
    .line 37
    const-wide/16 v2, 0x2

    .line 38
    .line 39
    mul-long/2addr v0, v2

    .line 40
    iput-wide v0, p0, Ll/aq50;->a:J

    .line 41
    .line 42
    :cond_0
    return-void
.end method
