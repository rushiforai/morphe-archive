.class public final Lw2l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lx2l;

.field public final synthetic b:Lpde;


# direct methods
.method public constructor <init>(Lx2l;Lpde;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw2l;->a:Lx2l;

    iput-object p2, p0, Lw2l;->b:Lpde;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 7

    iget-object p1, p0, Lw2l;->a:Lx2l;

    iget-object v0, p1, Lx2l;->j:Lypd;

    iget-object p0, p0, Lw2l;->b:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb3c;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz p0, :cond_1f

    if-eq p0, v2, :cond_1f

    if-eq p0, v1, :cond_1f

    const/4 p3, 0x3

    if-eq p0, p3, :cond_2d

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1f
    invoke-static {p3}, Lvep;->A(I)I

    move-result p0

    if-eqz p0, :cond_46

    if-eq p0, v2, :cond_2d

    if-eq p0, v1, :cond_2d

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_2d
    move-object p0, p2

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-virtual {v0, p0}, Lypd;->r(I)V

    iget-object p0, p1, Lx2l;->o:Lo2l;

    invoke-virtual {p0, p2}, Lo2l;->a(Lb2l;)I

    move-result p0

    const/4 p1, 0x0

    const/4 p2, 0x6

    invoke-static {v0, p0, p1, p2}, Lypd;->K(Lypd;III)V

    :cond_46
    return-void
.end method

.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, Lw2l;->a:Lx2l;

    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    return-void
.end method

.method public final h(Lb2l;I)V
    .registers 3

    iget-object p0, p0, Lw2l;->a:Lx2l;

    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget-object p0, p0, Lw2l;->a:Lx2l;

    iget-object p0, p0, Lx2l;->m:Lh5k;

    invoke-virtual {p0}, Lh5k;->f()V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    iget-object p0, p0, Lw2l;->a:Lx2l;

    sget-object v0, Ll08;->a:Ll08;

    invoke-virtual {p0, v0}, Ldt1;->K(Ljava/util/Collection;)V

    return-void
.end method
