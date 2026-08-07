.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$b;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;->h0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b$b;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/b;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    iput p0, p1, Landroid/graphics/Rect;->left:I

    .line 3
    .line 4
    sget p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->f:I

    .line 5
    .line 6
    int-to-float p2, p2

    .line 7
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 12
    .line 13
    sget p2, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewCaptionMediaView;->f:I

    .line 14
    .line 15
    int-to-float p2, p2

    .line 16
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, p1, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    iput p0, p1, Landroid/graphics/Rect;->bottom:I

    .line 23
    .line 24
    return-void
.end method
