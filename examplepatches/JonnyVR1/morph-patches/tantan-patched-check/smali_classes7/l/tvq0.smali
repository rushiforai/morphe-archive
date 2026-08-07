.class public Ll/tvq0;
.super Ll/vvq0$d;
.source "SourceFile"


# instance fields
.field private i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/vvq0$d;-><init>(Ljava/lang/String;Landroid/content/ContentValues;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/tvq0;->i:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static i(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/push/gj;)Ll/tvq0;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p2}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    array-length v2, v1

    .line 13
    if-gtz v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v2, Landroid/content/ContentValues;

    .line 17
    .line 18
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v3, "status"

    .line 22
    .line 23
    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 24
    .line 25
    .line 26
    const-string v3, "messageId"

    .line 27
    .line 28
    const-string v4, ""

    .line 29
    .line 30
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string v3, "messageItemId"

    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-virtual {v2, v3, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p2, "messageItem"

    .line 43
    .line 44
    invoke-virtual {v2, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 45
    .line 46
    .line 47
    invoke-static {p0}, Ll/nvq0;->d(Landroid/content/Context;)Ll/nvq0;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p2}, Ll/nvq0;->l()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    const-string v1, "appId"

    .line 56
    .line 57
    invoke-virtual {v2, v1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p0}, Ll/nvq0;->d(Landroid/content/Context;)Ll/nvq0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ll/nvq0;->b()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p2, "packageName"

    .line 69
    .line 70
    invoke-virtual {v2, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p2, "createTimeStamp"

    .line 82
    .line 83
    invoke-virtual {v2, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 84
    .line 85
    .line 86
    const-string p0, "uploadTimestamp"

    .line 87
    .line 88
    invoke-virtual {v2, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 89
    .line 90
    .line 91
    new-instance p0, Ll/tvq0;

    .line 92
    .line 93
    const-string p2, "a job build to insert message to db"

    .line 94
    .line 95
    invoke-direct {p0, p1, v2, p2}, Ll/tvq0;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 100
    return-object p0
.end method
