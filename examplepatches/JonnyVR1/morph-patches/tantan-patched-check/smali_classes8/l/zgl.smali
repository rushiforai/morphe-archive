.class public final synthetic Ll/zgl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;

.field public final synthetic b:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zgl;->a:Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;

    iput-object p2, p0, Ll/zgl;->b:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zgl;->a:Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;

    iget-object p0, p0, Ll/zgl;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;->a(Lcom/p1/mobile/putong/core/ui/gift/HorRecyclerViewIndicator;Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
