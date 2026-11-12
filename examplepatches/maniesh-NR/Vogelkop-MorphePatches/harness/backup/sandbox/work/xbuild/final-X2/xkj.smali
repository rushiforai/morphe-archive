.class public abstract Lxkj;
.super Landroidx/recyclerview/widget/e;
.source "SourceFile"


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/recyclerview/widget/e;->a:Lyhe;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/e;->b:Ljava/util/ArrayList;

    const-wide/16 v0, 0x78

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->c:J

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->d:J

    const-wide/16 v0, 0xfa

    iput-wide v0, p0, Landroidx/recyclerview/widget/e;->e:J

    const/16 v0, 0xfa

    iput-short v0, p0, Landroidx/recyclerview/widget/e;->f:S

    const/4 v0, 0x1

    iput-boolean v0, p0, Lxkj;->g:Z

    return-void
.end method


# virtual methods
.method public abstract k(Landroidx/recyclerview/widget/i;)Z
.end method

.method public abstract l(Landroidx/recyclerview/widget/i;Landroidx/recyclerview/widget/i;IIII)Z
.end method

.method public abstract m(Landroidx/recyclerview/widget/i;IIII)Z
.end method

.method public abstract n(Landroidx/recyclerview/widget/i;)Z
.end method

.method public final o(Landroidx/recyclerview/widget/i;)V
    .registers 2

    invoke-virtual {p0, p1}, Lxkj;->q(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/e;->c(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public p()V
    .registers 1

    return-void
.end method

.method public q(Landroidx/recyclerview/widget/i;)V
    .registers 2

    return-void
.end method

.method public r()V
    .registers 1

    return-void
.end method
