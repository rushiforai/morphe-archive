.class public Lhy;
.super Lg3k;
.source "SourceFile"


# instance fields
.field public final synthetic f:B

.field public final g:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lt9f;Ljava/lang/String;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lhy;->f:B

    const/4 p4, 0x5

    invoke-direct {p0, p2, p1, p4}, Lg3k;-><init>(Ljava/lang/String;Lt9f;I)V

    iput-object p3, p0, Lhy;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/String;)V
    .registers 3

    iget-byte p1, p0, Lhy;->f:B

    iget-object v0, p0, Lhy;->g:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_1e

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lhy;->h(I)V

    return-void

    :pswitch_c
    check-cast v0, Lez;

    if-eqz v0, :cond_15

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, p0}, Lez;->run(Ljava/lang/Object;)V

    :cond_15
    return-void

    :pswitch_16
    check-cast v0, Lcom/opera/api/Callback;

    const/4 p0, 0x0

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_16
        :pswitch_c
    .end packed-switch
.end method

.method public final d(Lpzh;[B)V
    .registers 7

    iget-byte v0, p0, Lhy;->f:B

    const-string v1, "Bad response"

    iget-object v2, p0, Lhy;->g:Ljava/lang/Object;

    const/16 v3, 0xc8

    packed-switch v0, :pswitch_data_74

    iget p1, p1, Lpzh;->d:I

    invoke-virtual {p0, p1}, Lhy;->h(I)V

    return-void

    :pswitch_11
    iget p1, p1, Lpzh;->d:I

    if-ne p1, v3, :cond_52

    :try_start_15
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p2}, Ljava/lang/String;-><init>([B)V

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "ok"

    const-string v0, "ret"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eqz p2, :cond_41

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_35} :catch_49

    check-cast v2, Lez;

    if-eqz v2, :cond_55

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {v2, p0}, Lez;->run(Ljava/lang/Object;)V

    goto :goto_55

    :cond_41
    :try_start_41
    new-instance p1, Lorg/json/JSONException;

    const-string p2, "ret is null"

    invoke-direct {p1, p2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_49
    .catch Lorg/json/JSONException; {:try_start_41 .. :try_end_49} :catch_49

    :catch_49
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lhy;->c(Ljava/lang/String;)V

    goto :goto_55

    :cond_52
    invoke-virtual {p0, v1}, Lhy;->c(Ljava/lang/String;)V

    :cond_55
    :goto_55
    return-void

    :pswitch_56
    check-cast v2, Lcom/opera/api/Callback;

    iget p1, p1, Lpzh;->d:I

    if-ne p1, v3, :cond_65

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p2}, Ljava/lang/String;-><init>([B)V

    invoke-interface {v2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_72

    :cond_65
    const/16 p2, 0xcc

    if-ne p1, p2, :cond_6f

    const-string p0, ""

    invoke-interface {v2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_72

    :cond_6f
    invoke-virtual {p0, v1}, Lhy;->c(Ljava/lang/String;)V

    :goto_72
    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_56
        :pswitch_11
    .end packed-switch
.end method

.method public e(Lfvh;)V
    .registers 4

    iget-byte p0, p0, Lhy;->f:B

    const-string v0, "application/json"

    const-string v1, "accept"

    packed-switch p0, :pswitch_data_18

    const-string p0, "*/*"

    invoke-virtual {p1, v1, p0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_f
    invoke-virtual {p1, v1, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_13
    invoke-virtual {p1, v1, v0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_f
    .end packed-switch
.end method

.method public final h(I)V
    .registers 4

    iget-object p0, p0, Lhy;->g:Ljava/lang/Object;

    check-cast p0, Lly;

    if-eqz p0, :cond_2f

    div-int/lit8 p1, p1, 0x64

    const/4 v0, 0x2

    const/4 v1, 0x1

    if-eq p1, v0, :cond_e

    iput-boolean v1, p0, Lly;->d:Z

    :cond_e
    iget p1, p0, Lly;->c:I

    add-int/2addr p1, v1

    iput p1, p0, Lly;->c:I

    iget v0, p0, Lly;->b:I

    if-ne p1, v0, :cond_2f

    iget-boolean p1, p0, Lly;->d:Z

    if-nez p1, :cond_2f

    iget-object p1, p0, Lly;->f:Ljava/lang/Object;

    check-cast p1, Li5o;

    iget-object p0, p0, Lly;->e:Ljava/lang/Object;

    check-cast p0, Lr9i;

    iget-object v0, p1, Li5o;->a:Ljava/lang/Object;

    check-cast v0, Liy;

    new-instance v1, Lwr9;

    invoke-direct {v1, p1, p0}, Lwr9;-><init>(Li5o;Lr9i;)V

    invoke-virtual {v0, v1}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_2f
    return-void
.end method
