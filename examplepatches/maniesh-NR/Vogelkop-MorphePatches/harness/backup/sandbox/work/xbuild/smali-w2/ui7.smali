.class public final Lui7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lti7;


# instance fields
.field public final a:Lth7;

.field public b:Z


# direct methods
.method public constructor <init>(Lth7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lui7;->a:Lth7;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/i;)V
    .registers 2

    iget-object p0, p0, Lui7;->a:Lth7;

    invoke-interface {p0, p1}, Lth7;->a(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/i;II)Z
    .registers 4

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lui7;->a:Lth7;

    invoke-interface {p0}, Lth7;->e()Landroid/view/View;

    move-result-object p0

    invoke-static {p1, p0, p2, p3}, Lwi7;->a(Landroid/view/View;Landroid/view/View;II)Z

    move-result p0

    return p0
.end method

.method public final c(Landroidx/recyclerview/widget/i;II)V
    .registers 4

    if-eqz p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x0

    :goto_5
    iget-boolean p2, p0, Lui7;->b:Z

    if-ne p1, p2, :cond_a

    return-void

    :cond_a
    iput-boolean p1, p0, Lui7;->b:Z

    iget-object p0, p0, Lui7;->a:Lth7;

    invoke-interface {p0, p1}, Lth7;->x(Z)V

    return-void
.end method
