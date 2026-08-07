.class public final Ll/r9p$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w9p$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r9p;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0019\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "l/r9p$a",
        "Ll/w9p$b;",
        "",
        "position",
        "oid",
        "",
        "a",
        "(II)V",
        "b_core_intlGmsRelease"
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
.field public final synthetic a:Ll/r9p;


# direct methods
.method public constructor <init>(Ll/r9p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static b(Ll/r9p;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;)Lkotlin/Unit;
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/bap;->INSTANCE:Ll/bap;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/bap;->c()Ll/jxd0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->O1:I

    .line 16
    .line 17
    invoke-static {v0}, Ll/o1j0;->w(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;->data:Lcom/p1/mobile/putong/core/data/IntlMarketResponseData;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseData;->quiz_option:Lcom/p1/mobile/putong/core/data/IntlMarketResponseOptionData;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Ll/r9p;->l(Lcom/p1/mobile/putong/core/data/IntlMarketResponseOptionData;)V

    .line 29
    .line 30
    .line 31
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 32
    .line 33
    return-object p0
.end method

.method public static c(Ll/r9p;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/r9p;->n()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 8
    .line 9
    .line 10
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public a(II)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r9p;->i(Ll/r9p;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 15
    .line 16
    invoke-static {p1}, Ll/r9p;->f(Ll/r9p;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p2, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 21
    .line 22
    invoke-static {p2}, Ll/r9p;->e(Ll/r9p;)Ll/w9p;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    const-string p2, "adapter"

    .line 29
    .line 30
    invoke-static {p2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const/4 p2, 0x0

    .line 34
    :cond_0
    invoke-virtual {p2}, Ll/w9p;->C()I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    add-int/lit8 p2, p2, -0x1

    .line 39
    .line 40
    if-ne p1, p2, :cond_2

    .line 41
    .line 42
    new-instance p1, Lcom/p1/mobile/putong/core/data/IntlMarketRequestParams;

    .line 43
    .line 44
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/IntlMarketRequestParams;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 48
    .line 49
    invoke-static {p2}, Ll/r9p;->i(Ll/r9p;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/IntlMarketRequestParams;->quiz_options:Ljava/util/List;

    .line 54
    .line 55
    sget p2, Ll/uqb0;->f0:I

    .line 56
    .line 57
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iput-object p2, p1, Lcom/p1/mobile/putong/core/data/IntlMarketRequestParams;->mcc:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p2, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 64
    .line 65
    invoke-virtual {p2}, Ll/r9p;->n()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-static {p2}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_1

    .line 74
    .line 75
    sget p1, Lcom/tantan/core/base/R$string;->l:I

    .line 76
    .line 77
    invoke-static {p1}, Ll/o1j0;->h(I)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/r9p;->n()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->A1:Ll/b89;

    .line 95
    .line 96
    iget-object v0, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/r9p;->n()Lcom/p1/mobile/android/app/Act;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object v1, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 103
    .line 104
    new-instance v2, Ll/p9p;

    .line 105
    .line 106
    invoke-direct {v2, v1}, Ll/p9p;-><init>(Ll/r9p;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ll/r9p$a;->a:Ll/r9p;

    .line 110
    .line 111
    new-instance v1, Ll/q9p;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/q9p;-><init>(Ll/r9p;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p2, v0, p1, v2, v1}, Ll/b89;->r3(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlMarketRequestParams;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method
