.class public final Lqm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvwh;
.implements Lbtj;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Lnv6;

.field public c:Lo93;

.field public d:Lgtj;

.field public e:Lmim;

.field public f:Z

.field public g:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqm9;->a:Landroid/view/View;

    new-instance p1, Lnv6;

    invoke-direct {p1, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lqm9;->b:Lnv6;

    return-void
.end method


# virtual methods
.method public final I()V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqm9;->f:Z

    iget-object v0, p0, Lqm9;->c:Lo93;

    if-eqz v0, :cond_10

    const/4 v1, 0x3

    sget-object v2, Lhjm;->b:Lhjm;

    invoke-virtual {v0, v2, v1}, Lo93;->b(Lhjm;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lqm9;->c:Lo93;

    :cond_10
    const/4 v0, 0x0

    iput-boolean v0, p0, Lqm9;->f:Z

    return-void
.end method

.method public final f(Lo93;)V
    .registers 5

    invoke-virtual {p0}, Lqm9;->I()V

    iput-object p1, p0, Lqm9;->c:Lo93;

    iget-object v0, p0, Lqm9;->b:Lnv6;

    iput-object v0, p1, Lo93;->b:Lkjm;

    iget-object v0, p0, Lqm9;->a:Landroid/view/View;

    invoke-virtual {p1, v0}, Lo93;->e(Landroid/view/View;)Lgtj;

    move-result-object v0

    new-instance v1, Lpt;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lpt;-><init>(Ljava/lang/Object;B)V

    iget-object p1, v0, Lgtj;->a:Lasj;

    invoke-virtual {p1, v1}, Lna3;->a(Lzrj;)V

    iput-object v0, p0, Lqm9;->d:Lgtj;

    invoke-virtual {v0}, Lgtj;->j()V

    return-void
.end method

.method public final z(Lo93;Lmim;)I
    .registers 6

    iput-object p2, p0, Lqm9;->e:Lmim;

    iget-object p2, p0, Lqm9;->c:Lo93;

    if-eqz p2, :cond_8

    const/4 p0, 0x2

    return p0

    :cond_8
    iput-object p1, p0, Lqm9;->c:Lo93;

    iget-object p2, p0, Lqm9;->b:Lnv6;

    iput-object p2, p1, Lo93;->b:Lkjm;

    iget-object p2, p0, Lqm9;->a:Landroid/view/View;

    invoke-virtual {p1, p2}, Lo93;->e(Landroid/view/View;)Lgtj;

    move-result-object v0

    new-instance v1, Lpt;

    const/4 v2, 0x1

    invoke-direct {v1, p1, v2}, Lpt;-><init>(Ljava/lang/Object;B)V

    iget-object p1, v0, Lgtj;->a:Lasj;

    invoke-virtual {p1, v1}, Lna3;->a(Lzrj;)V

    iput-object v0, p0, Lqm9;->d:Lgtj;

    iget-object p1, p0, Lqm9;->g:Landroid/view/View;

    if-eqz p1, :cond_2a

    iget-object v0, v0, Lgtj;->a:Lasj;

    invoke-virtual {v0, p1}, Lna3;->f(Landroid/view/View;)V

    :cond_2a
    invoke-virtual {p2}, Landroid/view/View;->getElevation()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-lez p1, :cond_38

    iget-object p1, p0, Lqm9;->d:Lgtj;

    invoke-virtual {p1, p2}, Lgtj;->b(Landroid/view/View;)V

    :cond_38
    iget-object p0, p0, Lqm9;->d:Lgtj;

    invoke-virtual {p0}, Lgtj;->j()V

    return v2
.end method
