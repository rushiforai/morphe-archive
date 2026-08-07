.class public Ll/lah$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lah;->e(Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;

.field public final synthetic b:Landroid/animation/AnimatorListenerAdapter;

.field public final synthetic c:Ll/lah;


# direct methods
.method public constructor <init>(Ll/lah;Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lah$a;->c:Ll/lah;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lah$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;

    .line 4
    .line 5
    iput-object p3, p0, Ll/lah$a;->b:Landroid/animation/AnimatorListenerAdapter;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/lah$a;->c:Ll/lah;

    .line 2
    .line 3
    iget-object v0, p1, Ll/lah;->a:Landroidx/viewpager/widget/ViewPager;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/lah$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;

    .line 8
    .line 9
    iget-object p0, p0, Ll/lah$a;->b:Landroid/animation/AnimatorListenerAdapter;

    .line 10
    .line 11
    invoke-interface {p1, v0, v1, p0}, Ll/tih;->b(Landroidx/viewpager/widget/ViewPager;Lcom/p1/mobile/putong/feed/newui/photoalbum/myInterestPeople/item/FeedMyInterestItem;Landroid/animation/AnimatorListenerAdapter;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
