.class public final synthetic Ll/ilm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroidx/recyclerview/widget/RecyclerView$e0;

.field public final synthetic b:Lv/VDraweeView;


# direct methods
.method public synthetic constructor <init>(Landroidx/recyclerview/widget/RecyclerView$e0;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ilm;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    iput-object p2, p0, Ll/ilm;->b:Lv/VDraweeView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ilm;->a:Landroidx/recyclerview/widget/RecyclerView$e0;

    iget-object p0, p0, Ll/ilm;->b:Lv/VDraweeView;

    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    invoke-static {v0, p0, p1}, Ll/nlm;->D(Landroidx/recyclerview/widget/RecyclerView$e0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Video;)V

    return-void
.end method
