.class public final synthetic Ll/uq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/br60;


# direct methods
.method public synthetic constructor <init>(Ll/br60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uq60;->a:Ll/br60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uq60;->a:Ll/br60;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    invoke-static {p0, p1}, Ll/br60;->a(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
