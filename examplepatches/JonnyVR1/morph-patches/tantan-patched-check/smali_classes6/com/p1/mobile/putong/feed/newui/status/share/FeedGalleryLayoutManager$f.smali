.class public Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "f"
.end annotation


# instance fields
.field public a:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->c:Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/util/SparseArray;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->a:Landroid/util/SparseArray;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$f;->b:I

    .line 15
    .line 16
    return-void
.end method
