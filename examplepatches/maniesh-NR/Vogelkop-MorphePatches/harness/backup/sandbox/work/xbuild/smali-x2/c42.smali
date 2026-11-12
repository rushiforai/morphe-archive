.class public final synthetic Lc42;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt40;


# direct methods
.method public synthetic constructor <init>(Lt40;B)V
    .registers 3

    iput-byte p2, p0, Lc42;->a:B

    iput-object p1, p0, Lc42;->b:Lt40;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lc42;->a:B

    const-string v1, "message"

    const-string v2, "code"

    const-string v3, "error"

    const/4 v4, 0x0

    iget-object p0, p0, Lc42;->b:Lt40;

    check-cast p1, Lorb;

    packed-switch v0, :pswitch_data_88

    new-instance v0, Lc42;

    invoke-direct {v0, p0, v4}, Lc42;-><init>(Lt40;B)V

    iget-object v4, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    invoke-virtual {p1, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    iget-object v0, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcqb;

    invoke-direct {v1, v0, p1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lt40;->n(Ltw7;)V

    goto :goto_3c

    :cond_39
    invoke-virtual {v0, p1}, Lc42;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3f
    const-string v0, "result"

    invoke-virtual {p1, v0}, Lorb;->i(Ljava/lang/String;)Lorb;

    move-result-object p1

    if-eqz p1, :cond_7b

    invoke-virtual {p1, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    iget-object v0, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lxnm;->values()[Lxnm;

    move-result-object v0

    array-length v1, v0

    :goto_5a
    if-ge v4, v1, :cond_73

    aget-object v5, v0, v4

    sget-object v6, Lxnm;->c:Lxnm;

    if-eq v5, v6, :cond_70

    iget-wide v6, v5, Lxnm;->a:J

    cmp-long v6, v2, v6

    if-nez v6, :cond_70

    iget-object v6, v5, Lxnm;->b:Ljava/lang/String;

    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_75

    :cond_70
    add-int/lit8 v4, v4, 0x1

    goto :goto_5a

    :cond_73
    sget-object v5, Lxnm;->c:Lxnm;

    :cond_75
    new-instance p1, La42;

    invoke-direct {p1, v5}, La42;-><init>(Lxnm;)V

    goto :goto_7c

    :cond_7b
    const/4 p1, 0x0

    :goto_7c
    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lt40;->n(Ltw7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_3f
    .end packed-switch
.end method
