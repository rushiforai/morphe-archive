.class public final synthetic Ll/ya20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ya20;->a:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;

    iput-object p2, p0, Ll/ya20;->b:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ya20;->a:Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;

    iget-object p0, p0, Ll/ya20;->b:Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;

    check-cast p1, Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;->b(Lcom/p1/mobile/putong/core/ui/visitor/myvisitors/MyVisitorsMenuView;Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;Lcom/p1/mobile/putong/core/data/MyVisitorsShowType;)V

    return-void
.end method
