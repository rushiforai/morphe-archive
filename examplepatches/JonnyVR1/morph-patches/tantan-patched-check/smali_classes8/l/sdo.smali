.class public final synthetic Ll/sdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(ILkotlin/jvm/internal/Ref$BooleanRef;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/sdo;->a:I

    iput-object p2, p0, Ll/sdo;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p3, p0, Ll/sdo;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Ll/sdo;->a:I

    iget-object v1, p0, Ll/sdo;->b:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-object p0, p0, Ll/sdo;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/udo;->a(ILkotlin/jvm/internal/Ref$BooleanRef;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/IntlMarketResponseEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
