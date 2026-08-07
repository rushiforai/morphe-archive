.class public final synthetic Ll/q6j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v6j0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;


# direct methods
.method public synthetic constructor <init>(Ll/v6j0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q6j0;->a:Ll/v6j0;

    iput-object p2, p0, Ll/q6j0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/q6j0;->c:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q6j0;->a:Ll/v6j0;

    iget-object v1, p0, Ll/q6j0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/q6j0;->c:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/v6j0;->F(Ll/v6j0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
