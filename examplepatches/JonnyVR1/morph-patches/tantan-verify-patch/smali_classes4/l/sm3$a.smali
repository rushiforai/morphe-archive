.class public Ll/sm3$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sm3;->s()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/sm3;


# direct methods
.method public constructor <init>(Ll/sm3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sm3$a;->a:Ll/sm3;

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
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sm3;->g:Landroid/widget/ProgressBar;

    .line 4
    .line 5
    const/16 v1, 0x8

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/sm3;->z()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 19
    .line 20
    iget-object v0, v0, Ll/sm3;->d:Landroid/widget/TextView;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 27
    .line 28
    iget-object v0, v0, Ll/sm3;->m:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 37
    .line 38
    iget-object v0, v0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 47
    .line 48
    iget-object v0, v0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    sget-object v0, Ll/rx3;->EMPTY_PAGE:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 69
    .line 70
    iget-object v0, v0, Ll/sm3;->h:Landroid/widget/FrameLayout;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 79
    .line 80
    iget-object v0, v0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 81
    .line 82
    sget v1, Ll/ddc0;->X:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iget-object v1, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 89
    .line 90
    if-nez v0, :cond_1

    .line 91
    .line 92
    iget-object v0, v1, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v1, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 99
    .line 100
    invoke-static {v1}, Ll/sm3;->d(Ll/sm3;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 108
    .line 109
    iget-object v1, v1, Ll/sm3;->b:Lv/navigationbar/VNavigationBar;

    .line 110
    .line 111
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_1
    iget-object v0, v1, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 116
    .line 117
    sget v1, Ll/ddc0;->X:I

    .line 118
    .line 119
    const/4 v2, 0x0

    .line 120
    invoke-virtual {v0, v1, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 124
    .line 125
    iget-object v0, v0, Ll/sm3;->B:Ll/x20;

    .line 126
    .line 127
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    iget-object v0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 134
    .line 135
    iget-object v0, v0, Ll/sm3;->B:Ll/x20;

    .line 136
    .line 137
    invoke-interface {v0}, Ll/x20;->call()V

    .line 138
    .line 139
    .line 140
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 141
    .line 142
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->l1:Lcom/p1/mobile/putong/core/api/o;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/o;->R:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result p1

    .line 150
    if-eqz p1, :cond_4

    .line 151
    .line 152
    iget-object p0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 153
    .line 154
    iget-object p0, p0, Ll/sm3;->f:Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    .line 157
    .line 158
    .line 159
    :cond_4
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
    iget-object p0, p0, Ll/sm3$a;->a:Ll/sm3;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sm3;->h:Landroid/widget/FrameLayout;

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
