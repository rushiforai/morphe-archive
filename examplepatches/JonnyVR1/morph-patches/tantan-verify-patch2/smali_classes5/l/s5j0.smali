.class public final synthetic Ll/s5j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;Ll/y20;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s5j0;->a:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

    iput-object p2, p0, Ll/s5j0;->b:Ll/y20;

    iput-object p3, p0, Ll/s5j0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s5j0;->a:Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;

    iget-object v1, p0, Ll/s5j0;->b:Ll/y20;

    iget-object p0, p0, Ll/s5j0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;->c(Lcom/p1/mobile/putong/core/ui/toppicks/TopPicksItemView;Ll/y20;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
