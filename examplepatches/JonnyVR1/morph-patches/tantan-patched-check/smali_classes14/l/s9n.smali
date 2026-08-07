.class public final synthetic Ll/s9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jan;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;


# direct methods
.method public synthetic constructor <init>(Ll/jan;Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s9n;->a:Ll/jan;

    iput-object p2, p0, Ll/s9n;->b:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s9n;->a:Ll/jan;

    iget-object p0, p0, Ll/s9n;->b:Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;

    invoke-static {v0, p0}, Ll/jan;->i3(Ll/jan;Lcom/p1/mobile/putong/core/data/IntlCurrencyDiamond;)V

    return-void
.end method
