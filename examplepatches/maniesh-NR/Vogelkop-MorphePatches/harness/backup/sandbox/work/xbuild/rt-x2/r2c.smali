.class public final Lr2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le8n;


# instance fields
.field public final a:Le8n;

.field public final synthetic b:Lcom/opera/android/custom_views/LayoutDirectionViewPager;


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/LayoutDirectionViewPager;Le8n;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lr2c;->b:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    iput-object p2, p0, Lr2c;->a:Le8n;

    return-void
.end method


# virtual methods
.method public final onPageScrollStateChanged(I)V
    .registers 2

    iget-object p0, p0, Lr2c;->a:Le8n;

    invoke-interface {p0, p1}, Le8n;->onPageScrollStateChanged(I)V

    return-void
.end method

.method public final onPageScrolled(IFI)V
    .registers 5

    iget-object v0, p0, Lr2c;->b:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p1

    iget-object p0, p0, Lr2c;->a:Le8n;

    invoke-interface {p0, p1, p2, p3}, Le8n;->onPageScrolled(IFI)V

    return-void
.end method

.method public final onPageSelected(I)V
    .registers 3

    iget-object v0, p0, Lr2c;->b:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result p1

    iget-object p0, p0, Lr2c;->a:Le8n;

    invoke-interface {p0, p1}, Le8n;->onPageSelected(I)V

    return-void
.end method
