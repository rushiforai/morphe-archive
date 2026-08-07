.class public Lcom/p1/mobile/putong/core/ui/purchase/d$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/purchase/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# static fields
.field public static r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/String;

.field public j:Lcom/p1/mobile/putong/core/data/ProductCategory;

.field public k:Ll/t6c;

.field public l:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

.field public m:D

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public q:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->c:I

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->g:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->h:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->i:Ljava/lang/String;

    .line 22
    .line 23
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->p:Z

    .line 24
    .line 25
    return-void
.end method

.method public static b()Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->c()V

    .line 29
    .line 30
    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->r:Lcom/p1/mobile/putong/core/ui/purchase/d$b;

    .line 32
    .line 33
    return-object v0
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/purchase/d$a;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;-><init>(Lcom/p1/mobile/putong/core/data/Merchandise;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->e0(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->c:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->i0(I)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->d:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->j0(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->l0(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->f:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->O(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->g:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->M(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->h:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->b0(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->i:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->Z(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->j:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->N(Lcom/p1/mobile/putong/core/data/ProductCategory;)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->k:Ll/t6c;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->T(Ll/t6c;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->l:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->k0(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;)V

    .line 61
    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->p:Z

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->c0(Z)V

    .line 66
    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->q:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->a0(I)V

    .line 71
    .line 72
    .line 73
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->m:D

    .line 74
    .line 75
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f0(D)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->n:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->R(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->o:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->V(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-object v0
.end method

.method public final c()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 3
    .line 4
    const-string v1, ""

    .line 5
    .line 6
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->c:I

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->e:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->f:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->g:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->h:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->i:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->j:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->k:Ll/t6c;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->l:Lcom/p1/mobile/putong/core/data/SummarizedPrivilegePrice;

    .line 28
    .line 29
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->p:Z

    .line 30
    .line 31
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->q:I

    .line 32
    .line 33
    const-wide/16 v2, 0x0

    .line 34
    .line 35
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->m:D

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->n:Ljava/lang/String;

    .line 38
    .line 39
    return-void
.end method

.method public d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->n:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/t6c;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->k:Ll/t6c;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(I)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->q:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/core/data/Merchandise;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->a:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public n(D)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->m:D

    .line 2
    .line 3
    return-object p0
.end method

.method public o(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->j:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    return-object p0
.end method

.method public p(I)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/d$b;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/d$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
