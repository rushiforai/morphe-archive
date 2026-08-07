.class public Ll/j41$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/j41;->d(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/j41;


# direct methods
.method public constructor <init>(Ll/j41;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j41$a;->a:Ll/j41;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/j41$a;->a:Ll/j41;

    .line 2
    .line 3
    iget-object v0, p0, Ll/j41;->a:Ll/f41;

    .line 4
    .line 5
    iget-object v0, v0, Ll/f41;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/BottomSheetNestedProxyView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/j41;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/b;->k(I)Landroidx/recyclerview/widget/RecyclerView;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/BottomSheetNestedProxyView;->setRealNestedScrollView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
