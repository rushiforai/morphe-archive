.class public final synthetic Ljjh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly83;


# direct methods
.method public synthetic constructor <init>(Ly83;B)V
    .registers 3

    iput-byte p2, p0, Ljjh;->a:B

    iput-object p1, p0, Ljjh;->b:Ly83;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Ljjh;->a:B

    iget-object p0, p0, Ljjh;->b:Ly83;

    check-cast p1, Ljava/lang/Integer;

    packed-switch v0, :pswitch_data_26

    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17
    iget-object p0, p0, Ly83;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_17
    .end packed-switch
.end method
