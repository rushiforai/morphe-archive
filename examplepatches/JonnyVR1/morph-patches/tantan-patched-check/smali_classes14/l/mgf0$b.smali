.class public Ll/mgf0$b;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mgf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Ll/mgf0;


# direct methods
.method public constructor <init>(Ll/mgf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mgf0$b;->a:Ll/mgf0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/viewpager2/widget/ViewPager2$i;->onPageScrolled(IFI)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/mgf0$b;->a:Ll/mgf0;

    .line 5
    .line 6
    iget-object p2, p2, Ll/mgf0;->i:Landroidx/viewpager2/widget/ViewPager2;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-ne p2, p1, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Ll/mgf0$b;->a:Ll/mgf0;

    .line 15
    .line 16
    invoke-static {p2}, Ll/mgf0;->h0(Ll/mgf0;)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eq p2, p1, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Ll/mgf0$b;->a:Ll/mgf0;

    .line 23
    .line 24
    invoke-static {p2, p1}, Ll/mgf0;->j0(Ll/mgf0;I)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/mgf0$b;->a:Ll/mgf0;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/mgf0;->i0(Ll/mgf0;I)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    return-void
.end method
