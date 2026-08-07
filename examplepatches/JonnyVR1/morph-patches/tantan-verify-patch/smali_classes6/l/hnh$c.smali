.class public Ll/hnh$c;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hnh;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/h80;

.field public final synthetic b:Ll/hnh;


# direct methods
.method public constructor <init>(Ll/hnh;Ll/h80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hnh$c;->b:Ll/hnh;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hnh$c;->a:Ll/h80;

    .line 4
    .line 5
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/hnh$c;->a:Ll/h80;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
