.class public final Lmj8;
.super Lnjf;
.source "SourceFile"


# instance fields
.field public final a:Lnj8;

.field public final b:Ldg7;

.field public c:Z


# direct methods
.method public constructor <init>(Lnj8;Ldg7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmj8;->a:Lnj8;

    iput-object p2, p0, Lmj8;->b:Ldg7;

    return-void
.end method


# virtual methods
.method public final a(I)I
    .registers 2

    return p1
.end method

.method public final b()V
    .registers 1

    iget-object p0, p0, Lmj8;->a:Lnj8;

    invoke-interface {p0}, Lnj8;->W()V

    return-void
.end method

.method public final c(Landroid/view/View;F)V
    .registers 5

    invoke-static {p1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v0, 0x3

    iget-object v1, p0, Lmj8;->b:Ldg7;

    if-ne p1, v0, :cond_15

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {v1, p1}, Ldg7;->run(Ljava/lang/Object;)V

    goto :goto_1c

    :cond_15
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {v1, p1}, Ldg7;->run(Ljava/lang/Object;)V

    :goto_1c
    iget-object p0, p0, Lmj8;->a:Lnj8;

    invoke-interface {p0}, Lnj8;->K()V

    return-void
.end method

.method public final d(I)V
    .registers 3

    iget-object v0, p0, Lmj8;->b:Ldg7;

    packed-switch p1, :pswitch_data_32

    goto :goto_13

    :pswitch_6
    const/high16 p1, -0x40800000    # -1.0f

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {v0, p1}, Ldg7;->run(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lmj8;->c:Z

    if-nez p1, :cond_14

    :goto_13
    return-void

    :cond_14
    iget-object p0, p0, Lmj8;->a:Lnj8;

    invoke-interface {p0}, Lnj8;->F()V

    return-void

    :pswitch_1a
    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-virtual {v0, p0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_23
    const/high16 p0, 0x3f800000    # 1.0f

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    invoke-virtual {v0, p0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2d
    const/4 p1, 0x1

    iput-boolean p1, p0, Lmj8;->c:Z

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x1
        :pswitch_2d
        :pswitch_2d
        :pswitch_23
        :pswitch_1a
        :pswitch_1a
        :pswitch_6
    .end packed-switch
.end method
