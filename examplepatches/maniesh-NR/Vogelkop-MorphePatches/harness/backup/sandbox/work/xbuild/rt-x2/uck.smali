.class public final Luck;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ln4l;

.field public b:Lsck;

.field public final c:Ld5a;

.field public final synthetic d:Lev7;


# direct methods
.method public constructor <init>(Lev7;Ln4l;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luck;->d:Lev7;

    iput-object p2, p0, Luck;->a:Ln4l;

    iget-object v0, p1, Lev7;->a:Ljava/lang/Object;

    check-cast v0, Lpde;

    iget-object v1, p2, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v1}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object v1

    invoke-static {v0, v1}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object v3

    new-instance v0, Lsck;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lsck;-><init>(I)V

    iput-object v0, p0, Luck;->b:Lsck;

    new-instance v2, Ld5a;

    iget-object v0, p1, Lev7;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lv8a;

    iget-object v0, p1, Lev7;->g:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lpde;

    new-instance v7, Ltck;

    invoke-direct {v7, p1, p0, v1}, Ltck;-><init>(Lev7;Luck;B)V

    new-instance v8, Ltck;

    const/4 v0, 0x1

    invoke-direct {v8, p1, p0, v0}, Ltck;-><init>(Lev7;Luck;B)V

    new-instance v9, Ld7k;

    const/4 v0, 0x5

    invoke-direct {v9, p1, p0, v0}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Ltck;

    const/4 v0, 0x2

    invoke-direct {v10, p1, p0, v0}, Ltck;-><init>(Lev7;Luck;B)V

    move-object v4, p2

    invoke-direct/range {v2 .. v10}, Ld5a;-><init>(Ltsd;Ln4l;Lv8a;Lpde;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;)V

    iput-object v2, p0, Luck;->c:Ld5a;

    iget-object p1, v4, Ln4l;->b:Landroid/widget/TextView;

    new-instance p2, Lkkf;

    const/16 v0, 0x1c

    invoke-direct {p2, p0, v0}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_56

    return-void

    :cond_56
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Luck;->a:Ln4l;

    iget-object v0, v0, Ln4l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object p0, p0, Luck;->d:Lev7;

    iget-object p0, p0, Lev7;->g:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object p0, p0, Leyj;->i:Lj7h;

    invoke-virtual {p0}, Lj7h;->f()Lb8h;

    move-result-object p0

    if-eqz p0, :cond_21

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    goto :goto_22

    :cond_21
    const/4 p0, 0x0

    :goto_22
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
