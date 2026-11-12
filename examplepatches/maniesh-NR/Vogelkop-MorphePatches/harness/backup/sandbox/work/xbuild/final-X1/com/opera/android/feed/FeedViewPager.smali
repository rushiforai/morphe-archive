.class public Lcom/opera/android/feed/FeedViewPager;
.super Lcom/opera/android/custom_views/LayoutDirectionViewPager;
.source "SourceFile"


# instance fields
.field public c:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    invoke-virtual {p1}, Ll2c;->b()Z

    move-result p1

    iput-boolean p1, p0, Lcom/opera/android/feed/FeedViewPager;->c:Z

    iget-object p0, p0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->b:Ll2c;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ll2c;->d(I)V

    return-void
.end method


# virtual methods
.method public final getWindowToken()Landroid/os/IBinder;
    .registers 1

    invoke-super {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    if-eqz p0, :cond_7

    return-object p0

    :cond_7
    sget-object p0, Lmx8;->a:Lmx8;

    return-object p0
.end method
