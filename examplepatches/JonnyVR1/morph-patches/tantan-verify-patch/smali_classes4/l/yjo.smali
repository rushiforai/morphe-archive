.class public final synthetic Ll/yjo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fko;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;


# direct methods
.method public synthetic constructor <init>(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yjo;->a:Ll/fko;

    iput-object p2, p0, Ll/yjo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yjo;->a:Ll/fko;

    iget-object p0, p0, Ll/yjo;->b:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/fko;->H(Ll/fko;Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
