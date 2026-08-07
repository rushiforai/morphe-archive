.class public Ll/v1c$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mmdns/MDDNSEntrance$ILogger;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/v1c;->e(Landroid/content/Context;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public upload(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/li20;->g()Ll/li20;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/li20;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "uid"

    .line 24
    .line 25
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string v0, "os"

    .line 29
    .line 30
    const-string v1, "Android"

    .line 31
    .line 32
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    const-string v0, "ver"

    .line 36
    .line 37
    const-string v1, "7.3.3"

    .line 38
    .line 39
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    sget-object p1, Ll/uqb0;->K:Ll/hfj0;

    .line 50
    .line 51
    invoke-virtual {p1, p0}, Ll/hfj0;->d(Ljava/util/Map;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public upload(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 55
    invoke-static {}, Ll/li20;->g()Ll/li20;

    move-result-object p0

    invoke-virtual {p0}, Ll/li20;->i()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 56
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 57
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    move-result-object v0

    const-string v1, "uid"

    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    const-string v0, "os"

    const-string v1, "Android"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    const-string v0, "ver"

    const-string v1, "7.3.3"

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object p1, Ll/uqb0;->K:Ll/hfj0;

    invoke-virtual {p1, p0}, Ll/hfj0;->d(Ljava/util/Map;)V

    return-void
.end method
