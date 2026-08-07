.class public Lcom/p1/mobile/putong/core/ui/purchase/f$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/purchase/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ll/x20;

.field public f:I

.field public g:Ll/a30;
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

.field public h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
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

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;"
        }
    .end annotation
.end field


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
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->f:I

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->c:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/y20;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->h:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->e:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/y20;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->i:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/a30;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->g:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/y20;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->j:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/f$d;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Lcom/p1/mobile/putong/core/ui/purchase/f$d;
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->f:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/core/ui/purchase/f;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/f;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->b:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->t(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->c:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->m(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->e:Ll/x20;

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->p(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/x20;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->d:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->n(Lcom/p1/mobile/putong/core/ui/purchase/f;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->f:I

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->u(Lcom/p1/mobile/putong/core/ui/purchase/f;I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->g:Ll/a30;

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->r(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/a30;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->i:Ll/y20;

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->q(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->h:Ll/y20;

    .line 44
    .line 45
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/f;->o(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/f$d;->j:Ll/y20;

    .line 49
    .line 50
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->s(Lcom/p1/mobile/putong/core/ui/purchase/f;Ll/y20;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/f;->v(Lcom/p1/mobile/putong/core/ui/purchase/f;)V

    .line 54
    .line 55
    .line 56
    return-object v0
.end method
