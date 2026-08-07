.class public final synthetic Ll/ftl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ktl0;


# direct methods
.method public synthetic constructor <init>(Ll/ktl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ftl0;->a:Ll/ktl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ftl0;->a:Ll/ktl0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    invoke-static {p0, p1}, Ll/ktl0;->l0(Ll/ktl0;Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
