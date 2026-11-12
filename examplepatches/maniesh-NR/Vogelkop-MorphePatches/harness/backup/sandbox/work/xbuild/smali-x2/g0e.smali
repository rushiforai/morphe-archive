.class public final synthetic Lg0e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbp3;


# direct methods
.method public synthetic constructor <init>(Lbp3;B)V
    .registers 3

    iput-byte p2, p0, Lg0e;->a:B

    iput-object p1, p0, Lg0e;->b:Lbp3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lg0e;->a:B

    iget-object p0, p0, Lg0e;->b:Lbp3;

    packed-switch v0, :pswitch_data_1c

    check-cast p1, Ljava/lang/Runnable;

    iget-object p0, p0, Lbp3;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Lpg;

    invoke-virtual {p0}, Lbp3;->j()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method
