.class public final Los5;
.super Lk73;
.source "SourceFile"


# instance fields
.field public final g:Lns5;


# direct methods
.method public constructor <init>(Lns5;Landroid/view/ViewGroup;Ltn;Lg1j;Ljv0;)V
    .registers 12

    sget-object v5, Lwln;->h:Lwln;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lk73;-><init>(Landroid/view/ViewGroup;Ljs5;Lg1j;Ljv0;Lwln;)V

    iput-object p1, v0, Los5;->g:Lns5;

    iget-object p0, p1, Lns5;->h:Ljava/util/ArrayList;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final o()Z
    .registers 2

    iget-object v0, p0, Los5;->g:Lns5;

    iget-object v0, v0, Lns5;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 p0, 0x1

    return p0
.end method

.method public final t(Lge5;)V
    .registers 2

    iget-object p0, p0, Los5;->g:Lns5;

    invoke-virtual {p0, p1}, Lns5;->t(Lge5;)V

    return-void
.end method

.method public final u(Lge5;)V
    .registers 2

    iget-object p0, p0, Los5;->g:Lns5;

    invoke-virtual {p0, p1}, Lns5;->u(Lge5;)V

    return-void
.end method

.method public final v(ILks5;Lls5;)V
    .registers 4

    iget-object p0, p0, Los5;->g:Lns5;

    invoke-virtual {p0, p1, p2, p3}, Lns5;->v(ILks5;Lls5;)V

    return-void
.end method
