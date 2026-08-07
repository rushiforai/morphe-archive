.class public Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;
.super Landroid/widget/ScrollView;
.source "SourceFile"

# interfaces
.implements Ll/ugb0;


# instance fields
.field public a:Lv/VFrame;

.field public b:Lv/VImage;

.field public c:Lv/VText;

.field public d:Z

.field public e:Landroid/animation/Animator;

.field public f:Landroid/animation/Animator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->e:Landroid/animation/Animator;

    return-object p0
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->d:Z

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)Landroid/animation/Animator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->f:Landroid/animation/Animator;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->e:Landroid/animation/Animator;

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->f:Landroid/animation/Animator;

    return-void
.end method

.method private g()V
    .locals 3

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x500

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->a:Lv/VFrame;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x43820000    # 260.0f

    .line 16
    .line 17
    invoke-static {}, Ll/vnb;->m1()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    mul-float/2addr v2, v1

    .line 22
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/high16 v0, 0x437a0000    # 250.0f

    .line 35
    .line 36
    invoke-static {}, Ll/vnb;->m1()F

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    mul-float/2addr v1, v0

    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->c:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->g7:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->g()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 12
    .line 13
    sget v1, Ll/jbc0;->Jb:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent$a;-><init>(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jr50;->a(Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->e:Landroid/animation/Animator;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->d:Z

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->e:Landroid/animation/Animator;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->b:Lv/VImage;

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->f(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->h()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/result/OnlineMatchContent;->i()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
