.class public Ll/dem0$a;
.super Ll/cej;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dem0;->i(Landroid/view/View$OnClickListener;Ll/pcj;Ll/x20;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/pcj;

.field public final synthetic c:Ll/dem0;


# direct methods
.method public constructor <init>(Ll/dem0;Ll/x20;Ll/pcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/dem0$a;->a:Ll/x20;

    .line 4
    .line 5
    iput-object p3, p0, Ll/dem0$a;->b:Ll/pcj;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/cej;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Landroid/view/MotionEvent;FF)V
    .locals 0
    .param p2    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/cej;->a(Landroid/view/View;Landroid/view/MotionEvent;FF)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 5
    .line 6
    invoke-static {p2}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-object p2, p0, Ll/dem0$a;->b:Ll/pcj;

    .line 13
    .line 14
    invoke-interface {p2}, Ll/pcj;->call()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    iget-object p2, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {p2, p3}, Ll/dem0;->c(Ll/dem0;Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p2, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 36
    .line 37
    invoke-static {p2}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    if-eqz p2, :cond_5

    .line 42
    .line 43
    iget-object p2, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 44
    .line 45
    invoke-static {p2}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_3

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    if-eqz p2, :cond_1

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    iget-object p2, p2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 66
    .line 67
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const/4 p2, 0x0

    .line 75
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p3

    .line 79
    if-eqz p3, :cond_2

    .line 80
    .line 81
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 82
    .line 83
    .line 84
    move-result-object p3

    .line 85
    sget-object p4, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 86
    .line 87
    invoke-virtual {p3, p4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    if-eqz p3, :cond_2

    .line 92
    .line 93
    invoke-virtual {p2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    iget-object p3, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 102
    .line 103
    invoke-static {p3}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    check-cast p2, Landroid/view/ViewGroup;

    .line 108
    .line 109
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->g(Landroid/view/ViewGroup;)V

    .line 110
    .line 111
    .line 112
    :cond_2
    const-string p2, "virtual_voice_window_view"

    .line 113
    .line 114
    invoke-static {p2}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    if-eqz p3, :cond_3

    .line 119
    .line 120
    invoke-static {p2}, Ll/yti;->c(Ljava/lang/String;)Ll/jul;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-interface {p2}, Ll/lul;->a()Lcom/p1/mobile/putong/floatview/view/FxManagerView;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Landroid/view/View;->bringToFront()V

    .line 129
    .line 130
    .line 131
    :cond_3
    const/4 p2, 0x2

    .line 132
    new-array p2, p2, [I

    .line 133
    .line 134
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 135
    .line 136
    .line 137
    const/4 p3, 0x1

    .line 138
    aget p4, p2, p3

    .line 139
    .line 140
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    add-int/2addr p4, p1

    .line 145
    iget-object p1, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 146
    .line 147
    invoke-static {p1}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->getExitAreaView()Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-virtual {p1, p2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 156
    .line 157
    .line 158
    aget p1, p2, p3

    .line 159
    .line 160
    iget-object p0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 161
    .line 162
    if-le p4, p1, :cond_4

    .line 163
    .line 164
    invoke-static {p0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->h()V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_4
    invoke-static {p0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->i()V

    .line 177
    .line 178
    .line 179
    :cond_5
    return-void
.end method

.method public c(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/cej;->c(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 13
    .line 14
    invoke-static {v0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 25
    .line 26
    invoke-static {v0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->c()V

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x2

    .line 34
    new-array v0, v0, [I

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    aget v1, v0, v1

    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    add-int/2addr v1, p1

    .line 47
    iget-object p1, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 48
    .line 49
    invoke-static {p1}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->getExitAreaView()Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 61
    .line 62
    invoke-static {p1}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget-object v0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 71
    .line 72
    invoke-static {v0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->getExitAreaView()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    sub-int/2addr p1, v0

    .line 85
    if-lez p1, :cond_0

    .line 86
    .line 87
    if-le v1, p1, :cond_0

    .line 88
    .line 89
    iget-object p0, p0, Ll/dem0$a;->a:Ll/x20;

    .line 90
    .line 91
    invoke-interface {p0}, Ll/x20;->call()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_0
    iget-object p0, p0, Ll/dem0$a;->c:Ll/dem0;

    .line 96
    .line 97
    invoke-static {p0}, Ll/dem0;->a(Ll/dem0;)Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->i()V

    .line 102
    .line 103
    .line 104
    :cond_1
    return-void
.end method
