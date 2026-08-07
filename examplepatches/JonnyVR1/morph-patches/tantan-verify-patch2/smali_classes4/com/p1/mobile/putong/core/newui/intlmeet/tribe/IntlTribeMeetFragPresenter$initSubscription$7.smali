.class final synthetic Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;
.super Lkotlin/jvm/internal/FunctionReferenceImpl;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter;->a0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1019
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/FunctionReferenceImpl;",
        "Lkotlin/jvm/functions/Function3<",
        "Lcom/p1/mobile/putong/data/DoublePair;",
        "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
        "Ljava/lang/Object;",
        "Lkotlin/Triple<",
        "+",
        "Lcom/p1/mobile/putong/data/DoublePair;",
        "+",
        "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
        "+",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;

    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;->INSTANCE:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const-string v4, "<init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V"

    const/4 v5, 0x0

    const/4 v1, 0x3

    const-class v2, Lkotlin/Triple;

    const-string v3, "<init>"

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lkotlin/jvm/internal/FunctionReferenceImpl;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/data/RoamedLocationData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlTribeMeetFragPresenter$initSubscription$7;->invoke(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/core/data/RoamedLocationData;Ljava/lang/Object;)Lkotlin/Triple;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final invoke(Lcom/p1/mobile/putong/data/DoublePair;Lcom/p1/mobile/putong/core/data/RoamedLocationData;Ljava/lang/Object;)Lkotlin/Triple;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/DoublePair;",
            "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
            "Ljava/lang/Object;",
            ")",
            "Lkotlin/Triple<",
            "Lcom/p1/mobile/putong/data/DoublePair;",
            "Lcom/p1/mobile/putong/core/data/RoamedLocationData;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 10
    new-instance p0, Lkotlin/Triple;

    invoke-direct {p0, p1, p2, p3}, Lkotlin/Triple;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p0
.end method
