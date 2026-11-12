.class public final Ln22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lx22;


# direct methods
.method public constructor <init>(Lx22;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln22;->a:Lx22;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 4

    iget-object p0, p0, Ln22;->a:Lx22;

    if-eqz p1, :cond_10

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p1

    if-eqz p1, :cond_10

    const/4 p3, 0x0

    iput-boolean p3, p1, Lv22;->b:Z

    invoke-virtual {p1}, Lv22;->b()V

    :cond_10
    invoke-virtual {p0, p2}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p1

    const/4 p3, 0x1

    if-eqz p1, :cond_1d

    iput-boolean p3, p1, Lv22;->b:Z

    invoke-virtual {p1}, Lv22;->b()V

    return-void

    :cond_1d
    check-cast p2, Ld7l;

    invoke-virtual {p2}, Ld7l;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lx22;->j(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_35

    invoke-virtual {p0, p2}, Lx22;->e(Lb2l;)Lv22;

    move-result-object p0

    invoke-virtual {p0}, Lv22;->a()V

    iput-boolean p3, p0, Lv22;->c:Z

    invoke-virtual {p0}, Lv22;->b()V

    :cond_35
    return-void
.end method

.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, Ln22;->a:Lx22;

    iget-object p0, p0, Lx22;->t:Landroid/util/SparseArray;

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getId()I

    move-result p2

    invoke-virtual {p0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lv22;

    if-eqz p2, :cond_21

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->remove(I)V

    goto :goto_22

    :cond_21
    const/4 p2, 0x0

    :goto_22
    if-eqz p2, :cond_2b

    iget-object p0, p2, Lv22;->e:Lqdc;

    sget-object p1, Lqcc;->a:Lqcc;

    invoke-virtual {p0, p1}, Lqdc;->g(Lqcc;)V

    :cond_2b
    return-void
.end method
