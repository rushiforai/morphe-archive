.class public final Le/e/a/Playback214;
.super Ljava/lang/Object;
.source "Playback214.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static begin(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 15
    const-string v0, "video"

    :try_start_2
    const-string v1, "modernWatch"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    if-eqz v1, :cond_25

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    if-nez v2, :cond_14

    const/4 v0, 0x0

    goto :goto_1e

    :cond_14
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1e
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_25

    return-void

    :cond_25
    const-string p1, "K"

    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "quality_mode"

    const-string v2, "0"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {p1, v0}, Le/e/a/Playback214;->mobileQuality(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "e"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Quality settings at start: cellular="

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Le/e/a/Playback214;->cellular(Landroid/content/Context;)Z

    move-result p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p1, " mode="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_6b} :catch_6c

    return-void

    :catch_6c
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Quality settings refresh unavailable "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static cellular(Landroid/content/Context;)Z
    .registers 4

    const/4 v0, 0x0

    .line 14
    :try_start_1
    const-string v1, "connectivity"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    if-nez p0, :cond_c

    return v0

    :cond_c
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-lt v1, v2, :cond_21

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    if-eqz v1, :cond_21

    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v1

    invoke-static {p0, v1, v0}, Le/e/a/Playback214;->transport(Landroid/net/ConnectivityManager;Landroid/net/Network;I)Z

    move-result p0

    return p0

    :cond_21
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_35

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v1

    if-eqz v1, :cond_35

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    move-result p0
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_31} :catch_36

    if-nez p0, :cond_35

    const/4 p0, 0x1

    return p0

    :cond_35
    return v0

    :catch_36
    move-exception p0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Quality network detection unavailable "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return v0
.end method

.method public static choose(Lorg/json/JSONArray;I)Ljava/lang/String;
    .registers 12

    const/4 v0, 0x0

    const/4 v1, -0x1

    const v2, 0x7fffffff

    const/4 v3, 0x0

    move-object v5, v0

    move-object v6, v5

    const/4 v4, 0x0

    .line 20
    :goto_9
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v7

    const-string v8, "isAvailable"

    const-string v9, "id"

    if-lt v4, v7, :cond_34

    if-eqz v5, :cond_16

    return-object v5

    :cond_16
    if-eqz v6, :cond_19

    return-object v6

    :cond_19
    :goto_19
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result p1

    if-lt v3, p1, :cond_20

    return-object v0

    :cond_20
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    if-eqz p1, :cond_31

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_31

    invoke-virtual {p1, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_31
    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_34
    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    if-eqz v7, :cond_56

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_56

    invoke-static {v7}, Le/e/a/Playback214;->videoHeight(Lorg/json/JSONObject;)I

    move-result v8

    if-lez v8, :cond_56

    if-ge v8, v2, :cond_4d

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move v2, v8

    :cond_4d
    if-gt v8, p1, :cond_56

    if-le v8, v1, :cond_56

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move v1, v8

    :cond_56
    add-int/lit8 v4, v4, 0x1

    goto :goto_9
.end method

.method public static configure(Ljava/lang/Object;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v2, "b"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v2, "g"

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v2, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "h"

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v0, v2, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const v2, 0x7fffffff

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "k"

    invoke-static {v0, v4, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v4, 0x4

    if-ne p1, v4, :cond_32

    const/16 v2, 0x168

    goto :goto_3d

    :cond_32
    const/4 v4, 0x3

    if-ne p1, v4, :cond_38

    const/16 v2, 0x1e0

    goto :goto_3d

    :cond_38
    const/4 v4, 0x2

    if-ne p1, v4, :cond_3d

    const/16 v2, 0x2d0

    :cond_3d
    :goto_3d
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v2, "l"

    invoke-static {v0, v2, p1}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "q"

    invoke-static {v0, p1, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "r"

    invoke-static {v0, p1, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v3, v1

    const-string v4, "a"

    invoke-virtual {p1, v4, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-virtual {p1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static convertMobile(II)I
    .registers 4

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    const/4 v0, 0x1

    const/4 v1, 0x2

    if-ne p0, v0, :cond_9

    return v1

    :cond_9
    const/4 v0, 0x3

    if-ne p0, v1, :cond_d

    return v0

    :cond_d
    if-ne p0, v0, :cond_11

    const/4 p0, 0x4

    return p0

    :cond_11
    return p1
.end method

.method public static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :goto_4
    if-eqz v0, :cond_18

    :try_start_6
    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_12
    .catch Ljava/lang/NoSuchFieldException; {:try_start_6 .. :try_end_12} :catch_13

    return-object p0

    :catch_13
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_4

    :cond_18
    new-instance p0, Ljava/lang/NoSuchFieldException;

    invoke-direct {p0, p1}, Ljava/lang/NoSuchFieldException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static initial(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9

    .line 18
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Popup"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    const-string v0, "z"

    goto :goto_15

    :cond_13
    const-string v0, "h1"

    :goto_15
    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    invoke-static {p1}, Le/e/a/Playback214;->selector(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1, v0}, Le/e/a/Playback214;->configure(Ljava/lang/Object;I)V

    invoke-static {p0, v0}, Le/e/a/Playback214;->targetHeight(Ljava/lang/Object;I)I

    move-result p0

    if-lez p0, :cond_61

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "b"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1, p1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "l"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v1, v2, p0}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    const-string v2, "a"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-virtual {p0, v2, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    new-array v2, v4, [Ljava/lang/Object;

    aput-object v1, v2, v3

    invoke-virtual {p0, p1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_61
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "Quality: initial mode="

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_72} :catch_73

    return-void

    :catch_73
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Quality: initial selection unavailable "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static manual(Ljava/lang/Object;)V
    .registers 8

    .line 25
    :try_start_0
    invoke-static {p0}, Le/e/a/Playback214;->selector(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "b"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "k"

    const v3, 0x7fffffff

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1, v4}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "l"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v3}, Le/e/a/Playback214;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v3, "a"

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v1, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v4, [Ljava/lang/Object;

    aput-object v0, v3, v2

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_45} :catch_45

    :catch_45
    return-void
.end method

.method public static mobileQuality(Landroid/content/Context;I)I
    .registers 5

    .line 16
    invoke-static {p0}, Le/e/a/Playback214;->cellular(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_27

    :try_start_6
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "mobile_quality_mode"

    const-string v1, "mobile_low_quality"

    const/4 v2, 0x0

    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_18

    const-string v1, "3"

    goto :goto_1a

    :cond_18
    const-string v1, "-1"

    :goto_1a
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0, p1}, Le/e/a/Playback214;->convertMobile(II)I

    move-result p0
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_26} :catch_27

    return p0

    :catch_27
    :cond_27
    return p1
.end method

.method public static number(Ljava/lang/Object;Ljava/lang/String;)I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    invoke-static {p0, p1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    return p0
.end method

.method public static pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x2

    if-ne p1, v0, :cond_6

    const/16 p1, 0x168

    goto :goto_f

    :cond_6
    const/4 v0, 0x1

    if-ne p1, v0, :cond_c

    const/16 p1, 0x1e0

    goto :goto_f

    :cond_c
    const p1, 0x7fffffff

    .line 21
    :goto_f
    invoke-static {p0, p1}, Le/e/a/Playback214;->choose(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static selector(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    const-string v0, "videoViewImpl"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "delegate"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "exoMediaPlayer"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string v0, "trackSelector"

    invoke-static {p0, v0}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static targetHeight(Ljava/lang/Object;I)I
    .registers 6

    const/4 v0, 0x0

    .line 23
    :try_start_1
    const-string v1, "modernWatch"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    const-string v1, "media"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "domand"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "videos"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v1, 0x4

    if-ne p1, v1, :cond_21

    const/16 p1, 0x168

    goto :goto_30

    :cond_21
    const/4 v1, 0x3

    if-ne p1, v1, :cond_27

    const/16 p1, 0x1e0

    goto :goto_30

    :cond_27
    const/4 v1, 0x2

    if-ne p1, v1, :cond_2d

    const/16 p1, 0x2d0

    goto :goto_30

    :cond_2d
    const p1, 0x7fffffff

    :goto_30
    invoke-static {p0, p1}, Le/e/a/Playback214;->choose(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    :goto_35
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_53

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_50

    invoke-static {v2}, Le/e/a/Playback214;->videoHeight(Lorg/json/JSONObject;)I

    move-result p0
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4f} :catch_53

    return p0

    :cond_50
    add-int/lit8 v1, v1, 0x1

    goto :goto_35

    :catch_53
    :cond_53
    return v0
.end method

.method public static targetVideo(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 22
    :try_start_0
    const-string v0, "e"

    invoke-static {p0, v0}, Le/e/a/Playback214;->number(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v0

    const-string v1, "modernWatch"

    invoke-static {p0, v1}, Le/e/a/Playback214;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/json/JSONObject;

    const-string v1, "media"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "domand"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "videos"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_26

    const/16 v0, 0x168

    goto :goto_35

    :cond_26
    const/4 v1, 0x3

    if-ne v0, v1, :cond_2c

    const/16 v0, 0x1e0

    goto :goto_35

    :cond_2c
    const/4 v1, 0x2

    if-ne v0, v1, :cond_32

    const/16 v0, 0x2d0

    goto :goto_35

    :cond_32
    const v0, 0x7fffffff

    :goto_35
    invoke-static {p0, v0}, Le/e/a/Playback214;->choose(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p0
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_39} :catch_3a

    return-object p0

    :catch_3a
    const/4 p0, 0x0

    return-object p0
.end method

.method public static transport(Landroid/net/ConnectivityManager;Landroid/net/Network;I)Z
    .registers 13

    const/4 v0, 0x0

    if-eqz p1, :cond_b5

    const/4 v1, 0x3

    if-gt p2, v1, :cond_b5

    .line 13
    invoke-virtual {p0, p1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object p1

    if-nez p1, :cond_d

    return v0

    :cond_d
    invoke-virtual {p1, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_15

    return v3

    :cond_15
    const/4 v2, 0x4

    invoke-virtual {p1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v4

    if-eqz v4, :cond_b5

    :try_start_1c
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "getUnderlyingNetworks"

    new-array v6, v0, [Ljava/lang/Class;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, p1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v4, p1, Ljava/util/List;

    if-eqz v4, :cond_57

    move-object v4, p1

    check-cast v4, Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_57

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_40
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_47

    return v0

    :cond_47
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Network;

    add-int/lit8 v5, p2, 0x1

    invoke-static {p0, v4, v5}, Le/e/a/Playback214;->transport(Landroid/net/ConnectivityManager;Landroid/net/Network;I)Z

    move-result v4
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_53} :catch_56

    if-eqz v4, :cond_40

    return v3

    :catch_56
    nop

    :cond_57
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p1

    if-eqz p1, :cond_64

    invoke-virtual {p1}, Landroid/net/NetworkInfo;->getType()I

    move-result p1

    if-nez p1, :cond_64

    return v3

    :cond_64
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object p1

    array-length p2, p1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_6c
    if-lt v4, p2, :cond_74

    if-eqz v5, :cond_73

    if-nez v6, :cond_73

    return v3

    :cond_73
    return v0

    :cond_74
    aget-object v7, p1, v4

    invoke-virtual {p0, v7}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v8

    invoke-virtual {p0, v7}, Landroid/net/ConnectivityManager;->getNetworkInfo(Landroid/net/Network;)Landroid/net/NetworkInfo;

    move-result-object v7

    if-eqz v8, :cond_b2

    invoke-virtual {v8, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v9

    if-nez v9, :cond_b2

    if-eqz v7, :cond_b2

    invoke-virtual {v7}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v7

    if-eqz v7, :cond_b2

    const/16 v7, 0xc

    invoke-virtual {v8, v7}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v7

    if-eqz v7, :cond_b2

    const/16 v7, 0x10

    invoke-virtual {v8, v7}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v7

    if-eqz v7, :cond_b2

    invoke-virtual {v8, v0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v7

    if-eqz v7, :cond_a5

    const/4 v5, 0x1

    :cond_a5
    invoke-virtual {v8, v3}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v7

    if-nez v7, :cond_b1

    invoke-virtual {v8, v1}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v7

    if-eqz v7, :cond_b2

    :cond_b1
    const/4 v6, 0x1

    :cond_b2
    add-int/lit8 v4, v4, 0x1

    goto :goto_6c

    :cond_b5
    return v0
.end method

.method public static videoHeight(Lorg/json/JSONObject;)I
    .registers 4

    .line 19
    const-string v0, "resolution"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    const-string v2, "height"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    :cond_f
    if-gtz v1, :cond_31

    const-string v0, "([0-9]{2,4})p"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    const-string v2, "id"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_31

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_31
    return v1
.end method
