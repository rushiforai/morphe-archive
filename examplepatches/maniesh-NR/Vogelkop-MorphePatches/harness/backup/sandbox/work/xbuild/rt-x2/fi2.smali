.class public final synthetic Lfi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls14;


# direct methods
.method public synthetic constructor <init>(Ls14;B)V
    .registers 3

    iput-byte p2, p0, Lfi2;->a:B

    iput-object p1, p0, Lfi2;->b:Ls14;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lfi2;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lfi2;->b:Ls14;

    packed-switch v0, :pswitch_data_66

    check-cast p1, Lorb;

    iget-object v0, p0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lmgh;

    iget-object v2, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/api/Callback;

    if-eqz v2, :cond_50

    :try_start_14
    const-string v2, "2fa_error"

    const-string v3, "error"

    invoke-virtual {p1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_45

    iget-boolean v2, p0, Ls14;->b:Z

    if-eqz v2, :cond_32

    iget-object v2, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v2, Liyk;

    if-eqz v2, :cond_45

    iput-object v1, p0, Ls14;->e:Ljava/lang/Object;

    invoke-virtual {v2, p1}, Liyk;->run(Ljava/lang/Object;)V

    goto :goto_50

    :cond_32
    const/4 v1, 0x1

    iput-boolean v1, p0, Ls14;->b:Z

    iget-object v1, p0, Ls14;->f:Ljava/lang/Object;

    check-cast v1, Lhi2;

    iget-object v1, v1, Lhi2;->b:Lgi2;

    const-string v2, "url"

    invoke-virtual {p1, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, p1, p0}, Lgi2;->p(Ljava/lang/String;Ls14;)V

    goto :goto_50

    :cond_45
    const-string p0, "Unexpected 2fa error"

    invoke-virtual {v0, p0}, Lmgh;->e(Ljava/lang/Object;)V
    :try_end_4a
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_4a} :catch_4b

    goto :goto_50

    :catch_4b
    const-string p0, "Bad json"

    invoke-virtual {v0, p0}, Lmgh;->e(Ljava/lang/Object;)V

    :cond_50
    :goto_50
    return-void

    :pswitch_51
    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Ls14;->e:Ljava/lang/Object;

    check-cast v0, Liyk;

    if-eqz v0, :cond_5e

    iput-object v1, p0, Ls14;->e:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Liyk;->run(Ljava/lang/Object;)V

    :cond_5e
    iget-object p0, p0, Ls14;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_51
    .end packed-switch
.end method
