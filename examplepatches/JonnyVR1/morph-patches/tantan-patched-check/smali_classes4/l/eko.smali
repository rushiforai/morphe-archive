.class public final synthetic Ll/eko;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fko;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;


# direct methods
.method public synthetic constructor <init>(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eko;->a:Ll/fko;

    iput-object p2, p0, Ll/eko;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eko;->a:Ll/fko;

    iget-object p0, p0, Ll/eko;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    invoke-static {v0, p0}, Ll/fko;->I(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;)V

    return-void
.end method
