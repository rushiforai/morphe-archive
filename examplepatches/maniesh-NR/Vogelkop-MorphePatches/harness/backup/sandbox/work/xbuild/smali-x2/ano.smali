.class public final Lano;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lvoo;


# direct methods
.method public synthetic constructor <init>(Lvoo;B)V
    .registers 3

    iput-byte p2, p0, Lano;->i:B

    iput-object p1, p0, Lano;->j:Lvoo;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lano;->i:B

    const/4 v1, 0x0

    iget-object p0, p0, Lano;->j:Lvoo;

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Lvoo;->a:Loho;

    iget-object v0, v0, Loho;->l:Lsho;

    iget-object v0, v0, Lsho;->g:Ljava/util/List;

    if-eqz v0, :cond_16

    iget-object p0, p0, Lvoo;->g:Lgzo;

    invoke-static {v0, p0}, Luyg;->f(Ljava/util/List;Lgzo;)Ljava/util/ArrayList;

    move-result-object v1

    :cond_16
    return-object v1

    :pswitch_17
    iget-object v0, p0, Lvoo;->a:Loho;

    iget-object v0, v0, Loho;->l:Lsho;

    iget-object v0, v0, Lsho;->h:Ljava/util/List;

    if-eqz v0, :cond_25

    iget-object p0, p0, Lvoo;->g:Lgzo;

    invoke-static {v0, p0}, Luyg;->f(Ljava/util/List;Lgzo;)Ljava/util/ArrayList;

    move-result-object v1

    :cond_25
    return-object v1

    :pswitch_26
    iget-object v0, p0, Lvoo;->a:Loho;

    iget-object v0, v0, Loho;->l:Lsho;

    iget-object v0, v0, Lsho;->i:Ljava/util/List;

    if-eqz v0, :cond_34

    iget-object p0, p0, Lvoo;->g:Lgzo;

    invoke-static {v0, p0}, Luyg;->f(Ljava/util/List;Lgzo;)Ljava/util/ArrayList;

    move-result-object v1

    :cond_34
    return-object v1

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_26
        :pswitch_17
    .end packed-switch
.end method
