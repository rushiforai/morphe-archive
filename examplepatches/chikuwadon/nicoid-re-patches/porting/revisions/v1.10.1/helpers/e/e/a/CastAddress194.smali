.class public final Le/e/a/CastAddress194;
.super Ljava/lang/Object;
.source "CastAddress194.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static address(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;
    .registers 9
    .param p0, "manager"    # Landroid/net/ConnectivityManager;
    .param p1, "network"    # Landroid/net/Network;

    .line 24
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v1

    .line 25
    .local v1, "caps":Landroid/net/NetworkCapabilities;
    if-eqz v1, :cond_7a

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_7a

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_20

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    if-nez v2, :cond_20

    goto :goto_7a

    .line 26
    :cond_20
    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getLinkProperties(Landroid/net/Network;)Landroid/net/LinkProperties;

    move-result-object v2

    .local v2, "properties":Landroid/net/LinkProperties;
    if-nez v2, :cond_27

    return-object v0

    .line 27
    :cond_27
    invoke-virtual {v2}, Landroid/net/LinkProperties;->getLinkAddresses()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/LinkAddress;

    .local v4, "link":Landroid/net/LinkAddress;
    invoke-virtual {v4}, Landroid/net/LinkAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v5

    .local v5, "ip":Ljava/net/InetAddress;
    instance-of v6, v5, Ljava/net/Inet4Address;

    if-eqz v6, :cond_2f

    invoke-virtual {v5}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v6

    if-nez v6, :cond_2f

    invoke-virtual {v5}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    move-result v6

    if-nez v6, :cond_2f

    invoke-virtual {v5}, Ljava/net/InetAddress;->isLinkLocalAddress()Z

    move-result v6

    if-nez v6, :cond_2f

    invoke-virtual {v5}, Ljava/net/InetAddress;->isMulticastAddress()Z

    move-result v6

    if-nez v6, :cond_2f

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v5}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ":52862/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 28
    .end local v4    # "link":Landroid/net/LinkAddress;
    .end local v5    # "ip":Ljava/net/InetAddress;
    :cond_79
    return-object v0

    .line 25
    .end local v2    # "properties":Landroid/net/LinkProperties;
    :cond_7a
    :goto_7a
    return-object v0
.end method

.method public static resolve(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "owner"    # Ljava/lang/Object;
    .param p1, "original"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    invoke-static {p1}, Le/e/a/CastAddress194;->usable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-object p1

    .line 13
    :cond_7
    instance-of v0, p0, Landroid/content/Context;

    if-eqz v0, :cond_49

    .line 14
    move-object v0, p0

    check-cast v0, Landroid/content/Context;

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 15
    .local v0, "manager":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_49

    .line 16
    :try_start_18
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    .local v1, "active":Landroid/net/Network;
    invoke-static {v0, v1}, Le/e/a/CastAddress194;->address(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;

    move-result-object v2

    .local v2, "address":Ljava/lang/String;
    if-eqz v2, :cond_23

    return-object v2

    .line 18
    :cond_23
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_29
    if-ge v5, v4, :cond_3f

    aget-object v6, v3, v5

    .local v6, "network":Landroid/net/Network;
    invoke-virtual {v6, v1}, Landroid/net/Network;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_34

    goto :goto_3c

    :cond_34
    invoke-static {v0, v6}, Le/e/a/CastAddress194;->address(Landroid/net/ConnectivityManager;Landroid/net/Network;)Ljava/lang/String;

    move-result-object v7
    :try_end_38
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_38} :catch_40

    .end local v2    # "address":Ljava/lang/String;
    .local v7, "address":Ljava/lang/String;
    if-eqz v7, :cond_3b

    return-object v7

    :cond_3b
    move-object v2, v7

    .end local v6    # "network":Landroid/net/Network;
    .end local v7    # "address":Ljava/lang/String;
    .restart local v2    # "address":Ljava/lang/String;
    :goto_3c
    add-int/lit8 v5, v5, 0x1

    goto :goto_29

    .line 19
    .end local v1    # "active":Landroid/net/Network;
    .end local v2    # "address":Ljava/lang/String;
    :cond_3f
    goto :goto_49

    :catch_40
    move-exception v1

    .local v1, "error":Ljava/lang/SecurityException;
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Cast network metadata unavailable"

    invoke-direct {v2, v3, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 21
    .end local v0    # "manager":Landroid/net/ConnectivityManager;
    .end local v1    # "error":Ljava/lang/SecurityException;
    :cond_49
    :goto_49
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No usable local Cast address"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static usable(Ljava/lang/String;)Z
    .registers 10
    .param p0, "base"    # Ljava/lang/String;

    .line 31
    const/4 v0, 0x0

    if-nez p0, :cond_4

    return v0

    .line 32
    :cond_4
    :try_start_4
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .local v1, "uri":Ljava/net/URI;
    const-string v2, "http"

    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6c

    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v2

    const v3, 0xce7e

    if-eq v2, v3, :cond_1f

    goto :goto_6c

    :cond_1f
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    .local v2, "host":Ljava/lang/String;
    if-nez v2, :cond_26

    return v0

    :cond_26
    const-string v3, "\\."

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .local v3, "parts":[Ljava/lang/String;
    array-length v4, v3

    const/4 v5, 0x4

    if-eq v4, v5, :cond_31

    return v0

    :cond_31
    array-length v4, v3

    const/4 v5, 0x0

    :goto_33
    if-ge v5, v4, :cond_4c

    aget-object v6, v3, v5

    .local v6, "part":Ljava/lang/String;
    const-string v7, "[0-9]{1,3}"

    invoke-virtual {v6, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4b

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    const/16 v8, 0xff

    if-le v7, v8, :cond_48

    goto :goto_4b

    .end local v6    # "part":Ljava/lang/String;
    :cond_48
    add-int/lit8 v5, v5, 0x1

    goto :goto_33

    .restart local v6    # "part":Ljava/lang/String;
    :cond_4b
    :goto_4b
    return v0

    .end local v6    # "part":Ljava/lang/String;
    :cond_4c
    aget-object v4, v3, v0

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .local v4, "first":I
    if-eqz v4, :cond_6c

    const/16 v5, 0x7f

    if-eq v4, v5, :cond_6c

    const/16 v5, 0xe0

    if-ge v4, v5, :cond_6c

    const/16 v5, 0xa9

    const/4 v6, 0x1

    if-ne v4, v5, :cond_6b

    const-string v5, "254"

    aget-object v7, v3, v6

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_69} :catch_6d

    if-nez v5, :cond_6c

    :cond_6b
    const/4 v0, 0x1

    .end local v2    # "host":Ljava/lang/String;
    .end local v3    # "parts":[Ljava/lang/String;
    .end local v4    # "first":I
    :cond_6c
    :goto_6c
    return v0

    .end local v1    # "uri":Ljava/net/URI;
    :catch_6d
    move-exception v1

    .local v1, "error":Ljava/lang/Exception;
    return v0
.end method
