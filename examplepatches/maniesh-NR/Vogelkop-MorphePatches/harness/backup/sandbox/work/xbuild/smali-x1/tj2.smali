.class public final synthetic Ltj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvj2;

.field public final synthetic c:Lcom/opera/api/Callback;

.field public final synthetic d:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lvj2;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V
    .registers 5

    iput-byte p4, p0, Ltj2;->a:B

    iput-object p1, p0, Ltj2;->b:Lvj2;

    iput-object p2, p0, Ltj2;->c:Lcom/opera/api/Callback;

    iput-object p3, p0, Ltj2;->d:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Ltj2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_6a

    iget-object v0, p0, Ltj2;->b:Lvj2;

    iget-object v3, p0, Ltj2;->d:Lcom/opera/api/Callback;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Ltj2;->c:Lcom/opera/api/Callback;

    if-nez p1, :cond_17

    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_35

    :cond_17
    :try_start_17
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    iget-object v2, v0, Lvj2;->a:Lumi;

    new-instance v4, Luj2;

    invoke-direct {v4, v0, p1, p0, v3}, Luj2;-><init>(Lvj2;[BLcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    invoke-interface {v2, v4}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    invoke-virtual {p1, v1}, Lnml;->a(Ljava/lang/Object;)Loml;
    :try_end_29
    .catch Ljava/lang/IllegalArgumentException; {:try_start_17 .. :try_end_29} :catch_2a

    goto :goto_35

    :catch_2a
    iget-object p1, v0, Lvj2;->c:Ljjn;

    invoke-virtual {p1}, Ljjn;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldjn;

    invoke-interface {p1, p0, v3}, Ldjn;->a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    :goto_35
    return-void

    :pswitch_36
    iget-object v5, p0, Ltj2;->b:Lvj2;

    iget-object v8, p0, Ltj2;->d:Lcom/opera/api/Callback;

    check-cast p1, Ljava/lang/String;

    iget-object v6, p0, Ltj2;->c:Lcom/opera/api/Callback;

    if-nez p1, :cond_44

    invoke-interface {v6, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_68

    :cond_44
    const/4 p0, 0x2

    :try_start_45
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v7

    new-instance v4, Luj2;

    const/4 v9, 0x0

    invoke-direct/range {v4 .. v9}, Luj2;-><init>(Lvj2;Lcom/opera/api/Callback;[BLcom/opera/api/Callback;B)V

    new-instance p1, Ln32;

    invoke-direct {p1, v8, p0}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {v5, v4, p1}, Lvj2;->c(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    :try_end_57
    .catch Ljava/lang/IllegalArgumentException; {:try_start_45 .. :try_end_57} :catch_58

    goto :goto_68

    :catch_58
    iget-object p1, v5, Lvj2;->c:Ljjn;

    invoke-virtual {p1}, Ljjn;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldjn;

    new-instance v0, Lj12;

    invoke-direct {v0, v6, p0}, Lj12;-><init>(Lcom/opera/api/Callback;B)V

    invoke-interface {p1, v0, v8}, Ldjn;->a(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    :goto_68
    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
