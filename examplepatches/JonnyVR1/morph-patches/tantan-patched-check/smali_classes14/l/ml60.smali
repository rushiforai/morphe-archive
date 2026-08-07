.class public final synthetic Ll/ml60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/GPTransaction;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/GPTransaction;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ml60;->a:Lcom/p1/mobile/putong/data/GPTransaction;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ml60;->a:Lcom/p1/mobile/putong/data/GPTransaction;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->D(Lcom/p1/mobile/putong/data/GPTransaction;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
