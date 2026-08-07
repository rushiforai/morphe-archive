.class public Ll/i8k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/j8k0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/j8k0;

.field public final b:Lv/VText;

.field public c:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public d:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lv/VText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/i8k0;->b:Lv/VText;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/i8k0;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i8k0;->f(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic b(Ll/i8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i8k0;->i(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/i8k0;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/j8k0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i8k0;->a:Ll/j8k0;

    .line 2
    .line 3
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i8k0;->C0()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    sget v2, Ll/obc0;->R:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/i8k0;->d:Landroid/graphics/Bitmap;

    .line 23
    .line 24
    iget-object p0, p0, Ll/i8k0;->c:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 25
    .line 26
    invoke-static {v0, p0}, Ll/ps40;->e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/i8k0;->C0()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/ps40;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    new-instance v1, Ll/g8k0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/g8k0;-><init>(Ll/i8k0;)V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {p1, v0, v1, v2}, Ll/ps40;->f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/i8k0;->c:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0, v0}, Ll/i8k0;->j(Ljava/io/File;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic f(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/i8k0;->d:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i8k0;->a:Ll/j8k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/j8k0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/j8k0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/i8k0;->c(Ll/j8k0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ljava/io/File;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/h8k0;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1}, Ll/h8k0;-><init>(Ll/i8k0;Ljava/io/File;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 5
    .line 6
    new-instance v1, Ll/f8k0;

    .line 7
    .line 8
    invoke-direct {v1, p0, p1}, Ll/f8k0;-><init>(Ll/i8k0;Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 15
    .line 16
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;->text:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;->color:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    :try_start_0
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->contentConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonContent;->color:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_2

    .line 60
    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->pictureConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/i8k0;->e(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget-object v0, p0, Ll/i8k0;->a:Ll/j8k0;

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ll/j8k0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 76
    .line 77
    const/high16 v1, 0x41300000    # 11.0f

    .line 78
    .line 79
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-static {p1, v0, v1}, Ll/l35;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object v0, p0, Ll/i8k0;->b:Lv/VText;

    .line 88
    .line 89
    const/4 v1, 0x1

    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/i8k0;->b:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    :goto_1
    return-void
.end method
