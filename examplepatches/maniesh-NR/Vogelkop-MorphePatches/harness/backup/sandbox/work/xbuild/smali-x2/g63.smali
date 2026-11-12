.class public final synthetic Lg63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    iput-byte p3, p0, Lg63;->a:B

    iput-object p1, p0, Lg63;->c:Ljava/lang/Object;

    iput p2, p0, Lg63;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lg63;->a:B

    iget v0, p0, Lg63;->b:I

    iget-object p0, p0, Lg63;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_a8

    check-cast p0, Ltg7;

    iget-object p0, p0, Ltg7;->e:Ljava/lang/Object;

    check-cast p0, Lwrl;

    iget-object p0, p0, Lwrl;->b:Lh73;

    iget-object p0, p0, Lh73;->a:Lf7d;

    const/4 p1, 0x0

    if-eqz v0, :cond_41

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3b

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2d

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lexe;

    invoke-direct {v0}, Lexe;-><init>()V

    iget-object p0, p0, Lf7d;->b:Lgjm;

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    goto :goto_4b

    :cond_2d
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lqk;

    invoke-direct {v0}, Lqk;-><init>()V

    iget-object p0, p0, Lf7d;->b:Lgjm;

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    goto :goto_4b

    :cond_3b
    const-class p1, Ltc6;

    invoke-virtual {p0, p1}, Lf7d;->a(Ljava/lang/Class;)V

    goto :goto_4b

    :cond_41
    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance v0, Lvfn;

    invoke-direct {v0}, Lvfn;-><init>()V

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    :cond_4b
    :goto_4b
    return-void

    :pswitch_4c
    check-cast p0, Lky7;

    iget-object p1, p0, Lky7;->e:Ljava/lang/Object;

    check-cast p1, Luig;

    iget v1, p0, Lky7;->b:I

    if-eq v0, v1, :cond_78

    iget-object p0, p0, Lky7;->d:Ljava/lang/Object;

    check-cast p0, [F

    aget p0, p0, v0

    iget-object v0, p1, Luig;->o0:Lgig;

    if-eqz v0, :cond_78

    const/16 v1, 0xd

    invoke-interface {v0, v1}, Lgig;->C(I)Z

    move-result v0

    if-eqz v0, :cond_78

    iget-object v0, p1, Luig;->o0:Lgig;

    invoke-interface {v0}, Lgig;->getPlaybackParameters()Lthg;

    move-result-object v1

    new-instance v2, Lthg;

    iget v1, v1, Lthg;->b:F

    invoke-direct {v2, p0, v1}, Lthg;-><init>(FF)V

    invoke-interface {v0, v2}, Lgig;->c(Lthg;)V

    :cond_78
    iget-object p0, p1, Luig;->q:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void

    :pswitch_7e
    check-cast p0, Lzzb;

    iget p1, p0, Lzzb;->d:I

    if-ne v0, p1, :cond_87

    invoke-virtual {p0}, Lzzb;->G()V

    :cond_87
    return-void

    :pswitch_88
    check-cast p0, Lky7;

    iget-object p1, p0, Lky7;->d:Ljava/lang/Object;

    check-cast p1, Lry7;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v1}, Lry7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p0, Lky7;->b:I

    if-eq v0, p1, :cond_a1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    iput v0, p0, Lky7;->b:I

    :cond_a1
    return-void

    :pswitch_a2
    check-cast p0, Ldw7;

    iput v0, p0, Ldw7;->c:I

    return-void

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_a2
        :pswitch_88
        :pswitch_7e
        :pswitch_4c
    .end packed-switch
.end method
