.class public final synthetic Ll/xq60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/br60;


# direct methods
.method public synthetic constructor <init>(Ll/br60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xq60;->a:Ll/br60;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xq60;->a:Ll/br60;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;

    invoke-static {p0, p1}, Ll/br60;->b(Ll/br60;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;)V

    return-void
.end method
