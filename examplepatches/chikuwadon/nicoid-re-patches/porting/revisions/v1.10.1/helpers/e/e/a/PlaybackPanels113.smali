.class public final Le/e/a/PlaybackPanels113;
.super Ljava/lang/Object;
.source "PlaybackPanels113.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PlaybackPanels113$Entry;
    }
.end annotation


# static fields
.field static final PANELS:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/app/Activity;",
            "Le/e/a/PlaybackPanels113$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 8
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static claim(Landroid/app/Activity;Landroid/view/View;Landroid/view/View;ILjava/lang/Object;)V
    .registers 9

    .line 15
    sget-object v0, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackPanels113$Entry;

    if-eqz v0, :cond_13

    iget-object v1, v0, Le/e/a/PlaybackPanels113$Entry;->panel:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_13

    return-void

    :cond_13
    sget-object v1, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v0, :cond_38

    invoke-virtual {v0}, Le/e/a/PlaybackPanels113$Entry;->remove()V

    iget-object v0, v0, Le/e/a/PlaybackPanels113$Entry;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p4, :cond_38

    instance-of v1, v0, Le/e/a/DirectBackground235$State;

    if-eqz v1, :cond_2f

    check-cast v0, Le/e/a/DirectBackground235$State;

    invoke-virtual {v0}, Le/e/a/DirectBackground235$State;->detach()V

    goto :goto_38

    :cond_2f
    instance-of v1, v0, Le/e/a/MiniSession225$Session;

    if-eqz v1, :cond_38

    check-cast v0, Le/e/a/MiniSession225$Session;

    invoke-virtual {v0}, Le/e/a/MiniSession225$Session;->detach()V

    .line 16
    :cond_38
    :goto_38
    invoke-static {}, Le/e/a/PlaybackBar221;->remove()V

    .line 17
    const v0, 0x1020002

    invoke-virtual {p0, v0}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 18
    if-eqz v0, :cond_67

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    :goto_4c
    if-gez v1, :cond_4f

    goto :goto_67

    :cond_4f
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-eq v2, p1, :cond_64

    const-string v3, "nicoid-retained-mini-player"

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_64

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeViewAt(I)V

    :cond_64
    add-int/lit8 v1, v1, -0x1

    goto :goto_4c

    .line 19
    :cond_67
    :goto_67
    new-instance v0, Le/e/a/PlaybackPanels113$Entry;

    invoke-direct {v0, p1, p2, p4, p3}, Le/e/a/PlaybackPanels113$Entry;-><init>(Landroid/view/View;Landroid/view/View;Ljava/lang/Object;I)V

    sget-object p1, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0, v0}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_85

    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result p0

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result p1

    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    iget v0, v0, Le/e/a/PlaybackPanels113$Entry;->base:I

    add-int/2addr v0, p3

    invoke-virtual {p2, p0, p1, p4, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 20
    :cond_85
    return-void
.end method

.method static release(Landroid/app/Activity;Landroid/view/View;)V
    .registers 4

    .line 21
    if-nez p0, :cond_3

    return-void

    :cond_3
    sget-object v0, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PlaybackPanels113$Entry;

    if-eqz v0, :cond_1e

    iget-object v1, v0, Le/e/a/PlaybackPanels113$Entry;->panel:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_1e

    sget-object p1, Le/e/a/PlaybackPanels113;->PANELS:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Le/e/a/PlaybackPanels113$Entry;->remove()V

    goto :goto_31

    :cond_1e
    if-eqz p1, :cond_31

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p0, p0, Landroid/view/ViewGroup;

    if-eqz p0, :cond_31

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_31
    :goto_31
    return-void
.end method
