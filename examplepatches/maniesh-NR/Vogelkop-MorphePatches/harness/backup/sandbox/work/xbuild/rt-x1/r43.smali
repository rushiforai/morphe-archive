.class public abstract Lr43;
.super Lp43;
.source "SourceFile"


# virtual methods
.method public final f(Lpzh;)V
    .registers 4

    :try_start_0
    new-instance v0, Lorb;

    iget-object p1, p1, Lpzh;->g:Lvzh;

    invoke-virtual {p1}, Lvzh;->string()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lr43;->g(Lorb;)V
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_e} :catch_f

    return-void

    :catch_f
    new-instance p1, Lq43;

    const/4 v0, -0x1

    const-string v1, "JSON exception"

    invoke-direct {p1, v0, v1}, Lq43;-><init>(ILjava/lang/String;)V

    invoke-virtual {p0, p1}, Lp43;->a(Lq43;)V

    return-void
.end method

.method public abstract g(Lorb;)V
.end method
