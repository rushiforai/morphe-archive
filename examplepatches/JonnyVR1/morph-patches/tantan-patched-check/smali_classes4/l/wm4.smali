.class public Ll/wm4;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->J8:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {}, Ll/s7a;->r()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    sget v1, Ll/adc0;->K0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/widget/TextView;

    .line 25
    .line 26
    const-string v2, "\u5361\u7247\u5c06\u4f18\u5148\u5c55\u793a"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    sget v1, Ll/adc0;->J0:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lv/VIcon;

    .line 38
    .line 39
    sget v2, Ll/dbc0;->Q2:I

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 45
    .line 46
    invoke-direct {v1, p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    invoke-virtual {v1, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string v0, "bubble_pin_like_push_id"

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->u(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->v(Ljava/lang/String;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->PIN_LIKE_SEND:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
