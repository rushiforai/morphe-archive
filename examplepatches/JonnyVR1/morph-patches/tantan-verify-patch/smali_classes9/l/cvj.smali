.class public final synthetic Ll/cvj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;Ljava/lang/Object;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cvj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    iput-object p2, p0, Ll/cvj;->b:Ljava/lang/Object;

    iput-object p3, p0, Ll/cvj;->c:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cvj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    iget-object v1, p0, Ll/cvj;->b:Ljava/lang/Object;

    iget-object p0, p0, Ll/cvj;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->i0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;Ljava/lang/Object;Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method
