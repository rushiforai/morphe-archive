.class public Ll/qa;
.super Ll/pd00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/jd00;",
        ">",
        "Ll/pd00<",
        "Ll/pa;",
        ">;"
    }
.end annotation


# instance fields
.field public J:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/pd00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic Y(Ll/qa;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qa;->J:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public F()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pd00;->F()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qa;->a0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public J()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "?speed=true"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-super {p0}, Ll/pd00;->J()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public Z()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qa;->J:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/qa;->J:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "mp.weixin.qq.com"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Ll/qa;->J:Ljava/lang/String;

    .line 28
    .line 29
    :cond_1
    iget-object p0, p0, Ll/qa;->J:Ljava/lang/String;

    .line 30
    .line 31
    return-object p0
.end method

.method public a0()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    invoke-virtual {v0}, Lv/navigationbar/VNavigationBar;->B()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/pd00;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->w2()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const/4 v2, 0x0

    .line 27
    const/4 v3, 0x1

    .line 28
    const/4 v4, 0x4

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sget v5, Ll/cbc0;->q0:I

    .line 36
    .line 37
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    sget v6, Ll/b9c0;->c:I

    .line 49
    .line 50
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 55
    .line 56
    invoke-virtual {v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 57
    .line 58
    .line 59
    new-instance v5, Lv/VIcon;

    .line 60
    .line 61
    invoke-direct {v5, v0}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v4}, Lv/VIcon;->setIconStyle(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/qa$a;

    .line 71
    .line 72
    invoke-direct {v1, p0, v0}, Ll/qa$a;-><init>(Ll/qa;Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 79
    .line 80
    new-array v6, v3, [Landroid/view/View;

    .line 81
    .line 82
    aput-object v5, v6, v2

    .line 83
    .line 84
    invoke-virtual {v1, v6}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;->y2()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    sget v5, Ll/cbc0;->o0:I

    .line 98
    .line 99
    invoke-virtual {v1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    sget v6, Ll/b9c0;->c:I

    .line 111
    .line 112
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    sget-object v6, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    .line 117
    .line 118
    invoke-virtual {v1, v5, v6}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 119
    .line 120
    .line 121
    new-instance v5, Lv/VIcon;

    .line 122
    .line 123
    invoke-direct {v5, v0}, Lv/VIcon;-><init>(Landroid/content/Context;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v5, v4}, Lv/VIcon;->setIconStyle(I)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    .line 131
    .line 132
    new-instance v1, Ll/qa$b;

    .line 133
    .line 134
    invoke-direct {v1, p0, v0}, Ll/qa$b;-><init>(Ll/qa;Lcom/p1/mobile/putong/ui/webview/mk/AccessTokenMkWebViewAct;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Ll/pd00;->b:Lv/navigationbar/VNavigationBar;

    .line 141
    .line 142
    new-array v0, v3, [Landroid/view/View;

    .line 143
    .line 144
    aput-object v5, v0, v2

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->z([Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    :cond_2
    :goto_0
    return-void
.end method

.method public b0()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/pd00;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string v0, "://"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    if-eqz p0, :cond_1

    .line 16
    .line 17
    array-length v0, p0

    .line 18
    const/4 v1, 0x1

    .line 19
    if-le v0, v1, :cond_1

    .line 20
    .line 21
    aget-object p0, p0, v1

    .line 22
    .line 23
    const-string v0, "mp.weixin.qq.com"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public z()Ll/dpf0;
    .locals 3

    .line 1
    invoke-super {p0}, Ll/pd00;->z()Ll/dpf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/qa$c;

    .line 6
    .line 7
    iget-object v2, p0, Ll/pd00;->f:Ll/w0c;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v0}, Ll/qa$c;-><init>(Ll/qa;Ll/nxl;Ll/dpf0;)V

    .line 10
    .line 11
    .line 12
    return-object v1
.end method
