.class public final Lixn;
.super Ljxn;
.source "SourceFile"


# instance fields
.field public final g:Lkf;


# direct methods
.method public constructor <init>(Lkf;Ltzi;)V
    .registers 4

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/RelativeLayout;

    invoke-direct {p0, v0, p2}, Lyzi;-><init>(Landroid/view/View;Ltzi;)V

    iput-object p1, p0, Lixn;->g:Lkf;

    return-void
.end method


# virtual methods
.method public final Y()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final j0(Lvtn;)V
    .registers 2

    check-cast p1, Lytn;

    invoke-virtual {p0}, Lyzi;->U()V

    iput-object p1, p0, Ljxn;->f:Lvtn;

    iget-object p0, p0, Lixn;->g:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lytn;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
