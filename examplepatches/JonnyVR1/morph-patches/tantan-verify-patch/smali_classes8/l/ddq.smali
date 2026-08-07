.class public final synthetic Ll/ddq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ddq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ddq;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;

    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;->c(Lcom/p1/mobile/putong/core/ui/messages/ItemPendingPayment;Lcom/p1/mobile/putong/data/PayMethod;)V

    return-void
.end method
