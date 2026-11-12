.class public final Lyaf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final a:Lwub;

.field public final synthetic b:Lcom/opera/android/bar/OmniButtonView;


# direct methods
.method public constructor <init>(Lcom/opera/android/bar/OmniButtonView;Lwub;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyaf;->b:Lcom/opera/android/bar/OmniButtonView;

    iput-object p2, p0, Lyaf;->a:Lwub;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lyaf;->b:Lcom/opera/android/bar/OmniButtonView;

    iget-object v1, v0, Lcom/opera/android/bar/OmniButtonView;->h:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_26

    iget-object v1, v0, Lcom/opera/android/bar/OmniButtonView;->i:Landroid/animation/ValueAnimator;

    if-nez v1, :cond_26

    iget-object v0, v0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v0, :cond_26

    iget-object v1, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    iget v0, v0, Lbp;->a:I

    const/4 v2, 0x1

    and-int/2addr v0, v2

    if-nez v0, :cond_1b

    const/4 v2, 0x0

    :cond_1b
    iget-object p0, p0, Lyaf;->a:Lwub;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ldbf;

    sget-object v0, Lhbf;->b:Lhbf;

    invoke-virtual {p0, p1, v1, v2, v0}, Ldbf;->v(Landroid/view/View;Ltaf;ZLhbf;)V

    :cond_26
    return-void
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 6

    iget-object v0, p0, Lyaf;->b:Lcom/opera/android/bar/OmniButtonView;

    iget-object v0, v0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    iget-object v2, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v2, Luaf;

    iget-object v2, v2, Luaf;->a:Ltaf;

    iget v0, v0, Lbp;->a:I

    const/4 v3, 0x1

    and-int/2addr v0, v3

    if-eqz v0, :cond_14

    move v1, v3

    :cond_14
    iget-object p0, p0, Lyaf;->a:Lwub;

    iget-object p0, p0, Lwub;->a:Ljava/lang/Object;

    check-cast p0, Ldbf;

    sget-object v0, Lhbf;->a:Lhbf;

    invoke-virtual {p0, p1, v2, v1}, Ldbf;->w(Landroid/view/View;Ltaf;Z)Z

    move-result p0

    return p0

    :cond_21
    return v1
.end method
