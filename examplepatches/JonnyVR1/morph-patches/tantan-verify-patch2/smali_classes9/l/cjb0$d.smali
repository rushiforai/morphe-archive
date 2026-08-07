.class public final Ll/cjb0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cjb0;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/cjb0$d",
        "Lcom/p1/mobile/putong/core/ui/purchase/mediator/a$b;",
        "Ll/jn60;",
        "paymentHandlerData",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "a",
        "(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V",
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
.field public final synthetic a:Ll/cjb0;


# direct methods
.method public constructor <init>(Ll/cjb0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cjb0$d;->a:Ll/cjb0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ll/jn60;->e()Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x4

    .line 19
    if-eq v1, v2, :cond_2

    .line 20
    .line 21
    :goto_0
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x3

    .line 29
    if-ne v1, v2, :cond_3

    .line 30
    .line 31
    :cond_2
    move-object v1, p1

    .line 32
    move-object v2, p2

    .line 33
    goto :goto_3

    .line 34
    :cond_3
    :goto_1
    if-nez v0, :cond_5

    .line 35
    .line 36
    :cond_4
    move-object v1, p1

    .line 37
    move-object v2, p2

    .line 38
    goto :goto_2

    .line 39
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x2

    .line 44
    if-ne v0, v1, :cond_4

    .line 45
    .line 46
    iget-object p0, p0, Ll/cjb0$d;->a:Ll/cjb0;

    .line 47
    .line 48
    invoke-static {p0}, Ll/cjb0;->g(Ll/cjb0;)Ll/lib0;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-eqz v0, :cond_6

    .line 53
    .line 54
    const/4 v4, 0x4

    .line 55
    const/4 v5, 0x0

    .line 56
    const/4 v3, 0x0

    .line 57
    move-object v1, p1

    .line 58
    move-object v2, p2

    .line 59
    invoke-static/range {v0 .. v5}, Ll/lib0;->u(Ll/lib0;Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;ZILjava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :goto_2
    iget-object p0, p0, Ll/cjb0$d;->a:Ll/cjb0;

    .line 64
    .line 65
    invoke-static {p0}, Ll/cjb0;->g(Ll/cjb0;)Ll/lib0;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    invoke-virtual {p0, v1, v2}, Ll/lib0;->x(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :goto_3
    iget-object p0, p0, Ll/cjb0$d;->a:Ll/cjb0;

    .line 76
    .line 77
    invoke-static {p0}, Ll/cjb0;->g(Ll/cjb0;)Ll/lib0;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    if-eqz p0, :cond_6

    .line 82
    .line 83
    invoke-virtual {p0, v1, v2}, Ll/lib0;->s(Ll/jn60;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 84
    .line 85
    .line 86
    :cond_6
    return-void
.end method
