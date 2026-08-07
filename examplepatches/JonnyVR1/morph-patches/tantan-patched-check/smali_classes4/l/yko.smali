.class public final synthetic Ll/yko;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yko;->a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yko;->a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/ilo;->e0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    move-result-object p0

    return-object p0
.end method
