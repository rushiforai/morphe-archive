.class public final synthetic Ll/bl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PaymentParam;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bl60;->a:Lcom/p1/mobile/putong/data/PaymentParam;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bl60;->a:Lcom/p1/mobile/putong/data/PaymentParam;

    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/PaymentApi;->C(Lcom/p1/mobile/putong/data/PaymentParam;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
