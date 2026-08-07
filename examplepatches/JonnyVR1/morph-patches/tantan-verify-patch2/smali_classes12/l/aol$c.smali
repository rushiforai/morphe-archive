.class Ll/aol$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/aol;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/aol;


# direct methods
.method public constructor <init>(Ll/aol;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aol$c;->a:Ll/aol;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    const-string p0, "BaseHttpUtils"

    .line 2
    .line 3
    const-string p1, "updateNtpTime onFailure"

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "millisecond"

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/i5d0;->I()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Ll/i5d0;->a0()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-virtual {p2}, Ll/i5d0;->U()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    new-instance p1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v4, "sentTime: "

    .line 20
    .line 21
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v4, " recvTime: "

    .line 28
    .line 29
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v4, "BaseHttpUtils"

    .line 40
    .line 41
    invoke-static {v4, p1}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 42
    .line 43
    .line 44
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 45
    .line 46
    invoke-virtual {p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Ll/k5d0;->string()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {v4, p2}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    if-eqz p2, :cond_0

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    .line 71
    .line 72
    .line 73
    move-result-wide p0

    .line 74
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    sub-long/2addr v2, v0

    .line 79
    invoke-virtual {p2, p0, p1, v2, v3}, Ll/csx;->H1(JJ)V

    .line 80
    .line 81
    .line 82
    invoke-static {}, Ll/a7y;->a()Ll/a7y;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p2, p0, p1, v2, v3}, Ll/a7y;->f(JJ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    :cond_0
    return-void

    .line 90
    :catch_0
    move-exception p0

    .line 91
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    const-string p0, "Unexpected code "

    .line 96
    .line 97
    invoke-static {p0, p2}, Ll/bol;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
