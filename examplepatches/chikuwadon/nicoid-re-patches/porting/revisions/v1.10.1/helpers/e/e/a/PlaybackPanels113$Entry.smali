.class final Le/e/a/PlaybackPanels113$Entry;
.super Ljava/lang/Object;
.source "PlaybackPanels113.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/PlaybackPanels113;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Entry"
.end annotation


# instance fields
.field final base:I

.field final body:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final height:I

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final panel:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/view/View;Landroid/view/View;Ljava/lang/Object;I)V
    .registers 6

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/PlaybackPanels113$Entry;->panel:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/PlaybackPanels113$Entry;->body:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/PlaybackPanels113$Entry;->owner:Ljava/lang/ref/WeakReference;

    if-nez p2, :cond_1c

    const/4 p1, 0x0

    goto :goto_20

    :cond_1c
    invoke-virtual {p2}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    :goto_20
    iput p1, p0, Le/e/a/PlaybackPanels113$Entry;->base:I

    iput p4, p0, Le/e/a/PlaybackPanels113$Entry;->height:I

    return-void
.end method


# virtual methods
.method remove()V
    .registers 6

    .line 12
    iget-object v0, p0, Le/e/a/PlaybackPanels113$Entry;->panel:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1b

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1b
    iget-object v0, p0, Le/e/a/PlaybackPanels113$Entry;->body:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_41

    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    iget v2, p0, Le/e/a/PlaybackPanels113$Entry;->base:I

    iget v3, p0, Le/e/a/PlaybackPanels113$Entry;->height:I

    add-int/2addr v2, v3

    if-ne v1, v2, :cond_41

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget v4, p0, Le/e/a/PlaybackPanels113$Entry;->base:I

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    :cond_41
    return-void
.end method
