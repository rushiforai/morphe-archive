.class public final Lorb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .registers 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorb;->a:Lorg/json/JSONObject;

    return-void
.end method

.method public static t(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    if-nez p0, :cond_5

    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    return-object p0

    :cond_5
    instance-of v0, p0, Lorb;

    if-eqz v0, :cond_e

    check-cast p0, Lorb;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    return-object p0

    :cond_e
    instance-of v0, p0, Lvpb;

    if-eqz v0, :cond_16

    check-cast p0, Lvpb;

    iget-object p0, p0, Lvpb;->a:Lorg/json/JSONArray;

    :cond_16
    return-object p0
.end method

.method public static u(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    if-eqz p0, :cond_1f

    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p0, v0, :cond_1f

    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_12

    new-instance v0, Lorb;

    check-cast p0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorb;-><init>(Lorg/json/JSONObject;)V

    return-object v0

    :cond_12
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_1e

    new-instance v0, Lvpb;

    check-cast p0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    return-object v0

    :cond_1e
    return-object p0

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final b(Ljava/lang/String;)Lvpb;
    .registers 3

    new-instance v0, Lvpb;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-direct {v0, p0}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    return-object v0
.end method

.method public final c(Ljava/lang/String;)Lorb;
    .registers 3

    new-instance v0, Lorb;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-direct {v0, p0}, Lorb;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public final d(Ljava/lang/String;)J
    .registers 2

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide p0

    return-wide p0
.end method

.method public final e(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0, p1}, Lorb;->a(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_b
    new-instance p0, Lorg/json/JSONException;

    const-string v0, " is null"

    invoke-static {p1, v0}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_15

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorb;

    if-ne v0, v1, :cond_15

    check-cast p1, Lorb;

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_15
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Ljava/lang/String;)Z
    .registers 3

    const/4 v0, 0x0

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public final g(Ljava/lang/String;)I
    .registers 3

    const/4 v0, 0x0

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public final h(Ljava/lang/String;)Lvpb;
    .registers 2

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    new-instance p1, Lvpb;

    invoke-direct {p1, p0}, Lvpb;-><init>(Lorg/json/JSONArray;)V

    return-object p1
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final i(Ljava/lang/String;)Lorb;
    .registers 2

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    new-instance p1, Lorb;

    invoke-direct {p1, p0}, Lorb;-><init>(Lorg/json/JSONObject;)V

    return-object p1
.end method

.method public final j(Ljava/lang/String;)J
    .registers 4

    const-wide/16 v0, 0x0

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public final k(Ljava/lang/String;)Ljava/lang/Boolean;
    .registers 3

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_c

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :cond_c
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x0

    return-object p0

    :cond_15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0
.end method

.method public final l(Ljava/lang/String;)Ljava/lang/Long;
    .registers 6

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-wide/high16 v0, -0x8000000000000000L

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-nez v0, :cond_1d

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide p0

    cmp-long p0, p0, v0

    if-nez p0, :cond_18

    const/4 p0, 0x0

    return-object p0

    :cond_18
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0

    :cond_1d
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_11

    sget-object p1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq p0, p1, :cond_11

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_11
    return-object p2
.end method

.method public final n(ILjava/lang/String;)V
    .registers 3

    :try_start_0
    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final o(JLjava/lang/String;)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p3, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final p(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    :try_start_0
    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_9} :catch_a

    return-void

    :catch_a
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final q(Ljava/lang/String;D)V
    .registers 4

    :try_start_0
    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final r(Ljava/lang/String;Z)V
    .registers 3

    :try_start_0
    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_5} :catch_6

    return-void

    :catch_6
    move-exception p0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final s(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0, p1, p2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
