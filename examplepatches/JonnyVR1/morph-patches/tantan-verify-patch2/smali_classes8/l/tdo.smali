.class public final synthetic Ll/tdo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tdo;->a:Lcom/p1/mobile/android/app/Act;

    iput p2, p0, Ll/tdo;->b:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tdo;->a:Lcom/p1/mobile/android/app/Act;

    iget p0, p0, Ll/tdo;->b:I

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;

    invoke-static {v0, p0, p1}, Ll/udo;->b(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/data/IntlMarketConfigEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
