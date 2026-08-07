.class public Ll/iss$a$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/iss$a;->f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/iss$a;


# direct methods
.method public constructor <init>(Ll/iss$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iss$a$a;->a:Ll/iss$a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager$m;->onPageScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/iss$a$a;->a:Ll/iss$a;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
