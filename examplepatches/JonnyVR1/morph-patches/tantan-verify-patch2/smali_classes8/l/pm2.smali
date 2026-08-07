.class public final synthetic Ll/pm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pm2;->a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pm2;->a:Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/an2;->m0(Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;

    move-result-object p0

    return-object p0
.end method
