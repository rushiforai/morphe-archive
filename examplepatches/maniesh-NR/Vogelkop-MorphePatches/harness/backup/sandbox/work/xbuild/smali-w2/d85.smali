.class public final synthetic Ld85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh85;


# direct methods
.method public synthetic constructor <init>(Lh85;B)V
    .registers 3

    iput-byte p2, p0, Ld85;->a:B

    iput-object p1, p0, Ld85;->b:Lh85;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Ld85;->a:B

    iget-object p0, p0, Ld85;->b:Lh85;

    packed-switch v0, :pswitch_data_42

    check-cast p1, Ljava/util/LinkedHashSet;

    iget-object p1, p0, Lh85;->h:Ls9i;

    iget-object v0, p0, Lh85;->i:Lg2l;

    iget-object v0, v0, Lg2l;->a:Ljava/util/List;

    check-cast v0, Ljava/util/Collection;

    invoke-virtual {p1, v0}, Ls9i;->X(Ljava/util/Collection;)Z

    move-result p1

    iget-object p0, p0, Lh85;->b:Li85;

    iget-object p0, p0, Li85;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    return-void

    :pswitch_1d
    check-cast p1, Lqyi;

    iget-object p1, p0, Lh85;->b:Li85;

    iget-object v0, p1, Li85;->i:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v1, p1, Li85;->h:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v0, :cond_41

    if-eqz v1, :cond_41

    iget-object p0, p0, Lh85;->h:Ls9i;

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result p0

    const/4 v0, 0x0

    const/4 v2, 0x4

    if-eqz p0, :cond_35

    move v3, v2

    goto :goto_36

    :cond_35
    move v3, v0

    :goto_36
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Li85;->i:Lcom/opera/android/custom_views/StylingImageButton;

    if-nez p0, :cond_3e

    move v0, v2

    :cond_3e
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_41
    return-void

    :pswitch_data_42
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
