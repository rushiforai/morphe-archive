.class public final Lwq8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsq8;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwq8;->a:B

    iput-object p1, p0, Lwq8;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Lhq8;)V
    .registers 2

    return-void
.end method

.method private final b(ILhq8;)V
    .registers 3

    return-void
.end method

.method private final c(ILhq8;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final B(ILhq8;)V
    .registers 3

    iget-byte p1, p0, Lwq8;->a:B

    iget-object p0, p0, Lwq8;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_38

    check-cast p0, Lzzj;

    invoke-virtual {p2}, Lhq8;->j()Z

    move-result p1

    if-nez p1, :cond_1d

    iget-object p1, p0, Lzzj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {p1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Lzzj;->a:Lvnj;

    invoke-static {p2}, Lzzj;->a(Lhq8;)Lknj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lvnj;->j(Lknj;)V

    :cond_1d
    return-void

    :pswitch_1e
    check-cast p0, Ltlg;

    invoke-virtual {p0}, Ltlg;->S()V

    return-void

    :pswitch_24
    check-cast p0, Lar8;

    iget-object p1, p0, Lar8;->r:Ltq8;

    if-ne p2, p1, :cond_36

    const/4 p1, 0x0

    iput-object p1, p0, Lar8;->r:Ltq8;

    iget-object p1, p0, Lar8;->p:Landroid/view/View;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Lar8;->o0()V

    :cond_36
    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_24
        :pswitch_1e
    .end packed-switch
.end method

.method public final u(ILhq8;)V
    .registers 3

    iget-byte p1, p0, Lwq8;->a:B

    packed-switch p1, :pswitch_data_e

    return-void

    :pswitch_6
    iget-object p0, p0, Lwq8;->b:Ljava/lang/Object;

    check-cast p0, Ltlg;

    invoke-virtual {p0}, Ltlg;->S()V

    :pswitch_d
    return-void

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_d
        :pswitch_6
    .end packed-switch
.end method

.method public final w(Lhq8;)V
    .registers 3

    iget-byte v0, p0, Lwq8;->a:B

    iget-object p0, p0, Lwq8;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e

    check-cast p0, Lzzj;

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    if-nez v0, :cond_26

    iget-object v0, p0, Lzzj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lzzj;->e:Lyzj;

    invoke-virtual {p1, v0}, Lhq8;->b(Lgq8;)V

    :cond_1c
    iget-object p0, p0, Lzzj;->a:Lvnj;

    invoke-static {p1}, Lzzj;->a(Lhq8;)Lknj;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lvnj;->f(Lknj;Lkotlin/jvm/functions/Function1;)Lifd;

    :cond_26
    return-void

    :pswitch_27
    check-cast p0, Ltlg;

    invoke-virtual {p0}, Ltlg;->S()V

    :pswitch_2c
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_27
    .end packed-switch
.end method
