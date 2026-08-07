.class public final synthetic Ll/xf3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xf3;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    iput-object p2, p0, Ll/xf3;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Ll/xf3;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xf3;->a:Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;

    iget-object v1, p0, Ll/xf3;->b:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Ll/xf3;->c:Ll/y20;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;->f(Lcom/p1/mobile/putong/ui/square/BubbleLayoutManager;Landroidx/recyclerview/widget/RecyclerView;Ll/y20;)V

    return-void
.end method
