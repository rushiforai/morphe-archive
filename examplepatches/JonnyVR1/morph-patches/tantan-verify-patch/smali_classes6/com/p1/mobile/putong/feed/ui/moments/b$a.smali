.class public Lcom/p1/mobile/putong/feed/ui/moments/b$a;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/ui/moments/b;->v(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$a;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/b$a;->a:Lcom/p1/mobile/putong/feed/ui/moments/b;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/ui/moments/b;->k(Lcom/p1/mobile/putong/feed/ui/moments/b;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
