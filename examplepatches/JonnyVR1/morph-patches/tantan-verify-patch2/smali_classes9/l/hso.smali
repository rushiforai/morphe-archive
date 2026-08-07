.class public Ll/hso;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hso$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ll/bn50;

.field public d:Ll/kcg0;

.field public e:Ljava/lang/Object;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hso;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hso;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/hso;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hso;->o()V

    return-void
.end method

.method public static synthetic b(Ll/hso;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hso;->n()V

    return-void
.end method

.method public static bridge synthetic c(Ll/hso;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->a:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/hso;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hso;->g:Z

    return p0
.end method

.method public static bridge synthetic e(Ll/hso;)Ll/bn50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->c:Ll/bn50;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/hso;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/hso;)Ll/kcg0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->d:Ll/kcg0;

    return-object p0
.end method

.method public static bridge synthetic h(Ll/hso;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->e:Ljava/lang/Object;

    return-object p0
.end method

.method public static bridge synthetic i(Ll/hso;Ll/kcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hso;->d:Ll/kcg0;

    return-void
.end method

.method public static bridge synthetic j(Ll/hso;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hso;->l()V

    return-void
.end method

.method public static bridge synthetic k(Ll/hso;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hso;->m()V

    return-void
.end method


# virtual methods
.method public final l()V
    .locals 1

    .line 1
    sget-object v0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ubp;->j()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hso;->f:Ll/y20;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/hso;->f:Ll/y20;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p0, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hso;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/ubp;->INSTANCE:Ll/ubp;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ubp;->j()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/hso;->l()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic n()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->c:Ll/bn50;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn50;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic o()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hso;->c:Ll/bn50;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn50;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Ll/aso;ZLjava/lang/String;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/hso;->q(Ll/aso;ZLjava/lang/String;Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public q(Ll/aso;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hso;->m()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/core/pay/R$string;->V9:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ll/hso$a;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/hso$a;-><init>(Ll/hso;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hso;->m()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v1, p0, Ll/hso;->a:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/core/pay/R$string;->T1:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 32
    .line 33
    .line 34
    if-nez p2, :cond_2

    .line 35
    .line 36
    new-instance p2, Ll/bso;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/bso;-><init>(Ll/hso;)V

    .line 39
    .line 40
    .line 41
    invoke-interface {p1, p3, p2}, Ll/tvl;->c(Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/hso;->d:Ll/kcg0;

    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    new-instance p2, Ll/cso;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/cso;-><init>(Ll/hso;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {p1, p3, p4, p2}, Ll/tvl;->b(Ljava/lang/String;Ljava/lang/String;Ll/x20;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/hso;->d:Ll/kcg0;

    .line 66
    .line 67
    return-void
.end method

.method public r(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hso;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public s(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/hso;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public t(Ll/bn50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hso;->c:Ll/bn50;

    .line 2
    .line 3
    return-void
.end method

.method public u(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hso;->e:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method
