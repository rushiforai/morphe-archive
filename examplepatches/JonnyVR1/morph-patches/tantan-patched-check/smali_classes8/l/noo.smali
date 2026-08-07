.class public final synthetic Ll/noo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/apo;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/apo;Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/noo;->a:Ll/apo;

    iput-object p2, p0, Ll/noo;->b:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    iput-object p3, p0, Ll/noo;->c:Ljava/util/List;

    iput-object p4, p0, Ll/noo;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/noo;->a:Ll/apo;

    iget-object v1, p0, Ll/noo;->b:Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;

    iget-object v2, p0, Ll/noo;->c:Ljava/util/List;

    iget-object p0, p0, Ll/noo;->d:Ljava/util/List;

    invoke-static {v0, v1, v2, p0}, Ll/apo;->u0(Ll/apo;Lcom/p1/mobile/putong/core/ui/intl/greet/message/IntlDynamicGreetListAct;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method
