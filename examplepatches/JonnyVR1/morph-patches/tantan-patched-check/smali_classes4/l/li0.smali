.class public final synthetic Ll/li0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qi0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;


# direct methods
.method public synthetic constructor <init>(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/li0;->a:Ll/qi0;

    iput-object p2, p0, Ll/li0;->b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/li0;->a:Ll/qi0;

    iget-object p0, p0, Ll/li0;->b:Lcom/p1/mobile/putong/core/data/SignPaymentParam;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/qi0;->g(Ll/qi0;Lcom/p1/mobile/putong/core/data/SignPaymentParam;Ljava/lang/Throwable;)V

    return-void
.end method
