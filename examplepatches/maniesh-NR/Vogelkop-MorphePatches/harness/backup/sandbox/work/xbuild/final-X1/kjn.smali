.class public final synthetic Lkjn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ld7k;


# direct methods
.method public synthetic constructor <init>(Ld7k;B)V
    .registers 3

    iput-byte p2, p0, Lkjn;->a:B

    iput-object p1, p0, Lkjn;->b:Ld7k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lkjn;->a:B

    iget-object p0, p0, Lkjn;->b:Ld7k;

    packed-switch v0, :pswitch_data_5a

    check-cast p1, Lfsb;

    sget-object v0, Lfsb;->a:Lfsb;

    if-ne p1, v0, :cond_13

    sget-object p1, Lljn;->a:Lljn;

    invoke-virtual {p0, p1}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18

    :cond_13
    sget-object p1, Lljn;->b:Lljn;

    invoke-virtual {p0, p1}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_18
    return-void

    :pswitch_19
    check-cast p1, Ljava/lang/String;

    sget-object v0, Lljn;->b:Lljn;

    :try_start_1d
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    new-instance v1, Lmjn;

    const-string v2, "mnemonic"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_49

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lmjn;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_58

    :cond_49
    new-instance p1, Lorg/json/JSONException;

    const-string v1, "mnemonic is null"

    invoke-direct {p1, v1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_51} :catch_55
    .catch Ljava/lang/NullPointerException; {:try_start_1d .. :try_end_51} :catch_51

    :catch_51
    invoke-virtual {p0, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_58

    :catch_55
    invoke-virtual {p0, v0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_58
    return-void

    nop

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_19
    .end packed-switch
.end method
