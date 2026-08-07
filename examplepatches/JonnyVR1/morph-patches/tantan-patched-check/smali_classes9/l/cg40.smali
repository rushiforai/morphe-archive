.class public Ll/cg40;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public b:Lcom/p1/mobile/putong/core/data/Privilege;

.field public c:Z

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/a690;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/lang/String;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

.field public h:Ll/a30;
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

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public j:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/cg40;->c:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cg40;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/cg40;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 10
    .line 11
    iget-object v1, p0, Ll/cg40;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    iget-boolean v2, p0, Ll/cg40;->c:Z

    .line 14
    .line 15
    invoke-static {v0, v1, v2}, Ll/j690;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/cg40;->d:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 22
    .line 23
    iget-object v1, p0, Ll/cg40;->d:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setPrivilegeDescriptions(Ljava/util/List;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 29
    .line 30
    iget-object v1, p0, Ll/cg40;->e:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setFrom(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 36
    .line 37
    iget-object v1, p0, Ll/cg40;->f:Ll/y20;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setDialogStateAction(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 43
    .line 44
    iget-object v1, p0, Ll/cg40;->f:Ll/y20;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setDialogStateAction(Ll/y20;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 50
    .line 51
    iget-object v1, p0, Ll/cg40;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setPurchaseType(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 57
    .line 58
    iget-object v1, p0, Ll/cg40;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setFirstPrivilege(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 64
    .line 65
    iget-object v1, p0, Ll/cg40;->h:Ll/a30;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setOnPaymentSuccess(Ll/a30;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 71
    .line 72
    iget-object v1, p0, Ll/cg40;->i:Ll/y20;

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setOnCloseClick(Ll/y20;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 78
    .line 79
    iget-object v1, p0, Ll/cg40;->j:Ll/z20;

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setAgreementViewAction(Ll/z20;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 85
    .line 86
    iget-object v1, p0, Ll/cg40;->k:Ll/y20;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->setAgreementCheckedCallback(Ll/y20;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/cg40;->g:Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/PurchaseView;->a0(Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public b(Ll/y20;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->k:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/z20;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Landroid/view/View;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->j:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/y20;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->f:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/lang/String;)Ll/cg40;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cg40;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/y20;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->i:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/a30;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->h:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/util/List;)Ll/cg40;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/a690;",
            ">;)",
            "Ll/cg40;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cg40;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/cg40;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/cg40;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ll/cg40;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ll/cg40;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cg40;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    iput-object p2, p0, Ll/cg40;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 4
    .line 5
    iput-boolean p3, p0, Ll/cg40;->c:Z

    .line 6
    .line 7
    return-object p0
.end method
