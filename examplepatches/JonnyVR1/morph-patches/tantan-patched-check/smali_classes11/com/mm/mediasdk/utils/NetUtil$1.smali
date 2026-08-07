.class Lcom/mm/mediasdk/utils/NetUtil$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mm/mediasdk/utils/NetUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private a(Landroid/content/Context;Landroid/net/NetworkInfo;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 5
    .line 6
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/mm/mediasdk/utils/NetUtil$1;->c()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getDetailedState()Landroid/net/NetworkInfo$DetailedState;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    .line 17
    .line 18
    if-eq v1, v2, :cond_2

    .line 19
    .line 20
    sget-boolean p1, Lcom/mm/mediasdk/utils/NetUtil;->d:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 25
    .line 26
    sput-object v0, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/mm/mediasdk/utils/NetUtil$1;->c()V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    sput-boolean p0, Lcom/mm/mediasdk/utils/NetUtil;->d:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/mm/mediasdk/utils/NetUtil$1;->b(Landroid/content/Context;Landroid/net/NetworkInfo;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/mm/mediasdk/utils/NetUtil$1;->c()V

    .line 42
    .line 43
    .line 44
    :cond_3
    const/4 p0, 0x1

    .line 45
    sput-boolean p0, Lcom/mm/mediasdk/utils/NetUtil;->d:Z

    .line 46
    .line 47
    return-void
.end method

.method private b(Landroid/content/Context;Landroid/net/NetworkInfo;)Z
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-ne p0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "wifi"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/net/wifi/WifiManager;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p1, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    sget-object p1, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_0

    .line 52
    .line 53
    sget-object p1, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_0

    .line 68
    .line 69
    sget-object p1, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-ne p1, v2, :cond_0

    .line 80
    .line 81
    return v0

    .line 82
    :cond_0
    sput-object p0, Lcom/mm/mediasdk/utils/NetUtil;->c:Landroid/net/wifi/WifiInfo;

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 86
    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    if-eqz p0, :cond_2

    .line 100
    .line 101
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_2

    .line 116
    .line 117
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 118
    .line 119
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-ne p0, p1, :cond_2

    .line 128
    .line 129
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 130
    .line 131
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-ne p0, p1, :cond_2

    .line 140
    .line 141
    return v0

    .line 142
    :cond_2
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 143
    .line 144
    if-eqz p0, :cond_3

    .line 145
    .line 146
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    if-nez p0, :cond_3

    .line 151
    .line 152
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    if-nez p0, :cond_3

    .line 157
    .line 158
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 159
    .line 160
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    if-ne p0, p1, :cond_3

    .line 169
    .line 170
    sget-object p0, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 177
    .line 178
    .line 179
    move-result p1

    .line 180
    if-ne p0, p1, :cond_3

    .line 181
    .line 182
    return v0

    .line 183
    :cond_3
    :goto_0
    sput-object p2, Lcom/mm/mediasdk/utils/NetUtil;->b:Landroid/net/NetworkInfo;

    .line 184
    .line 185
    return v1
.end method

.method private c()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/mm/mediasdk/utils/NetUtil;->b()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 20
    .line 21
    invoke-interface {v0}, Lcom/mm/mediasdk/utils/NetUtil$a;->onNetworkChanged()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {}, Lcom/mm/mediasdk/utils/NetUtil;->c()Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/mm/mediasdk/utils/NetUtil;->c()Lcom/mm/mediasdk/utils/NetUtil$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Lcom/mm/mediasdk/utils/NetUtil$a;->onNetworkChanged()V

    .line 36
    .line 37
    .line 38
    :cond_1
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-static {}, Lcom/mm/mediasdk/utils/NetUtil;->a()Lcom/mm/mediasdk/utils/NetUtil$b;

    .line 7
    .line 8
    .line 9
    const-string p2, "connectivity"

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Landroid/net/ConnectivityManager;

    .line 16
    .line 17
    :try_start_0
    invoke-virtual {p2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    const/4 p2, 0x0

    .line 23
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/mm/mediasdk/utils/NetUtil$1;->a(Landroid/content/Context;Landroid/net/NetworkInfo;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_1
    return-void
.end method
