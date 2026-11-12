.class public final synthetic Lbv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lev7;


# direct methods
.method public synthetic constructor <init>(Lev7;B)V
    .registers 3

    iput-byte p2, p0, Lbv7;->a:B

    iput-object p1, p0, Lbv7;->b:Lev7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lbv7;->a:B

    iget-object p0, p0, Lbv7;->b:Lev7;

    packed-switch v0, :pswitch_data_4e

    check-cast p1, Lndc;

    iget-object p0, p0, Lev7;->o:Ljava/lang/Object;

    check-cast p0, Lknl;

    invoke-virtual {p0}, Lknl;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13
    check-cast p1, Ljava/lang/Boolean;

    iget-object p0, p0, Lev7;->f:Ljava/lang/Object;

    check-cast p0, Lvs;

    iget-object p0, p0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_25

    const/4 p1, 0x0

    goto :goto_27

    :cond_25
    const/16 p1, 0x8

    :goto_27
    invoke-virtual {p0, p1}, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2d
    check-cast p1, Landroid/content/res/Configuration;

    iget-object p0, p0, Lev7;->f:Ljava/lang/Object;

    check-cast p0, Lvs;

    iget-object p0, p0, Lvs;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/search/behavior/ScrollableToolbarLinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lm9f;->d(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0, p1, v0, p1, v1}, Landroid/view/View;->setPadding(IIII)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2d
        :pswitch_13
    .end packed-switch
.end method
