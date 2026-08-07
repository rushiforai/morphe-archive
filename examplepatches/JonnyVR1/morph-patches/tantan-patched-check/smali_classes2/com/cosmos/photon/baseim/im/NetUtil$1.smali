.class final Lcom/cosmos/photon/baseim/im/NetUtil$1;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/baseim/im/NetUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
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
    sput-object v0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 5
    .line 6
    sput-object v0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/cosmos/photon/baseim/im/NetUtil$1;->onNetworkChange()V

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
    sget-boolean p1, Lcom/cosmos/photon/baseim/im/NetUtil;->lastConnected:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    sput-object v0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 25
    .line 26
    sput-object v0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/cosmos/photon/baseim/im/NetUtil$1;->onNetworkChange()V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x0

    .line 32
    sput-boolean p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastConnected:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/baseim/im/NetUtil$1;->isNetworkChange(Landroid/content/Context;Landroid/net/NetworkInfo;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    invoke-direct {p0}, Lcom/cosmos/photon/baseim/im/NetUtil$1;->onNetworkChange()V

    .line 42
    .line 43
    .line 44
    :cond_3
    const/4 p0, 0x1

    .line 45
    sput-boolean p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastConnected:Z

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
    sget-object p1, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

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
    sget-object p1, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

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
    sget-object p1, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    sget-object p1, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-virtual {p0}, Landroid/net/wifi/WifiInfo;->getNetworkId()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-ne p1, v2, :cond_0

    .line 76
    .line 77
    return v0

    .line 78
    :cond_0
    sput-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastWifiInfo:Landroid/net/wifi/WifiInfo;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 82
    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    if-eqz p0, :cond_2

    .line 112
    .line 113
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 114
    .line 115
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-ne p0, p1, :cond_2

    .line 124
    .line 125
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 126
    .line 127
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-ne p0, p1, :cond_2

    .line 136
    .line 137
    return v0

    .line 138
    :cond_2
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 139
    .line 140
    if-eqz p0, :cond_3

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    if-nez p0, :cond_3

    .line 147
    .line 148
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    if-nez p0, :cond_3

    .line 153
    .line 154
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getSubtype()I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-ne p0, p1, :cond_3

    .line 165
    .line 166
    sget-object p0, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 167
    .line 168
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    invoke-virtual {p2}, Landroid/net/NetworkInfo;->getType()I

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-ne p0, p1, :cond_3

    .line 177
    .line 178
    return v0

    .line 179
    :cond_3
    :goto_0
    sput-object p2, Lcom/cosmos/photon/baseim/im/NetUtil;->lastActiveNetworkInfo:Landroid/net/NetworkInfo;

    .line 180
    .line 181
    return v1
.end method

.method private onNetworkChange()V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/cosmos/photon/baseim/im/NetUtil;->access$000()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, -0x1

    .line 10
    .line 11
    :goto_0
    if-ltz p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/cosmos/photon/baseim/im/NetUtil;->access$000()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    invoke-static {v0, v1}, Lcom/cosmos/photon/baseim/im/NetUtil;->access$100(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    add-int/lit8 p0, p0, -0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
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
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/baseim/im/NetUtil$1;->checkConnInfo(Landroid/content/Context;Landroid/net/NetworkInfo;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_1
    return-void
.end method
