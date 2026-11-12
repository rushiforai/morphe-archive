.class public final synthetic Ll6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm6k;


# direct methods
.method public synthetic constructor <init>(Lm6k;B)V
    .registers 3

    iput-byte p2, p0, Ll6k;->a:B

    iput-object p1, p0, Ll6k;->b:Lm6k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ll6k;->a:B

    iget-object p0, p0, Ll6k;->b:Lm6k;

    packed-switch v0, :pswitch_data_48

    check-cast p1, Ll5k;

    iget-object p0, p0, Lm6k;->d:Lkf;

    iget-object v0, p0, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    iget v1, p1, Ll5k;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget v3, p1, Ll5k;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    iget p1, p1, Ll5k;->b:I

    invoke-static {p1, p0}, Lp37;->t0(ILandroid/view/View;)V

    return-void

    :pswitch_28
    check-cast p1, Lv8k;

    iget-object p1, p0, Lm6k;->d:Lkf;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/startpage/SoftwareClipMaxWidthLinearLayout;

    iget-object p0, p0, Lm6k;->e:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv8k;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lv8k;->d(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
