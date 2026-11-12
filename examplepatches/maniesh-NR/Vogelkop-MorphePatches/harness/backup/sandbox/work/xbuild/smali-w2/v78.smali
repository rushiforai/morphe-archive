.class public final Lv78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr7n;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lv78;->a:B

    iput-object p1, p0, Lv78;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final c(Ljava/lang/Class;)Ll7n;
    .registers 11

    iget-byte v0, p0, Lv78;->a:B

    iget-object p0, p0, Lv78;->b:Ljava/lang/Object;

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Lh1b;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    move-result v0

    const/4 v2, 0x0

    :cond_f
    if-ge v2, v0, :cond_21

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lmkf;

    invoke-interface {v3, p1}, Lmkf;->a(Ljava/lang/Class;)Ll7n;

    move-result-object v3

    if-eqz v3, :cond_f

    move-object v1, v3

    goto :goto_2e

    :cond_21
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "BrowserActivityViewModelFactory doesn\'t know how to create "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_2e
    return-object v1

    :pswitch_2f
    check-cast p0, Ldp6;

    const-class v0, Lu78;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_84

    new-instance v2, Lu78;

    iget-object v0, p0, Ldp6;->u:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lgq6;

    new-instance v4, Lbpd;

    invoke-virtual {p0}, Ldp6;->d()Lip6;

    move-result-object v0

    new-instance v5, Li3j;

    invoke-virtual {p0}, Ldp6;->b()Lole;

    move-result-object v6

    iget-object v7, p0, Ldp6;->j:Lbpd;

    iget-object v8, p0, Ldp6;->l:Llv1;

    invoke-direct {v5, v6, v7, v8}, Li3j;-><init>(Lole;Lbpd;Llv1;)V

    const/16 v6, 0xc

    invoke-direct {v4, v0, v5, v6}, Lbpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ldp6;->a()Lne5;

    move-result-object v5

    new-instance v6, Ljq6;

    invoke-virtual {p0}, Ldp6;->d()Lip6;

    move-result-object v0

    invoke-direct {v6, v0}, Ljq6;-><init>(Lip6;)V

    new-instance v7, Lqe6;

    iget-object v0, p0, Ldp6;->t:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/euicc/EuiccManager;

    const/4 v8, 0x3

    invoke-direct {v7, v0, v8}, Lqe6;-><init>(Ljava/lang/Object;B)V

    new-instance v8, Liq6;

    invoke-virtual {p0}, Ldp6;->d()Lip6;

    move-result-object p0

    invoke-direct {v8, p0}, Liq6;-><init>(Lip6;)V

    invoke-direct/range {v2 .. v8}, Lu78;-><init>(Lgq6;Lbpd;Lne5;Ljq6;Lqe6;Liq6;)V

    goto :goto_85

    :cond_84
    move-object v2, v1

    :goto_85
    if-nez v2, :cond_88

    move-object v2, v1

    :cond_88
    if-eqz v2, :cond_8c

    move-object v1, v2

    goto :goto_99

    :cond_8c
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "EsimActivityViewModelFactory doesn\'t know how to create "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_99
    return-object v1

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_2f
    .end packed-switch
.end method
