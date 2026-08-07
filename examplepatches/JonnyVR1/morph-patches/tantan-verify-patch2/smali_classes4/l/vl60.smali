.class public final synthetic Ll/vl60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/xl60;

.field public final synthetic b:Ll/sol;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

.field public final synthetic d:Ll/mdf0;


# direct methods
.method public synthetic constructor <init>(Ll/xl60;Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vl60;->a:Ll/xl60;

    iput-object p2, p0, Ll/vl60;->b:Ll/sol;

    iput-object p3, p0, Ll/vl60;->c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    iput-object p4, p0, Ll/vl60;->d:Ll/mdf0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vl60;->a:Ll/xl60;

    iget-object v1, p0, Ll/vl60;->b:Ll/sol;

    iget-object v2, p0, Ll/vl60;->c:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    iget-object p0, p0, Ll/vl60;->d:Ll/mdf0;

    invoke-static {v0, v1, v2, p0}, Ll/xl60;->c(Ll/xl60;Ll/sol;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ll/mdf0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
