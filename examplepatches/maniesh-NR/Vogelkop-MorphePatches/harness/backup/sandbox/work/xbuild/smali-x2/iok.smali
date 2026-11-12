.class public final Liok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lxok;

.field public final b:Lw6j;

.field public c:Lode;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Lxok;Lw6j;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Liok;->e:Z

    iput-object p1, p0, Liok;->a:Lxok;

    iput-object p2, p0, Liok;->b:Lw6j;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lupk;

    iget-boolean v0, p0, Liok;->d:Z

    const/4 v1, 0x1

    if-nez v0, :cond_a

    iput-boolean v1, p0, Liok;->e:Z

    return-void

    :cond_a
    iget-object v0, p1, Lupk;->a:Lh1b;

    iget-object v2, p0, Liok;->a:Lxok;

    invoke-virtual {v2, v0}, Lxok;->D(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_30

    iget p1, p1, Lupk;->b:I

    const/4 v0, -0x1

    iget-object p0, p0, Liok;->b:Lw6j;

    if-eq p1, v1, :cond_28

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1f

    return-void

    :cond_1f
    sget-object p1, Lhr0;->g:Lhr0;

    invoke-virtual {p0, v0, p1}, Lw6j;->o(ILhr0;)V

    invoke-virtual {p0}, Lw6j;->p()V

    return-void

    :cond_28
    sget-object p1, Lhr0;->f:Lhr0;

    invoke-virtual {p0, v0, p1}, Lw6j;->o(ILhr0;)V

    invoke-virtual {p0}, Lw6j;->p()V

    :cond_30
    return-void
.end method
