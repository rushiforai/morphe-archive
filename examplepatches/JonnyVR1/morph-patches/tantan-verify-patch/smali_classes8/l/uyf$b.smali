.class public Ll/uyf$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/uyf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uyf;


# direct methods
.method public constructor <init>(Ll/uyf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uyf$b;->a:Ll/uyf;

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
    iget-object v0, p0, Ll/uyf$b;->a:Ll/uyf;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uyf;->q(Ll/uyf;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/uyf$b;->a:Ll/uyf;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/uyf;->n(Ll/uyf;I)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/uyf$b;->a:Ll/uyf;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/uyf;->o(Ll/uyf;I)Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Ll/uyf;->p(Ll/uyf;Lcom/p1/mobile/putong/core/data/FakeGoodLifeUserInfo;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
