.class public Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->v(Ll/ftn;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->B(Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->d:Lv/VDraweeView;

    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->e:Lv/VMarqueeText;

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 56
    .line 57
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->f:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationX(F)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 84
    .line 85
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 88
    .line 89
    .line 90
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;->g:Lv/VFrame;

    .line 93
    .line 94
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 98
    .line 99
    const/4 p1, 0x0

    .line 100
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead$b;->a:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryUnRead;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
