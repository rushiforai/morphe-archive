.class public final synthetic Ll/sa20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Visitor;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Visitor;Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sa20;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/sa20;->b:Lcom/p1/mobile/putong/data/Visitor;

    iput-object p3, p0, Ll/sa20;->c:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sa20;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/sa20;->b:Lcom/p1/mobile/putong/data/Visitor;

    iget-object p0, p0, Ll/sa20;->c:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;->g(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Visitor;Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsItemView;Ljava/lang/Boolean;)V

    return-void
.end method
