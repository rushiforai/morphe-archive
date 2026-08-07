.class public Ll/b5i$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/b5i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b5i;


# direct methods
.method public constructor <init>(Ll/b5i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/b5i$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/b5i$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 2
    .line 3
    invoke-static {v0}, Ll/b5i;->h(Ll/b5i;)Landroid/widget/PopupWindow;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 10
    .line 11
    invoke-static {v0}, Ll/b5i;->h(Ll/b5i;)Landroid/widget/PopupWindow;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0}, Ll/b5i;->i(Ll/b5i;Landroid/widget/PopupWindow;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 2
    .line 3
    invoke-static {v0}, Ll/b5i;->g(Ll/b5i;)Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 14
    .line 15
    invoke-static {v0}, Ll/b5i;->h(Ll/b5i;)Landroid/widget/PopupWindow;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/b5i$a;->a:Ll/b5i;

    .line 26
    .line 27
    invoke-static {v0}, Ll/b5i;->g(Ll/b5i;)Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;->d:Lcom/p1/mobile/putong/feed/newui/status/improve/FeedStatusPostGuidePopView;

    .line 32
    .line 33
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 34
    .line 35
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 36
    .line 37
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    new-array v8, v0, [F

    .line 42
    .line 43
    fill-array-data v8, :array_0

    .line 44
    .line 45
    .line 46
    const-wide/16 v3, 0x0

    .line 47
    .line 48
    const-wide/16 v5, 0x12c

    .line 49
    .line 50
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/a5i;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/a5i;-><init>(Ll/b5i$a;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void

    .line 66
    nop

    .line 67
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
