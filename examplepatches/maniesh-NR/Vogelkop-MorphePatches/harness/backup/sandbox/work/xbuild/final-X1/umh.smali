.class public final Lumh;
.super Ldt1;
.source "SourceFile"


# instance fields
.field public final e:Lpde;

.field public final f:Lgnh;

.field public final g:Likc;

.field public final h:Lyqa;

.field public final i:Ljvk;

.field public final j:Lro9;


# direct methods
.method public constructor <init>(Lpde;Lgnh;Likc;Lyqa;Ljvk;Lro9;)V
    .registers 7

    invoke-direct {p0}, Ldt1;-><init>()V

    iput-object p1, p0, Lumh;->e:Lpde;

    iput-object p2, p0, Lumh;->f:Lgnh;

    iput-object p3, p0, Lumh;->g:Likc;

    iput-object p4, p0, Lumh;->h:Lyqa;

    iput-object p5, p0, Lumh;->i:Ljvk;

    iput-object p6, p0, Lumh;->j:Lro9;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance p2, Ltmh;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Ltmh;-><init>(Lumh;B)V

    new-instance p3, Lj9h;

    const/4 p4, 0x5

    invoke-direct {p3, p4}, Lj9h;-><init>(B)V

    new-instance p4, La3j;

    const/4 p5, 0x4

    invoke-direct {p4, p5}, La3j;-><init>(B)V

    const-class p6, Lzmh;

    invoke-virtual {p0, p6, p2, p3, p4}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance p2, Ltmh;

    invoke-direct {p2, p0, p1}, Ltmh;-><init>(Lumh;B)V

    new-instance p1, Lj9h;

    const/4 p3, 0x6

    invoke-direct {p1, p3}, Lj9h;-><init>(B)V

    new-instance p3, La3j;

    invoke-direct {p3, p5}, La3j;-><init>(B)V

    const-class p4, Lc85;

    invoke-virtual {p0, p4, p2, p1, p3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    new-instance p1, Ltmh;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Ltmh;-><init>(Lumh;B)V

    new-instance p2, Lj9h;

    const/4 p3, 0x7

    invoke-direct {p2, p3}, Lj9h;-><init>(B)V

    new-instance p3, La3j;

    invoke-direct {p3, p5}, La3j;-><init>(B)V

    const-class p4, Lhj8;

    invoke-virtual {p0, p4, p1, p2, p3}, Ldt1;->J(Ljava/lang/Class;Lyjj;Lxjj;Lzjj;)V

    return-void
.end method


# virtual methods
.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Ldt1;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsmh;

    invoke-interface {p0}, Lsmh;->getId()J

    move-result-wide p0

    return-wide p0
.end method
