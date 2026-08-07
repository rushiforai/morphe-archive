.class public Lcom/p1/mobile/putong/core/ui/purchase/b$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/purchase/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Lcom/p1/mobile/putong/core/data/Privilege;

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/x20;

.field public g:Ll/x20;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/x20;

.field public m:Ll/x20;

.field public n:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->d:Z

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->i:I

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/purchase/b;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->i:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->E(Lcom/p1/mobile/putong/core/ui/purchase/b;I)V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->e:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 25
    .line 26
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->d:Z

    .line 27
    .line 28
    invoke-static {v1, v2, v3}, Ll/j690;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->e:Ljava/util/List;

    .line 33
    .line 34
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 35
    .line 36
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->d:Z

    .line 37
    .line 38
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/b;->F(Lcom/p1/mobile/putong/core/ui/purchase/b;Lcom/p1/mobile/putong/core/data/Privilege;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->e:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->L(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->f:Ll/x20;

    .line 47
    .line 48
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->I(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/x20;)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->g:Ll/x20;

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->H(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/x20;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->j:Ll/a30;

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->K(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/a30;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->k:Ll/a30;

    .line 62
    .line 63
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->J(Lcom/p1/mobile/putong/core/ui/purchase/b;Ll/a30;)V

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->h:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->G(Lcom/p1/mobile/putong/core/ui/purchase/b;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->m:Ll/x20;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->C0(Ll/x20;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->l:Ll/x20;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->F0(Ll/x20;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->n:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->G0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->o:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/b;->H0(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->p:Ljava/lang/Object;

    .line 92
    .line 93
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->K0(Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-object v0
.end method

.method public b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/b;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/b;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(I)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->g:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->f:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->m:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ll/a30;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/b$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->j:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->l:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->o:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/b$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Lcom/p1/mobile/putong/core/ui/purchase/b$d;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->c:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->d:Z

    .line 6
    .line 7
    return-object p0
.end method

.method public o(Ljava/lang/Object;)Lcom/p1/mobile/putong/core/ui/purchase/b$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->p:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Lcom/p1/mobile/putong/core/ui/purchase/b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b$d;->a()Lcom/p1/mobile/putong/core/ui/purchase/b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/b;->L0()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
