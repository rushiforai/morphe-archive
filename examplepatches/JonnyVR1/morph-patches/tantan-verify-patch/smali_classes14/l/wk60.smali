.class public final synthetic Ll/wk60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/api/api/PaymentApi;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/api/api/PaymentApi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wk60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wk60;->a:Lcom/p1/mobile/putong/api/api/PaymentApi;

    check-cast p1, Lcom/p1/mobile/putong/data/GPResult;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/api/api/PaymentApi;->x(Lcom/p1/mobile/putong/api/api/PaymentApi;Lcom/p1/mobile/putong/data/GPResult;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
