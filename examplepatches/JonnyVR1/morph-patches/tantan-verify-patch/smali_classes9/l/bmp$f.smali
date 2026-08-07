.class public Ll/bmp$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bmp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ljava/lang/String;

.field public d:Z

.field public e:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/x20;

.field public h:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bmp$f;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/bmp;
    .locals 2

    .line 1
    new-instance v0, Ll/bmp;

    .line 2
    .line 3
    iget-object v1, p0, Ll/bmp$f;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/bmp;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/bmp$f;->c:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bmp;->g(Ll/bmp;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/bmp$f;->g:Ll/x20;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/bmp;->v(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/bmp$f;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/bmp;->z(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/bmp$f;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 24
    .line 25
    invoke-static {v1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->qq()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_0

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Ll/bmp;->u(Z)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-boolean v1, p0, Ll/bmp$f;->d:Z

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ll/bmp;->u(Z)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object v1, p0, Ll/bmp$f;->f:Ljava/util/List;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/bmp;->x(Ljava/util/List;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/bmp$f;->e:Ll/z20;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/bmp;->s(Ll/z20;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/bmp$f;->h:Ll/x20;

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ll/bmp;->w(Ll/x20;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public b(Ll/z20;)Ll/bmp$f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/bmp$f;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bmp$f;->e:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ll/bmp$f;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp$f;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Z)Ll/bmp$f;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bmp$f;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ljava/util/List;)Ll/bmp$f;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Ll/bmp$f;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bmp$f;->f:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/bmp$f;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmp$f;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ll/bmp;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bmp$f;->a()Ll/bmp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bmp;->h(Ll/bmp;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
