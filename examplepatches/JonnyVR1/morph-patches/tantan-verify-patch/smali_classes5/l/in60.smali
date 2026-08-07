.class public final Ll/in60;
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
        "Ll/in60;",
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
    iput-object p1, p0, Ll/in60;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    iput-object p2, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 13
    .line 14
    iput-object p3, p0, Ll/in60;->c:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p4, p0, Ll/in60;->d:Ll/ndb0;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic b(Ll/l5;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/in60;->f(Ll/l5;)V

    return-void
.end method

.method public static synthetic c(ZLl/l5;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/in60;->g(ZLl/l5;)V

    return-void
.end method

.method public static d(Ll/in60;Ll/jn60;Ll/l5;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;->CHECKED:Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;

    .line 2
    .line 3
    iget-object v1, p0, Ll/in60;->d:Ll/ndb0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jn60;->c()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    :cond_0
    invoke-virtual {v1, v2, v0}, Ll/ndb0;->V(Lcom/p1/mobile/putong/core/ui/purchase/d;Lcom/p1/mobile/putong/core/ui/purchase/mediator/agreement/PurchaseAgreementState;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/in60;->a:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    new-instance p1, Ll/gn60;

    .line 21
    .line 22
    invoke-direct {p1, p2}, Ll/gn60;-><init>(Ll/l5;)V

    .line 23
    .line 24
    .line 25
    const-wide/16 v0, 0x64

    .line 26
    .line 27
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static e(Ll/jn60;Ll/in60;ILl/l5;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/pta;->p()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Ll/in60;->d:Ll/ndb0;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/ndb0;->Y(I)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    iget-object p1, p1, Ll/in60;->a:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    new-instance p2, Ll/hn60;

    .line 31
    .line 32
    invoke-direct {p2, p0, p3}, Ll/hn60;-><init>(ZLl/l5;)V

    .line 33
    .line 34
    .line 35
    const-wide/16 v0, 0xfa

    .line 36
    .line 37
    invoke-static {p1, p2, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public static final f(Ll/l5;)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0, v0}, Ll/l5;->x(Ljava/lang/Integer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static final g(ZLl/l5;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x4

    .line 4
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Ll/l5;->x(Ljava/lang/Integer;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ll/jn60;Ll/l5;)Z
    .locals 9
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
    if-eqz v0, :cond_3

    .line 14
    .line 15
    iget-object v0, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 16
    .line 17
    invoke-static {v0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Ll/in60;->d:Ll/ndb0;

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
    if-ne v0, v2, :cond_3

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
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Ll/in60;->c:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_3

    .line 55
    .line 56
    sget-object v0, Ll/g6b;->Companion:Ll/g6b$a;

    .line 57
    .line 58
    iget-object v2, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ll/g6b$a;->c(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    if-nez v2, :cond_1

    .line 65
    .line 66
    iget-object v2, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Ll/g6b$a;->a(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    :cond_1
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->p()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v2, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 87
    .line 88
    invoke-static {v0, v2}, Ll/pta;->l(ILcom/p1/mobile/putong/core/data/PurchaseType;)Landroid/text/SpannableStringBuilder;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual {p1}, Ll/jn60;->b()Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 105
    .line 106
    iget-object v3, p0, Ll/in60;->a:Lcom/p1/mobile/android/app/Act;

    .line 107
    .line 108
    iget-object v5, p0, Ll/in60;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 109
    .line 110
    iget-object v2, p0, Ll/in60;->d:Ll/ndb0;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/mediator/a;->q()Ll/lib0;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    if-eqz v2, :cond_2

    .line 117
    .line 118
    invoke-virtual {v2}, Ll/lib0;->e()Lorg/json/JSONObject;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    :cond_2
    move-object v6, v1

    .line 123
    new-instance v7, Ll/en60;

    .line 124
    .line 125
    invoke-direct {v7, p0, p1, p2}, Ll/en60;-><init>(Ll/in60;Ll/jn60;Ll/l5;)V

    .line 126
    .line 127
    .line 128
    new-instance v8, Ll/fn60;

    .line 129
    .line 130
    invoke-direct {v8, p1, p0, v0, p2}, Ll/fn60;-><init>(Ll/jn60;Ll/in60;ILl/l5;)V

    .line 131
    .line 132
    .line 133
    invoke-static/range {v3 .. v8}, Ll/pta;->D(Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/core/data/PurchaseType;Lorg/json/JSONObject;Ll/x20;Ll/x20;)V

    .line 134
    .line 135
    .line 136
    const/4 p0, 0x1

    .line 137
    return p0

    .line 138
    :cond_3
    const/4 p0, 0x0

    .line 139
    return p0
.end method
