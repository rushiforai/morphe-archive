.class public Ll/xs80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/l4g0;

.field public b:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xs80;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public static e(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "beauty_function_type"

    .line 2
    .line 3
    const-string v1, "new"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_live_start"

    .line 14
    .line 15
    invoke-static {v1, p0, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l4g0;

    .line 6
    .line 7
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/base/preview/PreviewView;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "p_anchor_live_ready"

    .line 14
    .line 15
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 19
    .line 20
    new-instance v0, Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    const-string v1, "anchorId"

    .line 26
    .line 27
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v1

    .line 38
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object v1, p0, Ll/xs80;->a:Ll/l4g0;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget-object p0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public b(Lcom/p1/mobile/android/app/c;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 7
    .line 8
    if-ne p1, v1, :cond_1

    .line 9
    .line 10
    iget-boolean v1, p0, Ll/xs80;->b:Z

    .line 11
    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Ll/xs80;->b:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    sget-object v1, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 22
    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Ll/xs80;->b:Z

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xs80;->a:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
