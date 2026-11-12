.class public final Lfwd;
.super Ldwd;
.source "SourceFile"


# instance fields
.field public final synthetic g:B


# direct methods
.method public synthetic constructor <init>(Lmej;Lhb9;B)V
    .registers 4

    iput-byte p3, p0, Lfwd;->g:B

    invoke-direct {p0, p1, p2}, Ldwd;-><init>(Lmej;Lhb9;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 5

    iget-byte v0, p0, Lfwd;->g:B

    packed-switch v0, :pswitch_data_70

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lvs;->d(Landroid/view/LayoutInflater;)Lvs;

    move-result-object p1

    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1, v0}, Ldwd;->g(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    iget-object v0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f140789

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Ldwd;->e()V

    iget-object p0, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0

    :pswitch_2a
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-static {p1}, Lvs;->d(Landroid/view/LayoutInflater;)Lvs;

    move-result-object p1

    iget-object v0, p1, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/LinearLayout;

    iget-object v1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1, v0}, Ldwd;->g(Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;)V

    iget-object v0, p1, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p0, Ldwd;->d:Lhb9;

    check-cast v1, Lkb9;

    iget-object v1, v1, Lkb9;->e:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Lewd;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lewd;-><init>(Lfwd;B)V

    const v1, 0x7f1404f7

    const v2, 0x7f080533

    invoke-virtual {p0, v1, v2, v0}, Ldwd;->d(IILjava/lang/Runnable;)V

    new-instance v0, Lewd;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lewd;-><init>(Lfwd;B)V

    const v1, 0x7f140508

    const v2, 0x7f0805f4

    invoke-virtual {p0, v1, v2, v0}, Ldwd;->d(IILjava/lang/Runnable;)V

    invoke-virtual {p0}, Ldwd;->e()V

    iget-object p0, p1, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    return-object p0

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_2a
    .end packed-switch
.end method
