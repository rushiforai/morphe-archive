.class public Ll/aop$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aop;->Y0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/aop;


# direct methods
.method public constructor <init>(Ll/aop;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aop$c;->a:Ll/aop;

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
    iget-object v0, p0, Ll/aop$c;->a:Ll/aop;

    .line 2
    .line 3
    invoke-static {v0}, Ll/aop;->F(Ll/aop;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/aop$c;->a:Ll/aop;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/aop;->f0(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
