.class public final synthetic Ll/ako;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

.field public final synthetic b:Ll/fko;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Ll/fko;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ako;->a:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iput-object p2, p0, Ll/ako;->b:Ll/fko;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ako;->a:Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;

    iget-object p0, p0, Ll/ako;->b:Ll/fko;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/fko;->J(Lcom/p1/mobile/putong/core/data/IntlBaseVisitorInfo;Ll/fko;Ljava/lang/Boolean;)V

    return-void
.end method
