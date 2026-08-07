.class public final Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0010\u000b\n\u0002\u0008\u0010\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u00002\u0008\u0010\u000b\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u001d\u0010\u0011\u001a\u00020\u00002\u000e\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0015\u001a\u00020\u00002\u0008\u0010\u0014\u001a\u0004\u0018\u00010\u0013\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\u0017\u0010\u0018\u001a\u00020\u00002\u0008\u0010\u0017\u001a\u0004\u0018\u00010\u0013\u00a2\u0006\u0004\u0008\u0018\u0010\u0016J\u0017\u0010\u001a\u001a\u00020\u00002\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0013\u00a2\u0006\u0004\u0008\u001a\u0010\u0016J+\u0010\u001d\u001a\u00020\u00002\u001c\u0010\u001c\u001a\u0018\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001b\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0017\u0010 \u001a\u00020\u00002\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0013\u00a2\u0006\u0004\u0008 \u0010\u0016J\r\u0010\"\u001a\u00020!\u00a2\u0006\u0004\u0008\"\u0010#R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000c\u0010$\u001a\u0004\u0008%\u0010&R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\'\u001a\u0004\u0008(\u0010)R$\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008 \u0010*\u001a\u0004\u0008+\u0010,\"\u0004\u0008-\u0010.R\u0016\u00101\u001a\u00020/8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u00100R\u001e\u0010\u0010\u001a\n\u0012\u0004\u0012\u00020\u000f\u0018\u00010\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001d\u00102R\u0018\u00104\u001a\u0004\u0018\u00010\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0018\u00103R\u0018\u00105\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010*R\u0018\u00107\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\"\u00106R\u0018\u00109\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00088\u00106R\u0018\u0010\u0019\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008:\u00106R,\u0010\u001c\u001a\u0018\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0018\u00010\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008;\u0010<R\u0018\u0010>\u001a\u0004\u0018\u00010\u00138\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008=\u00106\u00a8\u0006?"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;",
        "",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "privilege",
        "a",
        "(Lcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;",
        "",
        "Ll/a690;",
        "privilegeDescriptions",
        "g",
        "(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;",
        "Ll/x20;",
        "onCloseCallback",
        "b",
        "(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;",
        "touchOutsideListener",
        "f",
        "onKeyBackCallback",
        "d",
        "Ll/a30;",
        "onPaymentSuccess",
        "e",
        "(Ll/a30;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;",
        "dismiss",
        "c",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;",
        "h",
        "()Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "setFrom",
        "(Ljava/lang/String;)V",
        "",
        "Z",
        "renew",
        "Ljava/util/List;",
        "Lcom/p1/mobile/putong/core/data/Privilege;",
        "firstPrivilege",
        "otherUser",
        "Ll/x20;",
        "onCloseClick",
        "i",
        "onTouchOutsideCallback",
        "j",
        "k",
        "Ll/a30;",
        "l",
        "onDismiss",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public d:Z

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Ll/a690;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/core/data/Privilege;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public g:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public h:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public i:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public j:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
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

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public l:Ll/x20;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->c:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/data/Privilege;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Privilege;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->f:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->h:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->l:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->j:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/a30;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ll/a30;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->k:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Ll/x20;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->i:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;
    .locals 0
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ll/a690;",
            ">;)",
            "Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->e:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->d:Z

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->I(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->f:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->m(Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->e:Ljava/util/List;

    .line 23
    .line 24
    check-cast v1, Ljava/util/Collection;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->f:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 35
    .line 36
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->d:Z

    .line 37
    .line 38
    invoke-static {v1, v2, v3}, Ll/j690;->n(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;Z)Ljava/util/List;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->e:Ljava/util/List;

    .line 43
    .line 44
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->e:Ljava/util/List;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->H(Ljava/util/List;)V

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->g:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->G(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->h:Ll/x20;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->B(Ll/x20;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->i:Ll/x20;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->F(Ll/x20;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->j:Ll/x20;

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->D(Ll/x20;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->k:Ll/a30;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->E(Ll/a30;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c$a;->l:Ll/x20;

    .line 75
    .line 76
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->C(Ll/x20;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/c;->K()V

    .line 80
    .line 81
    .line 82
    return-object v0
.end method
