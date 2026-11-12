.class public final synthetic Lzl3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lam3;


# direct methods
.method public synthetic constructor <init>(Lam3;B)V
    .registers 3

    iput-byte p2, p0, Lzl3;->a:B

    iput-object p1, p0, Lzl3;->b:Lam3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lzl3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lzl3;->b:Lam3;

    check-cast p1, Landroid/view/View;

    packed-switch v0, :pswitch_data_32

    iget-object p1, p0, Lam3;->n:Lx5f;

    sget-object v0, Lz80;->c:Lz80;

    invoke-virtual {p1, v0}, Lx5f;->X(Lz80;)V

    iget-object p0, p0, Lam3;->l:Lhxk;

    check-cast p0, Lkxk;

    iget-object p0, p0, Lkxk;->f:Landroidx/fragment/app/w;

    const/4 p1, 0x0

    invoke-static {p0, v1, p1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e
    iget-object p1, p0, Lam3;->n:Lx5f;

    sget-object v0, Lz80;->b:Lz80;

    invoke-virtual {p1, v0}, Lx5f;->X(Lz80;)V

    iget-object p0, p0, Lam3;->k:Lom3;

    new-array p1, v1, [I

    check-cast p0, Lpm3;

    invoke-virtual {p0, p1}, Lpm3;->a([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
