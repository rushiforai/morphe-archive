.class public Ll/arw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field private d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/arw;->d:Z

    .line 6
    .line 7
    iput-object p2, p0, Ll/arw;->a:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Ll/arw;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Ll/arw;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {}, Ll/hrw;->a()J

    .line 22
    .line 23
    .line 24
    move-result-wide v0

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    filled-new-array {p1, p2, p3, p0, v0}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "MWCHolder"

    .line 34
    .line 35
    const-string p3, "MWCHolder:created @serviceId=%s, @workerId=%s, @url=%s, @hashCode=%s, @ts=%d"

    .line 36
    .line 37
    invoke-static {p1, p2, p3, p0}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public a()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/arw;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/arw;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "url"

    .line 20
    .line 21
    iget-object v2, p0, Ll/arw;->c:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/immomo/mwc/sdk/MWCEngine;->q()Ll/byl;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    sget-object v2, Lcom/immomo/mwc/sdk/EventType;->MK_DESTROY:Lcom/immomo/mwc/sdk/EventType;

    .line 31
    .line 32
    iget-object v3, p0, Ll/arw;->a:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v4, Ll/arw$a;

    .line 35
    .line 36
    invoke-direct {v4, p0}, Ll/arw$a;-><init>(Ll/arw;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, v2, v3, v0, v4}, Ll/byl;->b(Lcom/immomo/mwc/sdk/EventType;Ljava/lang/String;Lorg/json/JSONObject;Ll/z84;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/arw;->a:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/immomo/mwc/sdk/MWCEngine;->i(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    iput-boolean v0, p0, Ll/arw;->d:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    .line 50
    return-void

    .line 51
    :catchall_0
    move-exception v0

    .line 52
    iget-object p0, p0, Ll/arw;->a:Ljava/lang/String;

    .line 53
    .line 54
    const-string v1, "holder release exception @error=%s"

    .line 55
    .line 56
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v2, "MWCHolder"

    .line 61
    .line 62
    invoke-static {v2, p0, v1, v0}, Lcom/immomo/mwc/sdk/MWCEngine;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public finalize()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/arw;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/arw;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "MWCHolder"

    .line 19
    .line 20
    const-string v3, "holder finalize success @hashCode=%s"

    .line 21
    .line 22
    invoke-static {v2, v0, v3, v1}, Lcom/immomo/mwc/sdk/MWCEngine;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
