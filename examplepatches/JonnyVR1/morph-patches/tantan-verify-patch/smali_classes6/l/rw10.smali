.class public final synthetic Ll/rw10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MusicCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;Lcom/p1/mobile/putong/feed/data/MusicCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rw10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;

    iput-object p2, p0, Ll/rw10;->b:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rw10;->a:Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;

    iget-object p0, p0, Ll/rw10;->b:Lcom/p1/mobile/putong/feed/data/MusicCategory;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicCategoryView;Lcom/p1/mobile/putong/feed/data/MusicCategory;Landroid/view/View;)V

    return-void
.end method
