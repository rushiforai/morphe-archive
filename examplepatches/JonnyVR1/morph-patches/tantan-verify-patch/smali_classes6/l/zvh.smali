.class public final synthetic Ll/zvh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$e;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

.field public final synthetic b:Ll/e1i;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/e1i;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zvh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    iput-object p2, p0, Ll/zvh;->b:Ll/e1i;

    iput-object p3, p0, Ll/zvh;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zvh;->a:Lcom/p1/mobile/putong/feed/newui/status/share/a;

    iget-object v1, p0, Ll/zvh;->b:Ll/e1i;

    iget-object v2, p0, Ll/zvh;->c:Ljava/util/List;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->s(Lcom/p1/mobile/putong/feed/newui/status/share/a;Ll/e1i;Ljava/util/List;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;I)V

    return-void
.end method
