.class public final synthetic Lexk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln5o;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxbf;


# direct methods
.method public synthetic constructor <init>(Lxbf;B)V
    .registers 3

    iput-byte p2, p0, Lexk;->a:B

    iput-object p1, p0, Lexk;->b:Lxbf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lexk;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lexk;->b:Lxbf;

    check-cast p1, Ljava/util/List;

    packed-switch v0, :pswitch_data_82

    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lglh;

    invoke-virtual {v0}, Lglh;->e()Z

    move-result v2

    if-eqz v2, :cond_17

    sput-object v1, Lxbf;->h:Lxbf;

    goto :goto_6d

    :cond_17
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_20

    sput-object v1, Lxbf;->h:Lxbf;

    goto :goto_6d

    :cond_20
    new-instance v2, Lkoj;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v3}, Lkoj;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    new-instance v4, Lvr9;

    invoke-direct {v4, v2, v3}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_33
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfxk;

    iget-object v3, v2, Lfxk;->b:Ljava/lang/String;

    new-instance v5, Ls2g;

    const/16 v6, 0xa

    invoke-direct {v5, p0, v2, v4, v6}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, v0, Lglh;->d:Lqie;

    iget-object v6, v0, Lglh;->c:Lumi;

    new-instance v7, Low3;

    const/4 v8, 0x7

    invoke-direct {v7, v0, v3, v8}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v6, v7}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v3

    new-instance v7, Lr9g;

    const/16 v8, 0xf

    invoke-direct {v7, v5, v8}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v6, v7}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v5

    invoke-virtual {v3, v5}, Lnml;->b(Lnml;)V

    new-instance v5, Loml;

    invoke-direct {v5, v3}, Loml;-><init>(Lnml;)V

    invoke-virtual {v2, v5, v1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    goto :goto_33

    :cond_6d
    :goto_6d
    return-object v1

    :pswitch_6e
    if-nez p1, :cond_73

    sput-object v1, Lxbf;->h:Lxbf;

    goto :goto_81

    :cond_73
    iget-object v0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lglh;

    new-instance v2, Leof;

    const/16 v3, 0x1b

    invoke-direct {v2, p0, p1, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lglh;->f(Lcom/opera/api/Callback;)V

    :goto_81
    return-object v1

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_6e
    .end packed-switch
.end method
