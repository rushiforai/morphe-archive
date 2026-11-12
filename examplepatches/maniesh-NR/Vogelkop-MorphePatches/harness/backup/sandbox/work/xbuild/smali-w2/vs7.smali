.class public final synthetic Lvs7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lvs7;->a:B

    iput-object p1, p0, Lvs7;->b:Ljava/lang/Object;

    iput-object p2, p0, Lvs7;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 10

    iget-byte p1, p0, Lvs7;->a:B

    iget-object p2, p0, Lvs7;->c:Ljava/lang/Object;

    iget-object p0, p0, Lvs7;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_30

    check-cast p0, Lknh;

    check-cast p2, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    sub-int/2addr p5, p3

    sub-int/2addr p9, p7

    if-eq p5, p9, :cond_14

    invoke-virtual {p0, p2}, Lknh;->H0(Lcom/opera/android/sheet/OperaBottomSheetBehavior;)V

    :cond_14
    return-void

    :pswitch_15
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    check-cast p2, Lbfl;

    iget-object p0, p0, Lcom/opera/hype/image/editor/EditImage;->g:Lbpd;

    iget-object p1, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast p1, Li97;

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    invoke-virtual {p1, p0}, Li97;->c(Lcom/opera/hype/image/editor/EditImage;)Z

    move-result p0

    if-eqz p0, :cond_2e

    sget-object p0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p2, p1}, Lbfl;->d(Li97;)V

    :cond_2e
    return-void

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
