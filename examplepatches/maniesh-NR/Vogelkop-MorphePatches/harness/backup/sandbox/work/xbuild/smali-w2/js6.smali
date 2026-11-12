.class public final Ljs6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;

.field public final g:Ljava/lang/Object;

.field public final h:Ljava/lang/Object;

.field public final i:Ljava/lang/Object;

.field public final j:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lfs6;Lj4c;Lj4c;Lxoc;Lrs6;Ltn;)V
    .registers 9

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Ljs6;->a:Z

    .line 54
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ljs6;->j:Ljava/lang/Object;

    .line 55
    iput-object p1, p0, Ljs6;->c:Ljava/lang/Object;

    .line 56
    iput-object p2, p0, Ljs6;->d:Ljava/lang/Object;

    .line 57
    iput-object p3, p0, Ljs6;->e:Ljava/lang/Object;

    .line 58
    iput-object p4, p0, Ljs6;->f:Ljava/lang/Object;

    .line 59
    iput-object p5, p0, Ljs6;->g:Ljava/lang/Object;

    .line 60
    iput-object p6, p0, Ljs6;->h:Ljava/lang/Object;

    .line 61
    iput-object p7, p0, Ljs6;->i:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcpk;Lglh;Lqlk;Ltxi;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lopk;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lopk;-><init>(Ljs6;B)V

    iput-object v0, p0, Ljs6;->i:Ljava/lang/Object;

    new-instance v1, Lopk;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lopk;-><init>(Ljs6;B)V

    iput-object v1, p0, Ljs6;->j:Ljava/lang/Object;

    iput-object p1, p0, Ljs6;->c:Ljava/lang/Object;

    iput-object p2, p0, Ljs6;->d:Ljava/lang/Object;

    iput-object p3, p0, Ljs6;->e:Ljava/lang/Object;

    iput-object p4, p0, Ljs6;->f:Ljava/lang/Object;

    new-instance p3, Lppk;

    invoke-direct {p3, p0}, Lppk;-><init>(Ljs6;)V

    iput-object p3, p0, Ljs6;->g:Ljava/lang/Object;

    new-instance p4, Lopk;

    invoke-direct {p4, p0, v2}, Lopk;-><init>(Ljs6;B)V

    iput-object p4, p0, Ljs6;->h:Ljava/lang/Object;

    iget-object p0, p1, Lcpk;->c:Lh7f;

    invoke-virtual {p0, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p2, Lglh;->b:Lh7f;

    invoke-virtual {p0, p3}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-boolean v0, p0, Ljs6;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    iput-boolean v1, p0, Ljs6;->b:Z

    iget-object v0, p0, Ljs6;->j:Ljava/lang/Object;

    check-cast v0, Lopk;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    :cond_e
    iget-boolean v0, p0, Ljs6;->a:Z

    if-nez v0, :cond_13

    return-void

    :cond_13
    iget-object v0, p0, Ljs6;->f:Ljava/lang/Object;

    check-cast v0, Ltxi;

    new-instance v2, Lopk;

    invoke-direct {v2, p0, v1}, Lopk;-><init>(Ljs6;B)V

    iget-object p0, v0, Ltxi;->b:Ljava/lang/Object;

    check-cast p0, Lkd7;

    invoke-virtual {p0, v2}, Lldk;->f(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final b(Lzmc;)V
    .registers 8

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-wide v0, p1, Llmc;->a:J

    const/4 p1, 0x1

    iput-boolean p1, p0, Ljs6;->b:Z

    iget-object v2, p0, Ljs6;->i:Ljava/lang/Object;

    check-cast v2, Ltn;

    iget-object v3, p0, Ljs6;->c:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    new-instance v4, Lkqc;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v1, v5}, Lkqc;-><init>(JZ)V

    new-instance v0, Lhs6;

    invoke-direct {v0, p0, p1}, Lhs6;-><init>(Ljs6;B)V

    invoke-virtual {v2, v3, v4, v0}, Ltn;->D(Landroid/content/Context;Ltc2;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c(I)V
    .registers 4

    iget-boolean v0, p0, Ljs6;->a:Z

    if-nez v0, :cond_18

    const/4 v0, 0x1

    if-ne p1, v0, :cond_18

    iget-boolean v0, p0, Ljs6;->b:Z

    if-eqz v0, :cond_f

    const/4 v0, 0x0

    iput-boolean v0, p0, Ljs6;->b:Z

    goto :goto_18

    :cond_f
    iget-object v0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast v0, Lxoc;

    sget-object v1, Ltg0;->i:Ltg0;

    invoke-virtual {v0, v1}, Lxoc;->a(Ltg0;)V

    :cond_18
    :goto_18
    iput-boolean p1, p0, Ljs6;->a:Z

    return-void
.end method
