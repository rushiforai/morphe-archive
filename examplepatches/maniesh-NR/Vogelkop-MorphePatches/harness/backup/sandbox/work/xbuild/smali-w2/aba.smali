.class public final Laba;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final o:J

.field public static final p:J


# instance fields
.field public final a:Lumi;

.field public final b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

.field public final c:Lru9;

.field public final d:Lnue;

.field public final e:Lpde;

.field public final f:Lpde;

.field public final g:Lpde;

.field public final h:Lpde;

.field public final i:Lpde;

.field public final j:Lq65;

.field public final k:Ltsd;

.field public l:Z

.field public m:Z

.field public n:Lk1g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x96

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Laba;->o:J

    const/4 v0, 0x5

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Laba;->p:J

    return-void
.end method

.method public constructor <init>(Lpde;Lumi;Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;Lru9;Lpde;Lnue;Lpde;Lpde;Lpde;Lpde;Lcom/opera/android/settings/SettingsManager;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Laba;->a:Lumi;

    iput-object p3, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    iput-object p4, p0, Laba;->c:Lru9;

    iput-object p6, p0, Laba;->d:Lnue;

    iput-object p7, p0, Laba;->e:Lpde;

    iput-object p8, p0, Laba;->f:Lpde;

    iput-object p9, p0, Laba;->g:Lpde;

    iput-object p10, p0, Laba;->h:Lpde;

    new-instance p2, Lpde;

    new-instance p3, Lzaa;

    const/4 p4, 0x0

    const/4 v0, 0x0

    invoke-direct {p3, v0, p4}, Lzaa;-><init>(IF)V

    invoke-direct {p2, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Laba;->i:Lpde;

    new-instance p2, Lvaa;

    invoke-direct {p2, p0, v0}, Lvaa;-><init>(Laba;B)V

    new-instance p3, Lq65;

    const/4 p4, 0x4

    invoke-direct {p3, p2, p4}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p3, p0, Laba;->j:Lq65;

    new-instance p2, Lq9a;

    const/4 p3, 0x2

    invoke-direct {p2, p3}, Lq9a;-><init>(B)V

    const-string v1, "addressbar_position"

    invoke-static {p11, v1, p2}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p2

    iput-object p2, p0, Laba;->k:Ltsd;

    sget-object p11, Lxaa;->i:Lxaa;

    iput-object p11, p0, Laba;->n:Lk1g;

    new-instance p11, Lwaa;

    invoke-direct {p11, p0, v0}, Lwaa;-><init>(Laba;B)V

    invoke-static {p5, p1, p11}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-interface {p6}, Lnue;->getVisibility()Lize;

    move-result-object p5

    new-instance p6, Lwaa;

    const/4 p11, 0x1

    invoke-direct {p6, p0, p11}, Lwaa;-><init>(Laba;B)V

    invoke-static {p5, p1, p6}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p5, Lwaa;

    invoke-direct {p5, p0, p3}, Lwaa;-><init>(Laba;B)V

    invoke-static {p7, p1, p5}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p3, Lwaa;

    const/4 p5, 0x3

    invoke-direct {p3, p0, p5}, Lwaa;-><init>(Laba;B)V

    invoke-static {p2, p1, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lwaa;

    invoke-direct {p2, p0, p4}, Lwaa;-><init>(Laba;B)V

    invoke-static {p8, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lwaa;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lwaa;-><init>(Laba;B)V

    invoke-static {p9, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    new-instance p2, Lwaa;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Lwaa;-><init>(Laba;B)V

    invoke-static {p10, p1, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Lzaa;
    .registers 4

    new-instance v0, Lzaa;

    iget-object p0, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1b

    iget-object v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->h:Landroid/text/StaticLayout;

    if-eqz v1, :cond_13

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result v2

    :cond_13
    iget v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->l:I

    if-ge v2, v1, :cond_18

    move v2, v1

    :cond_18
    iget v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->a:I

    add-int/2addr v2, v1

    :cond_1b
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-direct {v0, v2, p0}, Lzaa;-><init>(IF)V

    return-object v0
.end method

.method public final b(Z)V
    .registers 5

    iget-object v0, p0, Laba;->n:Lk1g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, v0, Lyaa;

    if-nez v0, :cond_a

    return-void

    :cond_a
    sget-object v0, Lxaa;->i:Lxaa;

    iput-object v0, p0, Laba;->n:Lk1g;

    iget-object v0, p0, Laba;->j:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    if-eqz p1, :cond_22

    sget-wide v1, Laba;->o:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    goto :goto_24

    :cond_22
    const-wide/16 v1, 0x0

    :goto_24
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lvaa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lvaa;-><init>(Laba;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lnl2;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lnl2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Laba;->g:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmnf;

    iget v0, v0, Lmnf;->b:I

    iget-object v1, p0, Laba;->f:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object p0, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    iget v1, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->e:I

    if-eq v1, v0, :cond_29

    iput v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->e:I

    iget-boolean v0, p0, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->f:Z

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_29
    return-void
.end method

.method public final d()V
    .registers 9

    sget-object v0, Lxaa;->i:Lxaa;

    iget-boolean v1, p0, Laba;->m:Z

    if-nez v1, :cond_4b

    iget-object v1, p0, Laba;->h:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llo3;

    iget-boolean v1, v1, Llo3;->a:Z

    if-eqz v1, :cond_4b

    iget-object v1, p0, Laba;->k:Ltsd;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lb7j;->c:Lb7j;

    if-ne v1, v2, :cond_4b

    iget-object v1, p0, Laba;->d:Lnue;

    invoke-interface {v1}, Lnue;->getVisibility()Lize;

    move-result-object v1

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llue;

    invoke-virtual {v1}, Llue;->d()Z

    move-result v1

    if-eqz v1, :cond_36

    new-instance v0, Lyaa;

    sget-object v1, Lbba;->b:Lbba;

    invoke-direct {v0, v1}, Lyaa;-><init>(Lbba;)V

    goto :goto_4b

    :cond_36
    iget-object v1, p0, Laba;->e:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4b

    new-instance v0, Lyaa;

    sget-object v1, Lbba;->c:Lbba;

    invoke-direct {v0, v1}, Lyaa;-><init>(Lbba;)V

    :cond_4b
    :goto_4b
    instance-of v1, v0, Lyaa;

    const/4 v2, 0x0

    if-eqz v1, :cond_d9

    check-cast v0, Lyaa;

    iget-object v1, p0, Laba;->n:Lk1g;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v1, v1, Lyaa;

    if-nez v1, :cond_5f

    iget-boolean v1, p0, Laba;->l:Z

    if-nez v1, :cond_60

    :cond_5f
    return-void

    :cond_60
    iput-boolean v2, p0, Laba;->l:Z

    iput-object v0, p0, Laba;->n:Lk1g;

    sget-wide v3, Laba;->p:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v5, p0, Laba;->j:Lq65;

    iget-object v6, p0, Laba;->a:Lumi;

    invoke-virtual {v5, v6, v3, v4, v1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-object v0, v0, Lyaa;->i:Lbba;

    iget-object v1, p0, Laba;->b:Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;

    iget-object v3, v1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->g:Lbba;

    if-eq v3, v0, :cond_80

    iput-object v0, v1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->g:Lbba;

    invoke-virtual {v1}, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->b()V

    :cond_80
    invoke-virtual {v1}, Landroid/view/View;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_89

    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    :cond_89
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object v0, p0, Laba;->c:Lru9;

    iget-object v3, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "startpage.swipe_up_hint_animation_play_count"

    invoke-interface {v3, v4, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v5, 0x1

    const/4 v6, 0x3

    if-ge v3, v6, :cond_9e

    move v7, v5

    goto :goto_9f

    :cond_9e
    move v7, v2

    :goto_9f
    iput-boolean v7, v1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->m:Z

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v7, v1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->j:Lf3d;

    if-ge v3, v6, :cond_c3

    if-eqz v7, :cond_b1

    invoke-virtual {v7, v2}, Lf3d;->p(I)V

    invoke-virtual {v7}, Lf3d;->k()V

    goto :goto_b3

    :cond_b1
    iput-boolean v5, v1, Lcom/opera/android/startpage/layout/feed_specific/HiddenStartPageContentHintView;->n:Z

    :goto_b3
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    add-int/2addr v3, v5

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    goto :goto_cf

    :cond_c3
    if-eqz v7, :cond_cf

    iget-object v0, v7, Lf3d;->b:Lp3d;

    invoke-virtual {v0}, Lp3d;->c()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {v7, v0}, Lf3d;->p(I)V

    :cond_cf
    :goto_cf
    iget-object v0, p0, Laba;->i:Lpde;

    invoke-virtual {p0}, Laba;->a()Lzaa;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :cond_d9
    invoke-virtual {p0, v2}, Laba;->b(Z)V

    return-void
.end method
