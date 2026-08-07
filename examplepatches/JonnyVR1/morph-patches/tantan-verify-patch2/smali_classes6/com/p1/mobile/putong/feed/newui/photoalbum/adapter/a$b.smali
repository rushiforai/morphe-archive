.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->P(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b$a;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a$b;->s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/Moment;ILandroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
