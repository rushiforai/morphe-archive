.class public Ll/sup0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sup0;->v()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sup0;


# direct methods
.method public constructor <init>(Ll/sup0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sup0;->e:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "step"

    .line 16
    .line 17
    const-string v2, "onFinish"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 23
    .line 24
    invoke-virtual {v1, p1, v0}, Ll/sup0;->L(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 28
    .line 29
    iget-object v0, v0, Ll/sup0;->k:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 38
    .line 39
    iget-object v0, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 48
    .line 49
    iget-object v0, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 50
    .line 51
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 70
    .line 71
    iget-object p1, p1, Ll/sup0;->f:Landroid/widget/FrameLayout;

    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 80
    .line 81
    iget-object p1, p1, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 82
    .line 83
    sget v0, Ll/ycc0;->J0:I

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 90
    .line 91
    if-nez p1, :cond_0

    .line 92
    .line 93
    invoke-static {v0}, Ll/sup0;->d(Ll/sup0;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object v0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 98
    .line 99
    iget-object v0, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 109
    .line 110
    iget-object v0, p1, Ll/sup0;->b:Lv/navigationbar/VNavigationBar;

    .line 111
    .line 112
    iget-object p1, p1, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_0
    iget-object p1, v0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 123
    .line 124
    sget v0, Ll/ycc0;->J0:I

    .line 125
    .line 126
    const/4 v1, 0x0

    .line 127
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 131
    .line 132
    iget-object p1, p1, Ll/sup0;->D:Ll/x20;

    .line 133
    .line 134
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    if-eqz p1, :cond_2

    .line 139
    .line 140
    iget-object p0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 141
    .line 142
    iget-object p0, p0, Ll/sup0;->D:Ll/x20;

    .line 143
    .line 144
    invoke-interface {p0}, Ll/x20;->call()V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v0, "step"

    .line 17
    .line 18
    const-string v1, "onStart"

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 24
    .line 25
    iget-object v0, p0, Ll/sup0;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0, p1}, Ll/sup0;->L(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sup0;->f:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string p2, "step"

    .line 15
    .line 16
    const-string p3, "onError"

    .line 17
    .line 18
    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/sup0$a;->a:Ll/sup0;

    .line 22
    .line 23
    iget-object p2, p0, Ll/sup0;->l:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p2, p1}, Ll/sup0;->L(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
