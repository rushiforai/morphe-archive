.class public final Ll/dn60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j2m;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0012\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u001f\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0011\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015R\u0017\u0010\u0005\u001a\u00020\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0016\u0010\u0017\u001a\u0004\u0008\u0018\u0010\u0019R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001a\u0010\u001b\u001a\u0004\u0008\u001c\u0010\u001dR\u0019\u0010\t\u001a\u0004\u0018\u00010\u00088\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001e\u0010\u001f\u001a\u0004\u0008 \u0010!\u00a8\u0006\""
    }
    d2 = {
        "Ll/dn60;",
        "Ll/j2m;",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "Ll/ndb0;",
        "mediator",
        "<init>",
        "(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V",
        "Ll/jn60;",
        "paymentHandlerData",
        "Ll/l5;",
        "paymentComponent",
        "",
        "a",
        "(Ll/jn60;Ll/l5;)Z",
        "Lcom/p1/mobile/android/app/Act;",
        "getAct",
        "()Lcom/p1/mobile/android/app/Act;",
        "b",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "c",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "d",
        "Ll/ndb0;",
        "getMediator",
        "()Ll/ndb0;",
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

.field public final c:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public final d:Ll/ndb0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ll/ndb0;)V
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
    .param p4    # Ll/ndb0;
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
    iput-object p1, p0, Ll/dn60;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/dn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/dn60;->c:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p4, p0, Ll/dn60;->d:Ll/ndb0;

    .line 17
    .line 18
    return-void
.end method

.method public static b(Ll/dn60;Ll/jn60;Ll/l5;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->CHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dn60;->d:Ll/ndb0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jn60;->c()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    :cond_0
    invoke-virtual {p0, v1, v0}, Ll/ndb0;->V(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x3

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p2, p0}, Ll/l5;->x(Ljava/lang/Integer;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a(Ll/jn60;Ll/l5;)Z
    .locals 3
    .param p1    # Ll/jn60;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/l5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    const-string v0, ""

    .line 8
    .line 9
    invoke-static {v0}, Ll/pta;->s(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/dn60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ll/dn60;->d:Ll/ndb0;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->l()Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    move-object v0, v1

    .line 34
    :goto_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->UNCHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 35
    .line 36
    if-ne v0, v2, :cond_2

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->m()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    iget-object v0, p0, Ll/dn60;->a:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    iget-object v2, p0, Ll/dn60;->d:Ll/ndb0;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q()Ll/lib0;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_1

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    :cond_1
    new-instance v2, Ll/cn60;

    .line 63
    .line 64
    invoke-direct {v2, p0, p1, p2}, Ll/cn60;-><init>(Ll/dn60;Ll/jn60;Ll/l5;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Ll/pta;->B(Lcom/p1/mobile/android/app/Act;Lorg/json/JSONObject;Ll/x20;)V

    .line 68
    .line 69
    .line 70
    const/4 p0, 0x1

    .line 71
    return p0

    .line 72
    :cond_2
    const/4 p0, 0x0

    .line 73
    return p0
.end method
