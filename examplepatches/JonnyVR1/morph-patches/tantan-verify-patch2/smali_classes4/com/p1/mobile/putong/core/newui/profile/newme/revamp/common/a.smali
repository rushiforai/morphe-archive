.class public final Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;",
        "cardType",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "a",
        "(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Lcom/p1/mobile/putong/core/data/PurchaseType;",
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


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;->INSTANCE:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;)Lcom/p1/mobile/putong/core/data/PurchaseType;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/a$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    aget p0, p0, p1

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    if-eq p0, p1, :cond_3

    .line 14
    .line 15
    const/4 p1, 0x2

    .line 16
    if-eq p0, p1, :cond_2

    .line 17
    .line 18
    const/4 p1, 0x3

    .line 19
    if-eq p0, p1, :cond_1

    .line 20
    .line 21
    const/4 p1, 0x4

    .line 22
    if-ne p0, p1, :cond_0

    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_ULTRA_PREMIUM:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_0
    invoke-static {}, Ll/nbr;->a()V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return-object p0

    .line 32
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_VIP:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 39
    .line 40
    return-object p0
.end method
