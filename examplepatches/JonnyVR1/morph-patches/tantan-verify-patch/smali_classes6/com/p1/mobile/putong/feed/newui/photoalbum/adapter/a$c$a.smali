.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;->f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$c;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
