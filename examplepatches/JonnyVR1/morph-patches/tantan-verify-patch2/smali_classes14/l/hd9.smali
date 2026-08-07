.class public final synthetic Ll/hd9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nd9;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;


# direct methods
.method public synthetic constructor <init>(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hd9;->a:Ll/nd9;

    iput-object p2, p0, Ll/hd9;->b:Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hd9;->a:Ll/nd9;

    iget-object p0, p0, Ll/hd9;->b:Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;

    invoke-static {v0, p0}, Ll/nd9;->h3(Ll/nd9;Lcom/p1/mobile/putong/core/data/IntlInnerWebPay;)V

    return-void
.end method
