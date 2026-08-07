.class public final enum Lcom/xiaomi/push/ed;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/push/ed;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum a:Lcom/xiaomi/push/ed;

.field private static final synthetic a:[Lcom/xiaomi/push/ed;

.field public static final enum b:Lcom/xiaomi/push/ed;

.field public static final enum c:Lcom/xiaomi/push/ed;

.field public static final enum d:Lcom/xiaomi/push/ed;

.field public static final enum e:Lcom/xiaomi/push/ed;

.field public static final enum f:Lcom/xiaomi/push/ed;

.field public static final enum g:Lcom/xiaomi/push/ed;

.field public static final enum h:Lcom/xiaomi/push/ed;

.field public static final enum i:Lcom/xiaomi/push/ed;

.field public static final enum j:Lcom/xiaomi/push/ed;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Lcom/xiaomi/push/ed;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "register"

    .line 5
    .line 6
    const-string v3, "COMMAND_REGISTER"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/xiaomi/push/ed;->a:Lcom/xiaomi/push/ed;

    .line 12
    .line 13
    new-instance v1, Lcom/xiaomi/push/ed;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "unregister"

    .line 17
    .line 18
    const-string v4, "COMMAND_UNREGISTER"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/xiaomi/push/ed;->b:Lcom/xiaomi/push/ed;

    .line 24
    .line 25
    new-instance v2, Lcom/xiaomi/push/ed;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "set-alias"

    .line 29
    .line 30
    const-string v5, "COMMAND_SET_ALIAS"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/xiaomi/push/ed;->c:Lcom/xiaomi/push/ed;

    .line 36
    .line 37
    new-instance v3, Lcom/xiaomi/push/ed;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "unset-alias"

    .line 41
    .line 42
    const-string v6, "COMMAND_UNSET_ALIAS"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/xiaomi/push/ed;->d:Lcom/xiaomi/push/ed;

    .line 48
    .line 49
    new-instance v4, Lcom/xiaomi/push/ed;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "set-account"

    .line 53
    .line 54
    const-string v7, "COMMAND_SET_ACCOUNT"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/xiaomi/push/ed;->e:Lcom/xiaomi/push/ed;

    .line 60
    .line 61
    new-instance v5, Lcom/xiaomi/push/ed;

    .line 62
    .line 63
    const/4 v6, 0x5

    .line 64
    const-string v7, "unset-account"

    .line 65
    .line 66
    const-string v8, "COMMAND_UNSET_ACCOUNT"

    .line 67
    .line 68
    invoke-direct {v5, v8, v6, v7}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v5, Lcom/xiaomi/push/ed;->f:Lcom/xiaomi/push/ed;

    .line 72
    .line 73
    new-instance v6, Lcom/xiaomi/push/ed;

    .line 74
    .line 75
    const/4 v7, 0x6

    .line 76
    const-string v8, "subscribe-topic"

    .line 77
    .line 78
    const-string v9, "COMMAND_SUBSCRIBE_TOPIC"

    .line 79
    .line 80
    invoke-direct {v6, v9, v7, v8}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sput-object v6, Lcom/xiaomi/push/ed;->g:Lcom/xiaomi/push/ed;

    .line 84
    .line 85
    new-instance v7, Lcom/xiaomi/push/ed;

    .line 86
    .line 87
    const/4 v8, 0x7

    .line 88
    const-string v9, "unsubscibe-topic"

    .line 89
    .line 90
    const-string v10, "COMMAND_UNSUBSCRIBE_TOPIC"

    .line 91
    .line 92
    invoke-direct {v7, v10, v8, v9}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lcom/xiaomi/push/ed;->h:Lcom/xiaomi/push/ed;

    .line 96
    .line 97
    new-instance v8, Lcom/xiaomi/push/ed;

    .line 98
    .line 99
    const/16 v9, 0x8

    .line 100
    .line 101
    const-string v10, "accept-time"

    .line 102
    .line 103
    const-string v11, "COMMAND_SET_ACCEPT_TIME"

    .line 104
    .line 105
    invoke-direct {v8, v11, v9, v10}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 106
    .line 107
    .line 108
    sput-object v8, Lcom/xiaomi/push/ed;->i:Lcom/xiaomi/push/ed;

    .line 109
    .line 110
    new-instance v9, Lcom/xiaomi/push/ed;

    .line 111
    .line 112
    const/16 v10, 0x9

    .line 113
    .line 114
    const-string v11, "check-vdeviceid"

    .line 115
    .line 116
    const-string v12, "COMMAND_CHK_VDEVID"

    .line 117
    .line 118
    invoke-direct {v9, v12, v10, v11}, Lcom/xiaomi/push/ed;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v9, Lcom/xiaomi/push/ed;->j:Lcom/xiaomi/push/ed;

    .line 122
    .line 123
    filled-new-array/range {v0 .. v9}, [Lcom/xiaomi/push/ed;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    sput-object v0, Lcom/xiaomi/push/ed;->a:[Lcom/xiaomi/push/ed;

    .line 128
    .line 129
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Ljava/lang/String;)I
    .locals 6

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Lcom/xiaomi/push/ed;->values()[Lcom/xiaomi/push/ed;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    array-length v2, v0

    .line 14
    const/4 v3, 0x0

    .line 15
    :goto_0
    if-ge v3, v2, :cond_2

    .line 16
    .line 17
    aget-object v4, v0, v3

    .line 18
    .line 19
    iget-object v5, v4, Lcom/xiaomi/push/ed;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v5, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-eqz v5, :cond_1

    .line 26
    .line 27
    invoke-static {v4}, Ll/szq0;->b(Ljava/lang/Enum;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_2
    return v1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/push/ed;
    .locals 1

    .line 1
    const-class v0, Lcom/xiaomi/push/ed;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/xiaomi/push/ed;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/xiaomi/push/ed;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/ed;->a:[Lcom/xiaomi/push/ed;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/xiaomi/push/ed;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/xiaomi/push/ed;

    .line 8
    .line 9
    return-object v0
.end method
