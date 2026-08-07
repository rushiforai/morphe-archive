.class public abstract Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nxl;
.implements Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;,
        Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;
    }
.end annotation


# static fields
.field private static final l:Ljava/lang/String; = "MKWebViewHelper"


# instance fields
.field private a:Ljava/lang/String;

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field protected g:Ll/nxl;

.field private final h:Ljava/util/concurrent/atomic/AtomicBoolean;

.field protected i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field private j:Ljava/lang/String;

.field private k:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->c:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d:Z

    .line 10
    .line 11
    iput-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 12
    .line 13
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 19
    .line 20
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$1;-><init>(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->k:Landroid/content/BroadcastReceiver;

    .line 26
    .line 27
    sget-object v1, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/hellogroup/mk/fdt/FDTManager;->f()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const-string v2, "native"

    .line 40
    .line 41
    invoke-virtual {v1, p0, v2}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->d(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$a;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->j:Ljava/lang/String;

    .line 49
    .line 50
    return-void
.end method

.method private A()V
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->c:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "make sure bindActivity or bindFragment has been called"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static B(Lorg/json/JSONArray;)[Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    new-array v2, v1, [Ljava/lang/String;

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    :goto_0
    if-ge v3, v1, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    move-object v4, v0

    .line 26
    :goto_1
    aput-object v4, v2, v3

    .line 27
    .line 28
    add-int/lit8 v3, v3, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    return-object v2
.end method

.method private C(Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_4

    .line 8
    .line 9
    :cond_0
    const/4 v0, -0x1

    .line 10
    :try_start_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v1, "_ui"

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    goto/16 :goto_4

    .line 27
    .line 28
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 33
    .line 34
    .line 35
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move p1, v0

    .line 38
    :goto_0
    sget-object v1, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->l:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v2, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v3, "tang------ _ui\u53c2\u6570\u662f "

    .line 43
    .line 44
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-static {v1, v2}, Ll/jzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    const/4 v2, 0x1

    .line 59
    if-lez p1, :cond_8

    .line 60
    .line 61
    new-instance v3, Ll/ipj0;

    .line 62
    .line 63
    invoke-direct {v3, p1}, Ll/ipj0;-><init>(I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v3}, Ll/ipj0;->d()Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 73
    .line 74
    invoke-interface {p1}, Ll/ziw;->f()V

    .line 75
    .line 76
    .line 77
    :cond_2
    :try_start_1
    invoke-virtual {v3}, Ll/ipj0;->b()Z

    .line 78
    .line 79
    .line 80
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 81
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 82
    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    :try_start_2
    invoke-interface {v4}, Ll/flw;->l()Landroid/app/Activity;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    if-eqz p1, :cond_5

    .line 90
    .line 91
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 92
    .line 93
    invoke-interface {p1}, Ll/flw;->l()Landroid/app/Activity;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catchall_0
    move-exception p1

    .line 102
    goto :goto_1

    .line 103
    :cond_3
    invoke-interface {v4}, Ll/flw;->l()Landroid/app/Activity;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    if-eqz p1, :cond_5

    .line 108
    .line 109
    invoke-virtual {v3}, Ll/ipj0;->a()Z

    .line 110
    .line 111
    .line 112
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 113
    iget-object v4, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 114
    .line 115
    if-eqz p1, :cond_4

    .line 116
    .line 117
    :try_start_3
    invoke-interface {v4}, Ll/flw;->l()Landroid/app/Activity;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setRequestedOrientation(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_4
    invoke-interface {v4}, Ll/flw;->l()Landroid/app/Activity;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Landroid/app/Activity;->getRequestedOrientation()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eq p1, v2, :cond_5

    .line 134
    .line 135
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 136
    .line 137
    invoke-interface {p1}, Ll/flw;->l()Landroid/app/Activity;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 142
    .line 143
    .line 144
    goto :goto_2

    .line 145
    :goto_1
    sget-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->l:Ljava/lang/String;

    .line 146
    .line 147
    const-string v4, ""

    .line 148
    .line 149
    invoke-static {v0, v4, p1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 150
    .line 151
    .line 152
    :cond_5
    :goto_2
    invoke-virtual {v3}, Ll/ipj0;->e()Z

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 157
    .line 158
    if-eqz p1, :cond_6

    .line 159
    .line 160
    invoke-interface {v0, v2}, Ll/ziw;->t(Z)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_6
    invoke-interface {v0, v1}, Ll/ziw;->t(Z)V

    .line 165
    .line 166
    .line 167
    :goto_3
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 168
    .line 169
    if-nez p1, :cond_7

    .line 170
    .line 171
    invoke-virtual {v3}, Ll/ipj0;->c()Z

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    if-nez p1, :cond_7

    .line 176
    .line 177
    move v1, v2

    .line 178
    :cond_7
    invoke-interface {p0, v1}, Ll/flw;->e(Z)V

    .line 179
    .line 180
    .line 181
    goto :goto_4

    .line 182
    :cond_8
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 183
    .line 184
    invoke-interface {p1, v2}, Ll/flw;->e(Z)V

    .line 185
    .line 186
    .line 187
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 188
    .line 189
    invoke-interface {p0, v1}, Ll/ziw;->t(Z)V

    .line 190
    .line 191
    .line 192
    :goto_4
    return-void
.end method

.method private D()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/sjw;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->I()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setPageUID(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 22
    .line 23
    new-instance v1, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$b;-><init>(Ll/nxl;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->j:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1}, Ll/sjw;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebUserAgent(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x1

    .line 43
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->d:Z

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public static F(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;)V
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->e()Ljava/util/Map;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->e()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "pageID"

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->e()Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v1, "injectScriptCode"

    .line 30
    .line 31
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebViewId()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getWebViewId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "javascript:"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_0
    return-void
.end method

.method private I()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/flw;->l()Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->k:Landroid/content/BroadcastReceiver;

    .line 8
    .line 9
    const-string v1, "mk.close.close_all_page"

    .line 10
    .line 11
    const-string v2, "mk.close.close_other_page"

    .line 12
    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, p0, v1}, Ll/rf3;->b(Landroid/content/Context;Landroid/content/BroadcastReceiver;[Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic x()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic y(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public E(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/fqq;->d(IILandroid/content/Intent;)Z

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public G(I[Ljava/lang/String;[I)V
    .locals 1
    .param p2    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # [I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/fqq;->l(I[Ljava/lang/String;[I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final H(Ljava/lang/String;Ll/qpl;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/qpl;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->A()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Ll/fqq;->n(Ljava/lang/String;Ll/qpl;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public J(Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->A()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper$a;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final a(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/ziw;->f()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->C(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final c(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/flw;->l()Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->k:Landroid/content/BroadcastReceiver;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/rf3;->d(Landroid/content/Context;Landroid/content/BroadcastReceiver;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->getBridgeProcessor()Ll/fqq;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/fqq;->i()V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->b1()V

    .line 30
    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 34
    .line 35
    :cond_1
    sget-object v0, Lcom/hellogroup/mk/fdt/FDTManager;->INSTANCE:Lcom/hellogroup/mk/fdt/FDTManager;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/hellogroup/mk/fdt/FDTManager;->b()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->h:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_2

    .line 47
    .line 48
    invoke-static {}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->b()Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "native"

    .line 53
    .line 54
    invoke-virtual {v0, p0, v1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager;->f(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$a;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    return-void
.end method

.method public final h(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/flw;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;)V
    .locals 2

    .line 1
    const-string v0, "injectScript"

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;->f()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->F(Lcom/hellogroup/mk/business/base/ui/MKWebView;Lcom/hellogroup/mk/core/utils/globalevent/MKEventManager$Event;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public l()Landroid/app/Activity;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->e:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/app/Activity;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->f:Ljava/lang/ref/WeakReference;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->f:Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Landroidx/fragment/app/Fragment;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public m(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->b:Z

    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Ll/flw;->m(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public n(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/ziw;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    const-string v1, "type"

    .line 5
    .line 6
    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    :cond_0
    const/4 v1, 0x2

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    new-instance v0, Landroid/content/Intent;

    .line 14
    .line 15
    const-string v1, "mk.close.close_all_page"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-string v1, "url"

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->B(Lorg/json/JSONArray;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 34
    .line 35
    invoke-interface {p1}, Ll/flw;->l()Landroid/app/Activity;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-static {p1, v0}, Ll/rf3;->c(Landroid/content/Context;Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 43
    .line 44
    invoke-interface {p0}, Ll/ziw;->closePage()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    const/4 p1, 0x3

    .line 49
    if-ne v0, p1, :cond_2

    .line 50
    .line 51
    new-instance p1, Landroid/content/Intent;

    .line 52
    .line 53
    const-string v0, "mk.close.close_other_page"

    .line 54
    .line 55
    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const-string v0, "webview_id"

    .line 59
    .line 60
    iget-object v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->a:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 66
    .line 67
    invoke-interface {p0}, Ll/flw;->l()Landroid/app/Activity;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-static {p0, p1}, Ll/rf3;->c(Landroid/content/Context;Landroid/content/Intent;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 76
    .line 77
    invoke-interface {p0}, Ll/ziw;->closePage()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public s(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->D()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setWebUserAgent(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t(Z)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/flw;->l()Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    const/4 v3, 0x1

    .line 27
    const/16 v4, 0x1c

    .line 28
    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget v5, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 32
    .line 33
    or-int/lit16 v5, v5, 0x400

    .line 34
    .line 35
    iput v5, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 36
    .line 37
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 38
    .line 39
    if-lt v5, v4, :cond_2

    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/p4z0;->a(Landroid/view/WindowManager$LayoutParams;I)V

    .line 42
    .line 43
    .line 44
    or-int/lit16 v1, v1, 0x404

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget v5, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 48
    .line 49
    and-int/lit16 v5, v5, -0x401

    .line 50
    .line 51
    iput v5, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 52
    .line 53
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 54
    .line 55
    if-lt v5, v4, :cond_2

    .line 56
    .line 57
    const/4 v4, 0x0

    .line 58
    invoke-static {v2, v4}, Ll/p4z0;->a(Landroid/view/WindowManager$LayoutParams;I)V

    .line 59
    .line 60
    .line 61
    and-int/lit8 v1, v1, -0x5

    .line 62
    .line 63
    :cond_2
    :goto_0
    invoke-virtual {v0, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 74
    .line 75
    xor-int/2addr p1, v3

    .line 76
    invoke-interface {p0, p1}, Ll/flw;->e(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :catch_0
    move-exception p0

    .line 81
    sget-object p1, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->l:Ljava/lang/String;

    .line 82
    .line 83
    const-string v0, ""

    .line 84
    .line 85
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/flw;->l()Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->b:Z

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->c1(Z)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->b:Z

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->g:Ll/nxl;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/flw;->l()Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->onResume()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->e:Ljava/lang/ref/WeakReference;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->i:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->c:Z

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->D()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 22
    .line 23
    const-string p1, "bindFragment \u5df2\u7ecf\u8c03\u7528\uff0c\u4e0d\u80fd\u518d bindActivity"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0
.end method
