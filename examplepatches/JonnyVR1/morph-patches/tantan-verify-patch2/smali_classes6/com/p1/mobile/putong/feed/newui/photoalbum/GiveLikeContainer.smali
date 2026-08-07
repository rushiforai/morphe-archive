.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/Runnable;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

.field public c:Z

.field public d:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->a:Ljava/lang/Runnable;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;-><init>(Ll/u3k;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->c:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->a:Ljava/lang/Runnable;

    .line 22
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;-><init>(Ll/u3k;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    const/4 p2, 0x0

    .line 23
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->c:Z

    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->a:Ljava/lang/Runnable;

    .line 27
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;-><init>(Ll/u3k;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    const/4 p2, 0x0

    .line 28
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->c:Z

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->s()V

    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->b(Landroid/view/MotionEvent;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->a:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-super {p0, p1}, Lv/VFrame;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public final synthetic s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer$a;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->c:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    .line 27
    .line 28
    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public setClickView(Landroid/view/View$OnClickListener;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->d:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    new-instance p1, Ll/t3k;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Ll/t3k;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;)V

    .line 6
    .line 7
    .line 8
    const-wide/16 v0, 0xc8

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnClick(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/GiveLikeContainer;->a:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method
