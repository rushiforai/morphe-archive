.class public Ll/dzm0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/f2n0;


# direct methods
.method public constructor <init>(Ll/f2n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dzm0;->a:Ll/f2n0;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/dzm0;Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dzm0;->b(Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic b(Landroid/app/Activity;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dzm0;->a:Ll/f2n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f2n0;->p(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(ILandroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    .line 15
    .line 16
    const-string v1, "voice_call_view"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/4 v2, 0x1

    .line 23
    if-ne p1, v2, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    :cond_2
    return-void

    .line 42
    :cond_3
    invoke-virtual {p0, p2, p3}, Ll/dzm0;->d(Landroid/app/Activity;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    :goto_0
    return-void
.end method

.method public d(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_3

    .line 16
    .line 17
    instance-of p2, p1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-direct {p2, v1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/czm0;

    .line 32
    .line 33
    invoke-direct {v1, p0, p1}, Ll/czm0;-><init>(Ll/dzm0;Landroid/app/Activity;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    const-string v1, "voice_call_view"

    .line 40
    .line 41
    invoke-virtual {p2, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    instance-of v1, p1, Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    new-instance v1, Ll/dzm0$a;

    .line 51
    .line 52
    invoke-direct {v1, p0, p2}, Ll/dzm0$a;-><init>(Ll/dzm0;Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallView;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->addSwipeBackListener(Ll/ujh0;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 59
    .line 60
    const/4 p1, -0x2

    .line 61
    invoke-direct {p0, p1, p1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 62
    .line 63
    .line 64
    instance-of p1, v0, Landroid/widget/FrameLayout;

    .line 65
    .line 66
    if-eqz p1, :cond_2

    .line 67
    .line 68
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 69
    .line 70
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    const/4 p0, 0x5

    .line 74
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 75
    .line 76
    const/high16 p0, 0x427c0000    # 63.0f

    .line 77
    .line 78
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-static {}, Ll/bnl0;->F0()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    add-int/2addr p0, v1

    .line 87
    iput p0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 88
    .line 89
    move-object p0, p1

    .line 90
    :cond_2
    invoke-virtual {v0, p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    return-void
.end method
