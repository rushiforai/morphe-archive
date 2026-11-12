.class public final Luyk;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Landroid/widget/TextView;

.field public final c:Landroid/widget/TextView;

.field public final d:Landroid/widget/ImageView;

.field public final synthetic e:Lvyk;


# direct methods
.method public constructor <init>(Lvyk;Landroid/view/View;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Luyk;->e:Lvyk;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    const p1, 0x7f0a06c5

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Luyk;->b:Landroid/widget/TextView;

    const p1, 0x7f0a0c64

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Luyk;->c:Landroid/widget/TextView;

    const p1, 0x7f0a0322

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Luyk;->d:Landroid/widget/ImageView;

    new-instance p1, Lic;

    const/16 v0, 0xa

    invoke-direct {p1, p0, v0}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lzkh;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lzkh;-><init>(Landroidx/recyclerview/widget/i;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method
