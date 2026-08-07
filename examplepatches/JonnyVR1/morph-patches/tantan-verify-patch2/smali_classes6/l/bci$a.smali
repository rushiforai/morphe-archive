.class public Ll/bci$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bci;->u()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/bci;


# direct methods
.method public constructor <init>(Ll/bci;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bci$a;->a:Ll/bci;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 2
    .line 3
    iget-object v0, v0, Ll/bci;->e:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 11
    .line 12
    invoke-static {v0}, Ll/bci;->e(Ll/bci;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 23
    .line 24
    iget-object v0, v0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 33
    .line 34
    iget-object v0, v0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    iget-object p1, p0, Ll/bci$a;->a:Ll/bci;

    .line 55
    .line 56
    iget-object p1, p1, Ll/bci;->f:Landroid/widget/FrameLayout;

    .line 57
    .line 58
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_1

    .line 63
    .line 64
    iget-object p1, p0, Ll/bci$a;->a:Ll/bci;

    .line 65
    .line 66
    invoke-static {p1}, Ll/bci;->d(Ll/bci;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/webview/FeedWebViewAct;

    .line 71
    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    iget-object p1, p0, Ll/bci$a;->a:Ll/bci;

    .line 75
    .line 76
    iget-object p1, p1, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 77
    .line 78
    sget v0, Ll/ycc0;->J0:I

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 85
    .line 86
    if-nez p1, :cond_0

    .line 87
    .line 88
    invoke-static {v0}, Ll/bci;->d(Ll/bci;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v0, p0, Ll/bci$a;->a:Ll/bci;

    .line 93
    .line 94
    iget-object v0, v0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Ll/bci$a;->a:Ll/bci;

    .line 104
    .line 105
    iget-object v0, p1, Ll/bci;->b:Lv/navigationbar/VNavigationBar;

    .line 106
    .line 107
    iget-object p1, p1, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_0
    iget-object p1, v0, Ll/bci;->d:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 118
    .line 119
    sget v0, Ll/ycc0;->J0:I

    .line 120
    .line 121
    const/4 v1, 0x0

    .line 122
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 123
    .line 124
    .line 125
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/bci$a;->a:Ll/bci;

    .line 126
    .line 127
    iget-object p1, p1, Ll/bci;->w:Ll/x20;

    .line 128
    .line 129
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eqz p1, :cond_2

    .line 134
    .line 135
    iget-object p0, p0, Ll/bci$a;->a:Ll/bci;

    .line 136
    .line 137
    iget-object p0, p0, Ll/bci;->w:Ll/x20;

    .line 138
    .line 139
    invoke-interface {p0}, Ll/x20;->call()V

    .line 140
    .line 141
    .line 142
    :cond_2
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bci$a;->a:Ll/bci;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bci;->f:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
