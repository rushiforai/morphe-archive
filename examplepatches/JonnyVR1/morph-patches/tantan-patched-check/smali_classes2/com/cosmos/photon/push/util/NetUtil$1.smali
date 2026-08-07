.class Lcom/cosmos/photon/push/util/NetUtil$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/util/NetUtil;
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

.method private checkConnInfo(Landroid/content/Context;Landroid/net/NetworkInfo;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 5
    .line 6
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/cosmos/photon/push/util/NetUtil$1;->onNetworkChange()V

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
    sget-boolean p1, Lcom/cosmos/photon/push/util/NetUtil;->lastConnected:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 25
    .line 26
    sput-object v0, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/cosmos/photon/push/util/NetUtil$1;->onNetworkChange()V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    sput-boolean p0, Lcom/cosmos/photon/push/util/NetUtil;->lastConnected:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/util/NetUtil$1;->isNetworkChange(Landroid/content/Context;Landroid/net/NetworkInfo;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/cosmos/photon/push/util/NetUtil$1;->onNetworkChange()V

    .line 42
    .line 43
    .line 44
    :cond_3
    const/4 p0, 0x1

    .line 45
    sput-boolean p0, Lcom/cosmos/photon/push/util/NetUtil;->lastConnected:Z

    .line 46
    .line 47
    return-void
.end method

.method private isNetworkChange(Landroid/content/Context;Landroid/net/NetworkInfo;)Z
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
    :try_start_0
    const-string p0, "wifi"

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/net/wifi/WifiManager;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    sget-object p1, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 34
    .line 35
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getBSSID()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_0

    .line 48
    .line 49
    sget-object p1, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    sget-object p1, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    sget-object p1, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-ne p1, v2, :cond_0

    .line 84
    .line 85
    return v0

    .line 86
    :catch_0
    move-exception p0

    .line 87
    goto :goto_1

    .line 88
    :cond_0
    sput-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 92
    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    if-eqz p0, :cond_2

    .line 100
    .line 101
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    if-eqz p0, :cond_2

    .line 106
    .line 107
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_2

    .line 122
    .line 123
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 124
    .line 125
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-ne p0, p1, :cond_2

    .line 134
    .line 135
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 136
    .line 137
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    if-ne p0, p1, :cond_2

    .line 146
    .line 147
    return v0

    .line 148
    :cond_2
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 149
    .line 150
    if-eqz p0, :cond_3

    .line 151
    .line 152
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    if-nez p0, :cond_3

    .line 157
    .line 158
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    if-nez p0, :cond_3

    .line 163
    .line 164
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-ne p0, p1, :cond_3

    .line 175
    .line 176
    sget-object p0, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 177
    .line 178
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 179
    .line 180
    .line 181
    move-result p0

    .line 182
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    if-ne p0, p1, :cond_3

    .line 187
    .line 188
    return v0

    .line 189
    :cond_3
    :goto_0
    sput-object p2, Lcom/cosmos/photon/push/util/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .line 191
    return v1

    .line 192
    :goto_1
    const-string p1, "net"

    .line 193
    .line 194
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 195
    .line 196
    .line 197
    return v0
.end method

.method private onNetworkChange()V
    .locals 1

    .line 1
    const-string p0, "8701b0b5e66f551562c78781b1dc88c3"

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1c;->b(Ljava/lang/String;)Ll/lsl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/lsl;->a()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->access$000()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/lit8 p0, p0, -0x1

    .line 19
    .line 20
    :goto_0
    if-ltz p0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/cosmos/photon/push/util/NetUtil;->access$000()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;

    .line 31
    .line 32
    invoke-interface {v0}, Lcom/cosmos/photon/push/util/NetUtil$NetChangeReceiver;->onNetworkChanged()V

    .line 33
    .line 34
    .line 35
    add-int/lit8 p0, p0, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
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
    const-string p2, "connectivity"

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    check-cast p2, Landroid/net/ConnectivityManager;

    .line 13
    .line 14
    :try_start_0
    invoke-virtual {p2}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    const/4 p2, 0x0

    .line 20
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/util/NetUtil$1;->checkConnInfo(Landroid/content/Context;Landroid/net/NetworkInfo;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_1
    return-void
.end method
