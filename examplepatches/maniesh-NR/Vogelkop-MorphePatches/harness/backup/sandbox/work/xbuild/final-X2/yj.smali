.class public final synthetic Lyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxjj;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Llk;


# direct methods
.method public synthetic constructor <init>(Llk;B)V
    .registers 3

    iput-byte p2, p0, Lyj;->a:B

    iput-object p1, p0, Lyj;->b:Llk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 5

    iget-byte v0, p0, Lyj;->a:B

    iget-object p0, p0, Lyj;->b:Llk;

    packed-switch v0, :pswitch_data_6a

    check-cast p1, Lak;

    check-cast p2, Lek;

    iget-object p2, p2, Lek;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, p1, Lak;->X:Lpxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v0, p1, Lak;->Y:Lpxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-boolean v0, p1, Lak;->a0:Z

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v0, Lxj;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    new-instance v0, Lnf;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    return-void

    :pswitch_2e
    check-cast p1, Lzj;

    check-cast p2, Ldk;

    iget-object p2, p2, Ldk;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, p1, Lzj;->X:Lpxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v0, p1, Lzj;->Y:Lpxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-boolean v0, p1, Lzj;->Z:Z

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v0, Lxj;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void

    :pswitch_4c
    check-cast p1, Lck;

    check-cast p2, Lgk;

    iget-object p2, p2, Lgk;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, p1, Lck;->W:Lrxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v0, p1, Lck;->X:Lrxh;

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-boolean v0, p1, Lck;->Y:Z

    invoke-virtual {p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v0, Lxj;

    invoke-direct {v0, p1, p0}, Lxj;-><init>(Lck;Llk;)V

    iput-object v0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_2e
    .end packed-switch
.end method
