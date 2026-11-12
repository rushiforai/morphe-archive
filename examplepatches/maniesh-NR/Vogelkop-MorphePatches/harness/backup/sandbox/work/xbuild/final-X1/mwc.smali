.class public final synthetic Lmwc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lzse;


# direct methods
.method public synthetic constructor <init>(Lzse;B)V
    .registers 3

    iput-byte p2, p0, Lmwc;->a:B

    iput-object p1, p0, Lmwc;->b:Lzse;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lmwc;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lmwc;->b:Lzse;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Ltse;

    iget-object v0, p1, Ltse;->a:Lij0;

    iget-object p1, p1, Ltse;->b:Ll0c;

    invoke-virtual {p0, v0, p1}, Lzse;->H0(Lij0;Ll0c;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lzse;->t:Ly83;

    if-eqz p0, :cond_1b

    move-object v1, p0

    :cond_1b
    iget-object p0, v1, Ly83;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {p0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25
    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_30

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_40

    :cond_30
    iget-object p0, p0, Lzse;->t:Ly83;

    if-eqz p0, :cond_35

    move-object v1, p0

    :cond_35
    iget-object p0, v1, Ly83;->h:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_40
    return-object p0

    nop

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_25
        :pswitch_14
    .end packed-switch
.end method
