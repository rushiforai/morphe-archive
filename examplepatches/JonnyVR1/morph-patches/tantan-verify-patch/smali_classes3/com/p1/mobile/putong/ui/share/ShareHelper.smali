.class public Lcom/p1/mobile/putong/ui/share/ShareHelper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g3f0;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/ui/share/ShareHelper$c;,
        Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;
    }
.end annotation


# static fields
.field public static j:Z


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/Map;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public c:Lcom/p1/mobile/putong/data/Link;

.field public d:Ll/z20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public g:Z

.field public h:Z

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/Link;)V
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-direct {p0, p1, v0, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .param p3    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Link;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->g:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->h:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->i:Z

    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 18
    .line 19
    iput-object p2, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->b:Ljava/util/Map;

    .line 22
    .line 23
    sget-boolean p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->j:Z

    .line 24
    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p1, Lcom/p1/mobile/putong/common/R$string;->w0:I

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ll/f3f0;->b(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x1

    .line 43
    sput-boolean p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->j:Z

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/data/Link;Ljava/util/Map;)V
    .locals 1
    .param p2    # Ljava/util/Map;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Link;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;-><init>(Lcom/p1/mobile/putong/data/Link;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/data/Link;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic C(Lrx/AsyncEmitter;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ljava/util/List;Ll/y20;Ll/q1e;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p0, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/q1e;->g()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->d0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->j0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic H(Lcom/p1/mobile/putong/ui/share/ShareHelper;ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->h0(ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method

.method public static synthetic I(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lrx/c;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->k0(Lrx/c;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/ui/share/ShareHelper;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->r0(Ll/wc80;Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->s0(Ll/wc80;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->I0(Ll/wc80;)V

    return-void
.end method

.method public static N(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance p3, Landroid/content/Intent;

    .line 2
    .line 3
    const-string p4, "android.intent.action.SEND"

    .line 4
    .line 5
    invoke-direct {p3, p4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string p4, "android.intent.extra.TEXT"

    .line 9
    .line 10
    new-instance p5, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v0, "\n"

    .line 19
    .line 20
    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p3, p4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    const-string p1, "text/plain"

    .line 34
    .line 35
    invoke-virtual {p3, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    invoke-static {p3, p2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :catch_0
    move-exception p0

    .line 47
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public static Q(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x1f0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x1f0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lrx/AsyncEmitter$BackpressureMode;->BUFFER:Lrx/AsyncEmitter$BackpressureMode;

    .line 7
    .line 8
    invoke-static {v0, p0}, Lrx/c;->fromAsync(Ll/y20;Lrx/AsyncEmitter$BackpressureMode;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static R(Lcom/p1/mobile/android/app/Act;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Ljava/util/ArrayList;

    .line 7
    .line 8
    const/4 v1, 0x5

    .line 9
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_5

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v3, -0x1

    .line 42
    sparse-switch v2, :sswitch_data_0

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :sswitch_0
    const-string v2, "wechat-session"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-nez v1, :cond_0

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    const/4 v3, 0x4

    .line 56
    goto :goto_1

    .line 57
    :sswitch_1
    const-string v2, "wechat-moments"

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const/4 v3, 0x3

    .line 67
    goto :goto_1

    .line 68
    :sswitch_2
    const-string v2, "qq_friend"

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    const/4 v3, 0x2

    .line 78
    goto :goto_1

    .line 79
    :sswitch_3
    const-string v2, "sina-weibo"

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    const/4 v3, 0x1

    .line 89
    goto :goto_1

    .line 90
    :sswitch_4
    const-string v2, "qq-space"

    .line 91
    .line 92
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-nez v1, :cond_4

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_4
    const/4 v3, 0x0

    .line 100
    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :pswitch_0
    const-string v1, "wx"

    .line 105
    .line 106
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    goto :goto_0

    .line 110
    :pswitch_1
    const-string v1, "mo"

    .line 111
    .line 112
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    goto :goto_0

    .line 116
    :pswitch_2
    const-string v1, "qq"

    .line 117
    .line 118
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :pswitch_3
    const-string v1, "wb"

    .line 123
    .line 124
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_0

    .line 128
    :pswitch_4
    const-string v1, "qz"

    .line 129
    .line 130
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_5
    return-object v0

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x78a804e7 -> :sswitch_4
        -0x716c6b5c -> :sswitch_3
        -0x5d702a63 -> :sswitch_2
        -0x268e5934 -> :sswitch_1
        0x6216aef -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static S(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_5

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const/4 v2, -0x1

    .line 41
    sparse-switch v1, :sswitch_data_0

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :sswitch_0
    const-string v1, "wechat-session"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_0

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_0
    const/4 v2, 0x4

    .line 55
    goto :goto_1

    .line 56
    :sswitch_1
    const-string v1, "wechat-moments"

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    const/4 v2, 0x3

    .line 66
    goto :goto_1

    .line 67
    :sswitch_2
    const-string v1, "qq_friend"

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_2
    const/4 v2, 0x2

    .line 77
    goto :goto_1

    .line 78
    :sswitch_3
    const-string v1, "sina-weibo"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    const/4 v2, 0x1

    .line 88
    goto :goto_1

    .line 89
    :sswitch_4
    const-string v1, "qq-space"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_4

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_4
    const/4 v2, 0x0

    .line 99
    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :pswitch_0
    const-string v0, "wx"

    .line 104
    .line 105
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :pswitch_1
    const-string v0, "mo"

    .line 110
    .line 111
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    goto :goto_0

    .line 115
    :pswitch_2
    const-string v0, "qq"

    .line 116
    .line 117
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :pswitch_3
    const-string v0, "wb"

    .line 122
    .line 123
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :pswitch_4
    const-string v0, "qz"

    .line 128
    .line 129
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_5
    return-object p1

    .line 134
    nop

    .line 135
    :sswitch_data_0
    .sparse-switch
        -0x78a804e7 -> :sswitch_4
        -0x716c6b5c -> :sswitch_3
        -0x5d702a63 -> :sswitch_2
        -0x268e5934 -> :sswitch_1
        0x6216aef -> :sswitch_0
    .end sparse-switch

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;
    .locals 10
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/ui/share/ShareHelper$c;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/common/R$string;->d2:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget-object v2, Ll/kvp0;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-string v3, "wechat-moments"

    .line 12
    .line 13
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "com.tencent.mm"

    .line 18
    .line 19
    filled-new-array {v4}, [Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-direct {v0, v1, v2, v3, v5}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/common/R$string;->c2:I

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    sget-object v3, Ll/vvp0;->b:Ljava/lang/String;

    .line 35
    .line 36
    const-string v5, "wechat-session"

    .line 37
    .line 38
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    filled-new-array {v4}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-direct {v1, v2, v3, v5, v4}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    new-instance v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 50
    .line 51
    sget v3, Lcom/p1/mobile/putong/common/R$string;->q2:I

    .line 52
    .line 53
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    sget-object v4, Ll/hvb0;->b:Ljava/lang/String;

    .line 58
    .line 59
    const-string v5, "qq_friend"

    .line 60
    .line 61
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    const-string v6, "com.tencent.tim"

    .line 66
    .line 67
    const-string v7, "com.tencent.mobileqq"

    .line 68
    .line 69
    const-string v8, "com.tencent.mobileqqi"

    .line 70
    .line 71
    filled-new-array {v6, v7, v8}, [Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    invoke-direct {v2, v3, v4, v5, v9}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v3, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 79
    .line 80
    sget v4, Lcom/p1/mobile/putong/common/R$string;->b2:I

    .line 81
    .line 82
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    sget-object v5, Ll/gvb0;->b:Ljava/lang/String;

    .line 87
    .line 88
    const-string v9, "qq-space"

    .line 89
    .line 90
    invoke-static {v9}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    filled-new-array {v6, v7, v8}, [Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v6

    .line 98
    invoke-direct {v3, v4, v5, v9, v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    new-instance v4, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 102
    .line 103
    sget v5, Lcom/p1/mobile/putong/common/R$string;->e2:I

    .line 104
    .line 105
    invoke-virtual {p0, v5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    sget-object v5, Ll/fqf0;->b:Ljava/lang/String;

    .line 110
    .line 111
    const-string v6, "sina-weibo"

    .line 112
    .line 113
    invoke-static {v6}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    const-string v7, "com.sina.weibog3"

    .line 118
    .line 119
    const-string v8, "com.sina.weibolite"

    .line 120
    .line 121
    const-string v9, "com.sina.weibo"

    .line 122
    .line 123
    filled-new-array {v9, v7, v8}, [Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    invoke-direct {v4, p0, v5, v6, v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkChannel;[Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    new-instance v0, Ll/d1f0;

    .line 139
    .line 140
    invoke-direct {v0, p1}, Ll/d1f0;-><init>(Ljava/util/List;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    return-object p0
.end method

.method public static U(I)Ljava/lang/String;
    .locals 5
    .param p0    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    const-string v0, "png"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :try_start_0
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-static {v2, p0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 18
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    .line 19
    .line 20
    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 21
    .line 22
    .line 23
    :try_start_2
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 24
    .line 25
    const/16 v4, 0x64

    .line 26
    .line 27
    invoke-virtual {p0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 41
    .line 42
    .line 43
    :cond_0
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    :goto_0
    move-object v1, p0

    .line 49
    goto :goto_2

    .line 50
    :catch_0
    move-exception v0

    .line 51
    goto :goto_1

    .line 52
    :catchall_1
    move-exception v0

    .line 53
    move-object v2, v1

    .line 54
    goto :goto_0

    .line 55
    :catch_1
    move-exception v0

    .line 56
    move-object v2, v1

    .line 57
    goto :goto_1

    .line 58
    :catchall_2
    move-exception v0

    .line 59
    move-object v2, v1

    .line 60
    goto :goto_2

    .line 61
    :catch_2
    move-exception v0

    .line 62
    move-object p0, v1

    .line 63
    move-object v2, p0

    .line 64
    :goto_1
    :try_start_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 65
    .line 66
    .line 67
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    .line 74
    .line 75
    .line 76
    :cond_1
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 77
    .line 78
    .line 79
    return-object v1

    .line 80
    :goto_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_2

    .line 85
    .line 86
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 87
    .line 88
    .line 89
    :cond_2
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 90
    .line 91
    .line 92
    throw v0
.end method

.method public static V()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "share_icon.png"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->W(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static W(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "png"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :try_start_0
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    .line 19
    .line 20
    .line 21
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 22
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    .line 23
    .line 24
    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 25
    .line 26
    .line 27
    :try_start_2
    invoke-static {p0, v2}, Ll/h26;->a(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    :goto_0
    move-object v1, p0

    .line 43
    goto :goto_2

    .line 44
    :catch_0
    move-exception v0

    .line 45
    goto :goto_1

    .line 46
    :catchall_1
    move-exception v0

    .line 47
    move-object v2, v1

    .line 48
    goto :goto_0

    .line 49
    :catch_1
    move-exception v0

    .line 50
    move-object v2, v1

    .line 51
    goto :goto_1

    .line 52
    :catchall_2
    move-exception v0

    .line 53
    move-object v2, v1

    .line 54
    goto :goto_2

    .line 55
    :catch_2
    move-exception v0

    .line 56
    move-object p0, v1

    .line 57
    move-object v2, p0

    .line 58
    :goto_1
    :try_start_3
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 59
    .line 60
    .line 61
    invoke-static {p0}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 65
    .line 66
    .line 67
    return-object v1

    .line 68
    :goto_2
    invoke-static {v1}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v2}, Ll/ua5;->b(Ljava/io/Closeable;)V

    .line 72
    .line 73
    .line 74
    throw v0
.end method

.method public static X(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "qq"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "qq_friend"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const-string v0, "qz"

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const-string v2, "qq-space"

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_1
    const-string v0, "mo"

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const-string v3, "wechat-moments"

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_2
    const-string v0, "wx"

    .line 71
    .line 72
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    const-string v4, "wechat-session"

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_3
    const-string v0, "wb"

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    const-string v0, "sina-weibo"

    .line 100
    .line 101
    if-eqz p0, :cond_4

    .line 102
    .line 103
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {p0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0

    .line 116
    :cond_4
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    filled-new-array {p0, v3, v2, v1, v0}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0
.end method

.method public static Y(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 10
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "sina-weibo"

    .line 6
    .line 7
    const-string v2, "qq-space"

    .line 8
    .line 9
    const-string v3, "qq_friend"

    .line 10
    .line 11
    const-string v4, "wechat-session"

    .line 12
    .line 13
    const-string v5, "wechat-moments"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {p0, v0, v3, v2, v1}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    const-string v0, ",\\s*"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    array-length v6, p0

    .line 55
    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    .line 57
    .line 58
    array-length v6, p0

    .line 59
    const/4 v7, 0x0

    .line 60
    :goto_0
    if-ge v7, v6, :cond_6

    .line 61
    .line 62
    aget-object v8, p0, v7

    .line 63
    .line 64
    const-string v9, "qq"

    .line 65
    .line 66
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v9

    .line 70
    if-eqz v9, :cond_1

    .line 71
    .line 72
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 73
    .line 74
    .line 75
    move-result-object v8

    .line 76
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const-string v9, "mo"

    .line 81
    .line 82
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    if-eqz v9, :cond_2

    .line 87
    .line 88
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 89
    .line 90
    .line 91
    move-result-object v8

    .line 92
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    const-string v9, "wx"

    .line 97
    .line 98
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    if-eqz v9, :cond_3

    .line 103
    .line 104
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_3
    const-string v9, "wb"

    .line 113
    .line 114
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v9

    .line 118
    if-eqz v9, :cond_4

    .line 119
    .line 120
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_4
    const-string v9, "qz"

    .line 129
    .line 130
    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v8

    .line 134
    if-eqz v8, :cond_5

    .line 135
    .line 136
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    :cond_5
    :goto_1
    add-int/lit8 v7, v7, 0x1

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_6
    return-object v0
.end method

.method public static Z(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 11
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "sina-weibo"

    .line 6
    .line 7
    const-string v2, "qq_friend"

    .line 8
    .line 9
    const-string v3, "qq-space"

    .line 10
    .line 11
    const-string v4, "wechat-session"

    .line 12
    .line 13
    const-string v5, "wechat-moments"

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    filled-new-array {p0, v0, v3, v2, v1}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_0
    const-string v0, ",\\s*"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v6, Ljava/util/ArrayList;

    .line 53
    .line 54
    array-length v7, v0

    .line 55
    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 56
    .line 57
    .line 58
    array-length v7, v0

    .line 59
    const/4 v8, 0x0

    .line 60
    :goto_0
    if-ge v8, v7, :cond_6

    .line 61
    .line 62
    aget-object v9, v0, v8

    .line 63
    .line 64
    const-string v10, "qq"

    .line 65
    .line 66
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v10

    .line 70
    if-eqz v10, :cond_1

    .line 71
    .line 72
    invoke-static {v2}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 73
    .line 74
    .line 75
    move-result-object v9

    .line 76
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const-string v10, "qz"

    .line 81
    .line 82
    invoke-virtual {v10, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v10

    .line 86
    if-eqz v10, :cond_2

    .line 87
    .line 88
    invoke-static {v3}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    filled-new-array {v6}, [Lcom/p1/mobile/putong/data/LinkChannel;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-static {v6}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    goto :goto_1

    .line 101
    :cond_2
    const-string v10, "mo"

    .line 102
    .line 103
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v10

    .line 107
    if-eqz v10, :cond_3

    .line 108
    .line 109
    invoke-static {v5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 110
    .line 111
    .line 112
    move-result-object v9

    .line 113
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_3
    const-string v10, "wx"

    .line 118
    .line 119
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v10

    .line 123
    if-eqz v10, :cond_4

    .line 124
    .line 125
    invoke-static {v4}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_4
    const-string v10, "wb"

    .line 134
    .line 135
    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v9

    .line 139
    if-eqz v9, :cond_5

    .line 140
    .line 141
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    :cond_5
    :goto_1
    add-int/lit8 v8, v8, 0x1

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_6
    return-object v6
.end method

.method public static a0(Lcom/p1/mobile/putong/data/LinkChannel;)Ljava/lang/String;
    .locals 0
    .param p0    # Lcom/p1/mobile/putong/data/LinkChannel;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, "unknown"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static b0(Ljava/util/ArrayList;Ljava/lang/Throwable;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of p1, p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x1

    .line 11
    if-ne p1, v0, :cond_6

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/p1/mobile/putong/data/LinkChannel;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, -0x1

    .line 32
    sparse-switch v1, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    :goto_0
    move v0, v2

    .line 36
    goto :goto_1

    .line 37
    :sswitch_0
    const-string p1, "wechat-session"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const/4 v0, 0x4

    .line 47
    goto :goto_1

    .line 48
    :sswitch_1
    const-string p1, "wechat-moments"

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-nez p0, :cond_2

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    const/4 v0, 0x3

    .line 58
    goto :goto_1

    .line 59
    :sswitch_2
    const-string p1, "qq_friend"

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_3

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    const/4 v0, 0x2

    .line 69
    goto :goto_1

    .line 70
    :sswitch_3
    const-string p1, "sina-weibo"

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-nez p0, :cond_5

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :sswitch_4
    const-string v0, "qq-space"

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-nez p0, :cond_4

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_4
    move v0, p1

    .line 89
    :cond_5
    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :pswitch_0
    const-string p0, "\u5fae\u4fe1"

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :pswitch_1
    const-string p0, "\u65b0\u6d6a\u5fae\u535a"

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :pswitch_2
    const-string p0, "QQ"

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_6
    :goto_2
    const-string p0, ""

    .line 103
    .line 104
    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_7

    .line 109
    .line 110
    const-string p0, "\u5206\u4eab\u5931\u8d25"

    .line 111
    .line 112
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_7
    const-string p1, "\u672a\u5b89\u88c5"

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    nop

    .line 127
    :sswitch_data_0
    .sparse-switch
        -0x78a804e7 -> :sswitch_4
        -0x716c6b5c -> :sswitch_3
        -0x5d702a63 -> :sswitch_2
        -0x268e5934 -> :sswitch_1
        0x6216aef -> :sswitch_0
    .end sparse-switch

    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic d(Ljava/util/List;Ll/y20;Ll/q1e;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p0, p5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 6
    .line 7
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p2}, Ll/q1e;->g()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public static synthetic e(Ll/q1e;Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    new-array v0, v0, [Ljava/lang/Object;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p0, v1, v0}, Ll/q1e;->k(I[Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ljava/util/List;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->d:[Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/uc60;->b([Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Lcom/google/common/base/Optional;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->i0(Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Lcom/google/common/base/Optional;)V

    return-void
.end method

.method public static synthetic j(Ljava/lang/String;Lrx/AsyncEmitter;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    sget-object v1, Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;

    .line 3
    .line 4
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    if-nez v2, :cond_2

    .line 9
    .line 10
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-nez v2, :cond_2

    .line 15
    .line 16
    const-string v2, "."

    .line 17
    .line 18
    invoke-virtual {p0, v2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const/16 v3, 0x3f

    .line 31
    .line 32
    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(I)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    const/4 v4, -0x1

    .line 37
    if-ne v3, v4, :cond_0

    .line 38
    .line 39
    new-instance v3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    goto :goto_0

    .line 59
    :catch_0
    move-exception p0

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 67
    .line 68
    .line 69
    move-result-wide v5

    .line 70
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const/4 v5, 0x0

    .line 74
    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-static {v1}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v4, "Tantan"

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    new-instance v4, Ljava/io/File;

    .line 113
    .line 114
    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 118
    .line 119
    .line 120
    move-result v5

    .line 121
    if-nez v5, :cond_1

    .line 122
    .line 123
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    if-nez v5, :cond_2

    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    if-eqz v4, :cond_2

    .line 134
    .line 135
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    goto :goto_2

    .line 151
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 152
    .line 153
    .line 154
    move-object p0, v0

    .line 155
    :cond_2
    :goto_2
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_3

    .line 160
    .line 161
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-nez v1, :cond_3

    .line 166
    .line 167
    new-instance v1, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 168
    .line 169
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 170
    .line 171
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->getDownloadHttp()Ll/rg50;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;-><init>(Ll/rg50;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->q(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    new-instance v0, Ll/a2f0;

    .line 187
    .line 188
    invoke-direct {v0, p1}, Ll/a2f0;-><init>(Lrx/AsyncEmitter;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->j(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    new-instance v0, Ll/b2f0;

    .line 196
    .line 197
    invoke-direct {v0, p1}, Ll/b2f0;-><init>(Lrx/AsyncEmitter;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->f(Ll/z20;)Lcom/p1/mobile/putong/ui/download/DownloadTask$b;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask$b;->a()Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/ui/download/a;->u()Lcom/p1/mobile/putong/ui/download/a;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/ui/download/a;->o(Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 213
    .line 214
    .line 215
    goto :goto_3

    .line 216
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 217
    .line 218
    const-string v0, "error download failed"

    .line 219
    .line 220
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    invoke-interface {p1, p0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    :goto_3
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/app/web/WebViewX;Lcom/p1/mobile/putong/data/Link;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->n0()V

    return-void
.end method

.method public static synthetic m(Landroid/content/pm/ActivityInfo;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic n(Ljava/lang/Throwable;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/ui/share/ShareHelper;ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c0(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r(Lrx/AsyncEmitter;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V
    .locals 0

    .line 1
    new-instance p2, Ll/c2f0;

    .line 2
    .line 3
    invoke-direct {p2, p1, p0}, Ll/c2f0;-><init>(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lrx/AsyncEmitter;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/ui/download/DownloadTask;Lrx/AsyncEmitter;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "file://"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 24
    .line 25
    new-instance v2, Landroid/content/Intent;

    .line 26
    .line 27
    const-string v3, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 28
    .line 29
    invoke-direct {v2, v3, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/download/DownloadTask;->v()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p1, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/wc80;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/wc80;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic v(Ll/q1e;Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/q1e;->g()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->p0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic x(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->l0()V

    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/f3f0;->a(Ljava/lang/String;Landroid/app/Activity;)Ll/wc80;

    .line 4
    .line 5
    .line 6
    move-result-object v6

    .line 7
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->V()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p6

    .line 17
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const-string v0, "QQ"

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    const-string p1, "http://"

    .line 26
    .line 27
    invoke-virtual {p3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_1

    .line 32
    .line 33
    const-string p1, "https://"

    .line 34
    .line 35
    invoke-virtual {p3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iget-object p1, p2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    const-string p1, "error"

    .line 50
    .line 51
    invoke-virtual {p0, v6, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->r0(Ll/wc80;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_1
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    invoke-virtual {p6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const-string v1, "http"

    .line 66
    .line 67
    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-object p1, p2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->b:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 82
    .line 83
    new-instance v1, Ll/g2f0;

    .line 84
    .line 85
    move-object v2, p0

    .line 86
    move-object v5, p3

    .line 87
    move-object v3, p4

    .line 88
    move-object v4, p5

    .line 89
    invoke-direct/range {v1 .. v6}, Ll/g2f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/wc80;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1, p6, v1}, Ll/am2;->i(Ljava/lang/String;Ll/y20;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    move-object v2, p0

    .line 97
    move-object v5, p3

    .line 98
    move-object v3, p4

    .line 99
    move-object v4, p5

    .line 100
    new-instance p0, Lcom/p1/mobile/share_sdk/content/WebPageContent;

    .line 101
    .line 102
    invoke-direct {p0, v3, v4, v5, p6}, Lcom/p1/mobile/share_sdk/content/WebPageContent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {v6, v2}, Ll/wc80;->b(Ll/g3f0;)V

    .line 106
    .line 107
    .line 108
    invoke-interface {v6, p0}, Ll/wc80;->a(Lcom/p1/mobile/share_sdk/content/Content;)V

    .line 109
    .line 110
    .line 111
    :goto_0
    invoke-virtual {v2, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->F0(Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public final B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p3, p2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3, p1}, Ll/f3f0;->a(Ljava/lang/String;Landroid/app/Activity;)Ll/wc80;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance p3, Ljava/io/File;

    .line 8
    .line 9
    invoke-direct {p3, p5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    new-instance p5, Lcom/p1/mobile/share_sdk/content/PicContent;

    .line 13
    .line 14
    invoke-direct {p5, p4, p3}, Lcom/p1/mobile/share_sdk/content/PicContent;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .line 15
    .line 16
    .line 17
    new-instance p3, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;

    .line 18
    .line 19
    invoke-direct {p3, p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, p3}, Ll/wc80;->b(Ll/g3f0;)V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1, p5}, Ll/wc80;->a(Lcom/p1/mobile/share_sdk/content/Content;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->F0(Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final C0(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lrx/c;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/LinkIntent;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    move-object/from16 v6, p6

    move-object/from16 v9, p9

    .line 1
    new-instance v0, Ll/o1f0;

    invoke-direct {v0, p0}, Ll/o1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V

    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "share_base dialogTitle = "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", shareTitle = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", thumbnailUrl = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v8, p8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", needPreview = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", description = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v5, p5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", allowedChannels = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", fallbackToSystem = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v7, p7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", previewActionName = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "[putong-common][share]"

    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_1

    .line 3
    invoke-static {p2, v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 v10, 0x2

    if-ge p1, v10, :cond_0

    .line 4
    new-instance v0, Ll/z1f0;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v8}, Ll/z1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p2

    move-object/from16 v6, p10

    move-object v2, v0

    move-object v5, v9

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->z0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/q1e;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lcom/p1/mobile/android/app/Dialog;

    goto :goto_0

    :cond_0
    move-object v5, v9

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->flow()Ll/q1e;

    move-result-object p1

    new-instance v9, Ll/d2f0;

    move-object/from16 v6, p10

    invoke-direct {v9, p0, p2, v5, v6}, Ll/d2f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)V

    new-instance v0, Ll/e2f0;

    move-object v1, p0

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v8}, Ll/e2f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V

    new-array p2, v10, [Ll/qcj;

    const/4 p3, 0x0

    aput-object v9, p2, p3

    const/4 p3, 0x1

    aput-object v0, p2, p3

    .line 6
    invoke-virtual {p1, p2}, Ll/q1e;->o([Ll/qcj;)Ll/q1e;

    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/q1e;->q()V

    goto :goto_0

    :cond_1
    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move/from16 v6, p7

    move-object/from16 v7, p8

    .line 8
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    .line 9
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    move-result-object p1

    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public final D0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 14

    .line 1
    move-object/from16 v0, p3

    .line 2
    .line 3
    const-string v1, "system"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->G0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Landroid/content/Intent;

    .line 9
    .line 10
    const-string v1, "android.intent.action.SEND"

    .line 11
    .line 12
    invoke-direct {p0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v2, "image/*"

    .line 16
    .line 17
    invoke-virtual {p0, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    const-string v2, "android.intent.extra.TEXT"

    .line 21
    .line 22
    invoke-virtual {p0, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-virtual {v3, p0, v4}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    new-instance v6, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v7, "com.tencent.mm.ui.tools.ShareToTimeLineUI"

    .line 40
    .line 41
    const-string v8, "com.tencent.mm.ui.tools.ShareToStatusUI"

    .line 42
    .line 43
    filled-new-array {v7, v8}, [Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    invoke-static {v7}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v8

    .line 59
    if-eqz v8, :cond_2

    .line 60
    .line 61
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v8

    .line 65
    check-cast v8, Landroid/content/pm/ResolveInfo;

    .line 66
    .line 67
    iget-object v9, v8, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 68
    .line 69
    iget-object v10, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 70
    .line 71
    const-string v11, "com.facebook.orca"

    .line 72
    .line 73
    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    if-nez v10, :cond_1

    .line 78
    .line 79
    new-instance v10, Ll/y1f0;

    .line 80
    .line 81
    invoke-direct {v10, v9}, Ll/y1f0;-><init>(Landroid/content/pm/ActivityInfo;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v7, v10}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    if-nez v10, :cond_1

    .line 89
    .line 90
    new-instance v10, Landroid/content/Intent;

    .line 91
    .line 92
    invoke-direct {v10, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    new-instance v11, Landroid/content/ComponentName;

    .line 96
    .line 97
    iget-object v12, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v13, v9, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 100
    .line 101
    invoke-direct {v11, v12, v13}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v10, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 105
    .line 106
    .line 107
    iget-object v11, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v10, v11}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 110
    .line 111
    .line 112
    const-string v11, "text/plain"

    .line 113
    .line 114
    invoke-virtual {v10, v11}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    iget-object v11, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 118
    .line 119
    const-string v12, "com.facebook.katana"

    .line 120
    .line 121
    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v11

    .line 125
    if-eqz v11, :cond_0

    .line 126
    .line 127
    move-object/from16 v11, p4

    .line 128
    .line 129
    invoke-virtual {v10, v2, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_0
    move-object/from16 v11, p4

    .line 134
    .line 135
    invoke-virtual {v10, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 136
    .line 137
    .line 138
    :goto_1
    new-instance v12, Landroid/content/pm/LabeledIntent;

    .line 139
    .line 140
    iget-object v13, v9, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v8, v3}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 143
    .line 144
    .line 145
    move-result-object v8

    .line 146
    iget v9, v9, Landroid/content/pm/ActivityInfo;->icon:I

    .line 147
    .line 148
    invoke-direct {v12, v10, v13, v8, v9}, Landroid/content/pm/LabeledIntent;-><init>(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/CharSequence;I)V

    .line 149
    .line 150
    .line 151
    invoke-interface {v6, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_1
    move-object/from16 v11, p4

    .line 156
    .line 157
    goto :goto_0

    .line 158
    :cond_2
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-lez v0, :cond_3

    .line 163
    .line 164
    invoke-interface {v6, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    check-cast p0, Landroid/content/Intent;

    .line 169
    .line 170
    :cond_3
    move-object/from16 v0, p2

    .line 171
    .line 172
    invoke-static {p0, v0}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    new-array v0, v0, [Landroid/content/pm/LabeledIntent;

    .line 181
    .line 182
    invoke-interface {v6, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    check-cast v0, [Landroid/content/pm/LabeledIntent;

    .line 187
    .line 188
    const-string v1, "android.intent.extra.INITIAL_INTENTS"

    .line 189
    .line 190
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public final E0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)V
    .locals 1
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "system"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->G0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    new-instance p0, Landroid/content/Intent;

    .line 13
    .line 14
    const-string v0, "android.intent.action.SEND"

    .line 15
    .line 16
    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string v0, "image/png"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    const-string v0, "android.intent.extra.STREAM"

    .line 25
    .line 26
    invoke-virtual {p0, v0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p4

    .line 33
    if-nez p4, :cond_0

    .line 34
    .line 35
    const-string p4, "android.intent.extra.TEXT"

    .line 36
    .line 37
    invoke-virtual {p0, p4, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    :cond_0
    const/high16 p3, 0x10000000

    .line 41
    .line 42
    invoke-virtual {p0, p3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 43
    .line 44
    .line 45
    invoke-static {p0, p2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public final F0(Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/ui/share/ShareHelper$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "unknown_"

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 11
    .line 12
    :goto_0
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a0(Lcom/p1/mobile/putong/data/LinkChannel;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->G0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final G0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->h:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->h:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final H0()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->g:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final I0(Ll/wc80;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->i:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    iput-boolean p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->i:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            "Ll/q1e;",
            ")",
            "Lcom/p1/mobile/android/app/Dialog;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h2f0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v3, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v4, p3

    .line 7
    move-object v6, p4

    .line 8
    move v2, p6

    .line 9
    move-object v7, p7

    .line 10
    invoke-direct/range {v0 .. v7}, Ll/h2f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p1, p5}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    const/4 p4, 0x0

    .line 22
    if-nez p3, :cond_0

    .line 23
    .line 24
    invoke-interface {v0, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-object p4

    .line 28
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    const/4 p5, 0x1

    .line 33
    if-ne p3, p5, :cond_1

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 41
    .line 42
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    return-object p4

    .line 46
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    new-instance p2, Ll/i2f0;

    .line 55
    .line 56
    invoke-direct {p2}, Ll/i2f0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {p0, p2}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    new-instance p2, Ll/j2f0;

    .line 68
    .line 69
    move-object/from16 p3, p8

    .line 70
    .line 71
    invoke-direct {p2, p0, v0, p3}, Ll/j2f0;-><init>(Ljava/util/List;Ll/y20;Ll/q1e;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public final P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            "Ll/q1e;",
            ")",
            "Lcom/p1/mobile/android/app/Dialog;"
        }
    .end annotation

    .line 1
    invoke-virtual {p6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "http"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->Q(Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/m1f0;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/m1f0;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/n1f0;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/n1f0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->onErrorResumeNext(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/p1f0;

    .line 44
    .line 45
    invoke-direct {v1, p1}, Ll/p1f0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->doOnSubscribe(Ll/x20;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/rl60;

    .line 56
    .line 57
    invoke-direct {v1, p1}, Ll/rl60;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->doOnTerminate(Ll/x20;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-static {p6}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_0
    new-instance v1, Ll/q1f0;

    .line 74
    .line 75
    move-object v2, p0

    .line 76
    move-object v5, p1

    .line 77
    move-object v6, p2

    .line 78
    move-object v7, p3

    .line 79
    move v3, p5

    .line 80
    move-object v4, p6

    .line 81
    invoke-direct/range {v1 .. v7}, Ll/q1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    new-instance p0, Ll/r1f0;

    .line 85
    .line 86
    invoke-direct {p0, v2, v0, v1}, Ll/r1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lrx/c;Ll/y20;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v5, p4}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->T(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    const/4 p3, 0x0

    .line 98
    if-nez p2, :cond_1

    .line 99
    .line 100
    invoke-interface {p0, p3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return-object p3

    .line 104
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    const/4 p4, 0x1

    .line 109
    if-ne p2, p4, :cond_2

    .line 110
    .line 111
    const/4 p2, 0x0

    .line 112
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 117
    .line 118
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-object p3

    .line 122
    :cond_2
    invoke-virtual {v5}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p2, v6}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    new-instance p3, Ll/s1f0;

    .line 131
    .line 132
    invoke-direct {p3}, Ll/s1f0;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-static {p1, p3}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 136
    .line 137
    .line 138
    move-result-object p3

    .line 139
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->e0(Ljava/util/List;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    new-instance p3, Ll/t1f0;

    .line 144
    .line 145
    invoke-direct {p3, p1, p0, p7}, Ll/t1f0;-><init>(Ljava/util/List;Ll/y20;Ll/q1e;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    return-object p0
.end method

.method public a(Ll/wc80;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "error"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->s0(Ll/wc80;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b(Ll/wc80;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->I0(Ll/wc80;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 23
    .line 24
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 30
    .line 31
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    sget-object v0, Ll/uqb0;->P:Ll/xk9;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 38
    .line 39
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Link;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/xk9;->B(Ljava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/u1f0;

    .line 46
    .line 47
    invoke-direct {v1}, Ll/u1f0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    const-string v0, "complete"

    .line 60
    .line 61
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->r0(Ll/wc80;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public c(Ll/wc80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 4
    .line 5
    .line 6
    const-string v0, "cancel"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->r0(Ll/wc80;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c0(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p7, :cond_2

    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 7
    .line 8
    const-string p5, "unknown"

    .line 9
    .line 10
    invoke-static {p5}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 11
    .line 12
    .line 13
    move-result-object p5

    .line 14
    iput-object p5, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    sget p1, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 23
    .line 24
    invoke-virtual {p2, p1, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 25
    .line 26
    .line 27
    sget-object p1, Ll/uqb0;->P:Ll/xk9;

    .line 28
    .line 29
    iget-object p5, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 30
    .line 31
    invoke-virtual {p1, p5}, Ll/xk9;->C(Lcom/p1/mobile/putong/data/Link;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p5, Ll/i1f0;

    .line 36
    .line 37
    invoke-direct {p5, p0, p2, p3, p4}, Ll/i1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    new-instance p3, Ll/j1f0;

    .line 41
    .line 42
    invoke-direct {p3, p0, p2}, Ll/j1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p5, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p3, " ( "

    .line 62
    .line 63
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object p3, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 67
    .line 68
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p3, " ) "

    .line 74
    .line 75
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p3, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 83
    .line 84
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p0, p2, p4, p1, p3}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->D0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 90
    .line 91
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 96
    .line 97
    invoke-direct {p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;-><init>()V

    .line 98
    .line 99
    .line 100
    const/4 p2, 0x0

    .line 101
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 106
    .line 107
    iget-object p4, p7, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 108
    .line 109
    iput-object p4, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 110
    .line 111
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 112
    .line 113
    if-nez v4, :cond_3

    .line 114
    .line 115
    sget p4, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 116
    .line 117
    invoke-virtual {p2, p4, v0}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 118
    .line 119
    .line 120
    sget-object p4, Ll/uqb0;->P:Ll/xk9;

    .line 121
    .line 122
    invoke-virtual {p4, p1}, Ll/xk9;->C(Lcom/p1/mobile/putong/data/Link;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    new-instance v0, Ll/k1f0;

    .line 127
    .line 128
    move-object v1, p0

    .line 129
    move-object v2, p2

    .line 130
    move-object v3, p3

    .line 131
    move-object v5, p5

    .line 132
    move-object v6, p6

    .line 133
    move-object v4, p7

    .line 134
    invoke-direct/range {v0 .. v6}, Ll/k1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    new-instance p0, Ll/l1f0;

    .line 138
    .line 139
    invoke-direct {p0, v1, v2}, Ll/l1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_3
    move-object v1, p0

    .line 151
    move-object v2, p2

    .line 152
    move-object v5, p3

    .line 153
    move-object v6, p5

    .line 154
    move-object v7, p6

    .line 155
    move-object v3, p7

    .line 156
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final synthetic d0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    iput-object p4, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 5
    .line 6
    iget-object v0, p4, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p2, p4, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 16
    .line 17
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p2, "\uff08 "

    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object p2, p4, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p2, " ) "

    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    iget-object p4, p4, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0, p1, p3, p2, p4}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->D0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 50
    .line 51
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic e0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic f0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Link;)V
    .locals 7

    .line 1
    iput-object p6, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p6, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :goto_0
    move-object v4, p2

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iget-object p2, p6, Lcom/p1/mobile/putong/data/Link;->title:Ljava/lang/String;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :goto_1
    iget-object v3, p6, Lcom/p1/mobile/putong/data/Link;->href:Ljava/lang/String;

    .line 20
    .line 21
    move-object v0, p0

    .line 22
    move-object v1, p1

    .line 23
    move-object v2, p3

    .line 24
    move-object v5, p4

    .line 25
    move-object v6, p5

    .line 26
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->A0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic h0(ZLjava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/pf60;)V
    .locals 6

    .line 1
    iget-object v0, p6, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 p5, 0x0

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 9
    .line 10
    const-string v0, "unknown"

    .line 11
    .line 12
    invoke-static {v0}, Lcom/p1/mobile/putong/data/LinkChannel;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LinkChannel;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 17
    .line 18
    iget-object p1, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object p2, p1

    .line 24
    check-cast p2, Ljava/lang/String;

    .line 25
    .line 26
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string p6, "files."

    .line 29
    .line 30
    invoke-direct {p1, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    sget-object p6, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 34
    .line 35
    invoke-virtual {p6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p6

    .line 39
    invoke-virtual {p1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    new-instance p6, Ljava/io/File;

    .line 47
    .line 48
    invoke-direct {p6, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p3, p1, p6}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p3, p4, p5, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->E0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 59
    .line 60
    invoke-virtual {p0}, Lrx/subjects/a;->onCompleted()V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;

    .line 65
    .line 66
    invoke-direct {p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper$PlatformNotFoundException;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, p5, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 74
    .line 75
    check-cast v0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 76
    .line 77
    iget-object p4, v0, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;->c:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 78
    .line 79
    iput-object p4, p1, Lcom/p1/mobile/putong/data/Link;->channel:Lcom/p1/mobile/putong/data/LinkChannel;

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->H0()V

    .line 82
    .line 83
    .line 84
    iget-object p1, p6, Ll/pf60;->a:Ljava/lang/Object;

    .line 85
    .line 86
    move-object v2, p1

    .line 87
    check-cast v2, Lcom/p1/mobile/putong/ui/share/ShareHelper$c;

    .line 88
    .line 89
    iget-object p1, p6, Ll/pf60;->b:Ljava/lang/Object;

    .line 90
    .line 91
    move-object v5, p1

    .line 92
    check-cast v5, Ljava/lang/String;

    .line 93
    .line 94
    move-object v0, p0

    .line 95
    move-object v4, p2

    .line 96
    move-object v1, p3

    .line 97
    move-object v3, p5

    .line 98
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic i0(Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Lcom/google/common/base/Optional;)V
    .locals 1

    .line 1
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ll/pf60;

    .line 8
    .line 9
    invoke-virtual {p3}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    check-cast p3, Ljava/lang/String;

    .line 14
    .line 15
    invoke-direct {p0, p2, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    .line 23
    .line 24
    const-string p2, "can\'t save image file or picUrlOrLocalPath is null"

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const/4 p2, 0x0

    .line 30
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic j0(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->a(Ll/wc80;Ljava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic k0(Lrx/c;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V
    .locals 1

    .line 1
    new-instance v0, Ll/v1f0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3}, Ll/v1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/y20;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Ll/w1f0;

    .line 7
    .line 8
    invoke-direct {p2, p0}, Ll/w1f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic l0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/wc80;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/share_sdk/content/WebPageContent;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p3, p5}, Lcom/p1/mobile/share_sdk/content/WebPageContent;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p4, p0}, Ll/wc80;->b(Ll/g3f0;)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p4, v0}, Ll/wc80;->a(Lcom/p1/mobile/share_sdk/content/Content;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic n0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 9

    .line 1
    const/4 v8, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move v6, p6

    .line 9
    move-object/from16 v7, p7

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 7

    .line 1
    const/4 v2, 0x0

    .line 2
    const/4 v3, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v5, p2

    .line 6
    move-object v6, p3

    .line 7
    move-object v4, p4

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->z0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/q1e;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lcom/p1/mobile/android/app/Dialog;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic q0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final r0(Ll/wc80;Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "cancel"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "error"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->e:Ll/a30;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ll/wc80;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    goto :goto_2

    .line 35
    :cond_2
    move-object p0, v2

    .line 36
    :goto_2
    invoke-interface {v1, p0, p2, v2}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->d:Ll/z20;

    .line 41
    .line 42
    if-eqz p0, :cond_5

    .line 43
    .line 44
    if-eqz p1, :cond_4

    .line 45
    .line 46
    invoke-interface {p1}, Ll/wc80;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    :cond_4
    invoke-interface {p0, v2, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_5
    return-void
.end method

.method public final s0(Ll/wc80;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    const-string v0, "cancel"

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "error"

    .line 10
    .line 11
    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 21
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->e:Ll/a30;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    if-eqz v1, :cond_3

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    if-eqz p1, :cond_2

    .line 29
    .line 30
    invoke-interface {p1}, Ll/wc80;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    :cond_2
    invoke-interface {v1, v2, p2, p3}, Ll/a30;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->d:Ll/z20;

    .line 39
    .line 40
    if-eqz p0, :cond_5

    .line 41
    .line 42
    if-eqz p1, :cond_4

    .line 43
    .line 44
    invoke-interface {p1}, Ll/wc80;->getName()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    :cond_4
    invoke-interface {p0, v2, p2}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_5
    return-void
.end method

.method public t0(Ll/z20;)Lcom/p1/mobile/putong/ui/share/ShareHelper;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/share/ShareHelper;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->d:Ll/z20;

    .line 2
    .line 3
    return-object p0
.end method

.method public u0(Ll/a30;)Lcom/p1/mobile/putong/ui/share/ShareHelper;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            ">;)",
            "Lcom/p1/mobile/putong/ui/share/ShareHelper;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->e:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v9, ""

    .line 2
    .line 3
    const/4 v10, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move-object v2, p1

    .line 7
    move-object v3, p2

    .line 8
    move-object v4, p3

    .line 9
    move-object v5, p4

    .line 10
    move-object/from16 v6, p5

    .line 11
    .line 12
    move/from16 v7, p6

    .line 13
    .line 14
    move-object/from16 v8, p7

    .line 15
    .line 16
    invoke-virtual/range {v0 .. v10}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->C0(ZLcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public w0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Z)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    const/4 v7, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move-object v3, p3

    .line 7
    move-object v5, p4

    .line 8
    move v6, p5

    .line 9
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v4, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v5, p4

    .line 7
    move v6, p5

    .line 8
    move-object v7, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->v0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public y0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)Lrx/c;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/LinkChannel;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "shareImage dialogTitle = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", shareTitle = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", picUrlOrLocalPath = "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ", allowedChannels = "

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", fallbackToSystem = "

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-string v1, "[putong-common][share]"

    .line 48
    .line 49
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/f2f0;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/f2f0;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 58
    .line 59
    .line 60
    const/4 v8, 0x0

    .line 61
    move-object v1, p0

    .line 62
    move-object v2, p1

    .line 63
    move-object v3, p2

    .line 64
    move-object v4, p3

    .line 65
    move-object v5, p4

    .line 66
    move v6, p5

    .line 67
    move-object v7, p6

    .line 68
    invoke-virtual/range {v1 .. v8}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;Ll/q1e;)Lcom/p1/mobile/android/app/Dialog;

    .line 69
    .line 70
    .line 71
    iget-object p0, v1, Lcom/p1/mobile/putong/ui/share/ShareHelper;->f:Lrx/subjects/a;

    .line 72
    .line 73
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public z0(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;Ljava/lang/Runnable;Ll/q1e;Ljava/lang/String;Lcom/p1/mobile/putong/data/LinkIntent;)Lcom/p1/mobile/android/app/Dialog;
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/jec0;->Q:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->N(IZ)Lcom/p1/mobile/android/app/Dialog$e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/e1f0;

    .line 17
    .line 18
    invoke-direct {v1, p4, p2}, Ll/e1f0;-><init>(Ll/q1e;Ljava/lang/Runnable;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p5, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance p5, Ll/f1f0;

    .line 26
    .line 27
    invoke-direct {p5, p4, p3}, Ll/f1f0;-><init>(Ll/q1e;Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2, p5}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    sget p3, Lcom/p1/mobile/putong/common/R$string;->Y1:I

    .line 35
    .line 36
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const/16 p3, 0x11

    .line 41
    .line 42
    invoke-virtual {p2, p3}, Lcom/p1/mobile/android/app/Dialog$e;->J0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->t()Lcom/p1/mobile/android/app/Dialog$e;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    sget p4, Ll/ycc0;->H0:I

    .line 59
    .line 60
    invoke-virtual {p3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p4

    .line 64
    check-cast p4, Lcom/p1/mobile/putong/app/web/WebViewX;

    .line 65
    .line 66
    sget p5, Ll/ycc0;->c0:I

    .line 67
    .line 68
    invoke-virtual {p3, p5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    check-cast p3, Landroid/widget/ProgressBar;

    .line 73
    .line 74
    new-instance p5, Lcom/p1/mobile/putong/ui/share/ShareHelper$a;

    .line 75
    .line 76
    invoke-direct {p5, p0, p1, p3}, Lcom/p1/mobile/putong/ui/share/ShareHelper$a;-><init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Landroid/content/Context;Landroid/widget/ProgressBar;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p4, p5}, Lcom/p1/mobile/putong/app/web/WebViewX;->setWebViewClientX(Lcom/p1/mobile/putong/app/web/WebViewClientX;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper;->c:Lcom/p1/mobile/putong/data/Link;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Link;->clone()Lcom/p1/mobile/putong/data/Link;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iput-object p6, p0, Lcom/p1/mobile/putong/data/Link;->intent:Lcom/p1/mobile/putong/data/LinkIntent;

    .line 89
    .line 90
    sget-object p1, Ll/uqb0;->P:Ll/xk9;

    .line 91
    .line 92
    invoke-virtual {p1, p0}, Ll/xk9;->C(Lcom/p1/mobile/putong/data/Link;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    new-instance p1, Ll/g1f0;

    .line 97
    .line 98
    invoke-direct {p1, p4}, Ll/g1f0;-><init>(Lcom/p1/mobile/putong/app/web/WebViewX;)V

    .line 99
    .line 100
    .line 101
    new-instance p3, Ll/h1f0;

    .line 102
    .line 103
    invoke-direct {p3}, Ll/h1f0;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {p1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 111
    .line 112
    .line 113
    return-object p2
.end method
