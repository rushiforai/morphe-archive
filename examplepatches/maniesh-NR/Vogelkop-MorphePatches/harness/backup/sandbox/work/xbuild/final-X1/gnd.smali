.class public final Lgnd;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Landroid/view/View;

.field public final c:Landroid/widget/ImageView;

.field public final d:Landroid/widget/ProgressBar;

.field public final e:Landroid/widget/TextView;

.field public final synthetic f:Lqt5;


# direct methods
.method public constructor <init>(Lqt5;Landroid/view/View;)V
    .registers 5

    iput-object p1, p0, Lgnd;->f:Lqt5;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lgnd;->b:Landroid/view/View;

    const v0, 0x7f0a0715

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lgnd;->c:Landroid/widget/ImageView;

    const v0, 0x7f0a0717

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lgnd;->d:Landroid/widget/ProgressBar;

    const v1, 0x7f0a0716

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lgnd;->e:Landroid/widget/TextView;

    iget-object p0, p1, Lqt5;->h:Ljava/lang/Object;

    check-cast p0, Lhnd;

    iget-object p0, p0, Lhnd;->i:Landroid/content/Context;

    invoke-static {p0, v0}, Lo0g;->z0(Landroid/content/Context;Landroid/widget/ProgressBar;)V

    return-void
.end method
