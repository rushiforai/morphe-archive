.class public final Llmh;
.super Lpa3;
.source "SourceFile"


# instance fields
.field public final b:Lq5g;

.field public final c:Leek;


# direct methods
.method public constructor <init>(Lq5g;Leek;)V
    .registers 4

    iget-object v0, p1, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Llmh;->b:Lq5g;

    iput-object p2, p0, Llmh;->c:Leek;

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 6

    check-cast p1, Laqk;

    iget-object p2, p0, Llmh;->b:Lq5g;

    iget-object v0, p2, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Laqk;->c:Lrxh;

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p2, p2, Lq5g;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object p1, p1, Laqk;->d:Lrxh;

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lzvd;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final Y()V
    .registers 2

    iget-object p0, p0, Llmh;->b:Lq5g;

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
