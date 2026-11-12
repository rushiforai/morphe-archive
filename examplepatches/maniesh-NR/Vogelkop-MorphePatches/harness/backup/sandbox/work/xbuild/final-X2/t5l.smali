.class public final synthetic Lt5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lz5l;


# direct methods
.method public synthetic constructor <init>(Lz5l;B)V
    .registers 3

    iput-byte p2, p0, Lt5l;->a:B

    iput-object p1, p0, Lt5l;->b:Lz5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lt5l;->a:B

    iget-object p0, p0, Lt5l;->b:Lz5l;

    packed-switch v0, :pswitch_data_76

    check-cast p1, Ljava/lang/Runnable;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11
    check-cast p1, Ljava/lang/Runnable;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b
    check-cast p1, Ljava/lang/Runnable;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lz5l;->u:Lypd;

    iget-object p0, p0, Lz5l;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget v1, v1, Leyj;->F:I

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->G:I

    invoke-virtual {v0, p1, v1, p0}, Lypd;->J(III)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_45
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lz5l;->u:Lypd;

    iget-object p0, p0, Lz5l;->c:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->E:I

    iget-object v0, v0, Lypd;->c:Ljava/lang/Object;

    check-cast v0, Lz5l;

    invoke-virtual {v0}, Lz5l;->b()V

    iget-object v0, v0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, p1, p0}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_66
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Lz5l;->u:Lypd;

    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-static {p0, p1, v0, v1}, Lypd;->K(Lypd;III)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_66
        :pswitch_45
        :pswitch_25
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
