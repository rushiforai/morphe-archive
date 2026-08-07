.class public final Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J+\u0010\u000f\u001a\u00020\u000e2\u0008\u0010\t\u001a\u0004\u0018\u00010\u00082\u0006\u0010\u000b\u001a\u00020\n2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000cH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\u000e2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u0017\u0010\u0015\u001a\u00020\u000e2\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u000f\u0010\u0016\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u0018R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0005\u0010\u0019R\u0018\u0010\u001b\u001a\u0004\u0018\u00010\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001c\u00a8\u0006\u001d"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "media",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "resourceProvider",
        "<init>",
        "(Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V",
        "Landroid/widget/RelativeLayout;",
        "relativeLayout",
        "Ll/brm;",
        "config",
        "Landroid/view/View$OnClickListener;",
        "clickListener",
        "",
        "setup",
        "(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V",
        "Ll/ker;",
        "owner",
        "onStart",
        "(Ll/ker;)V",
        "onStop",
        "cleanup",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;",
        "Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;",
        "Lcom/clevertap/android/sdk/gif/GifImageView;",
        "gifImageView",
        "Lcom/clevertap/android/sdk/gif/GifImageView;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final resourceProvider:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;)V
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->resourceProvider:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public cleanup()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->k()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 10
    .line 11
    return-void
.end method

.method public onStart(Ll/ker;)V
    .locals 1
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->resourceProvider:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->h(Ljava/lang/String;)[B

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->setBytes([B)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/gif/GifImageView;->m()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onStop(Ll/ker;)V
    .locals 0
    .param p1    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->k()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public setup(Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;)V
    .locals 3
    .param p1    # Landroid/widget/RelativeLayout;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/brm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View$OnClickListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/brm;->b()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_1

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->resourceProvider:Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->c()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;->h(Ljava/lang/String;)[B

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    if-eqz p1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p2}, Ll/brm;->b()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const/4 v1, 0x0

    .line 41
    :goto_0
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->media:Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;

    .line 46
    .line 47
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationMedia;->a()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v1, v2}, Ll/crm;->a(Landroid/view/View;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 60
    .line 61
    .line 62
    :cond_4
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 63
    .line 64
    if-eqz v1, :cond_5

    .line 65
    .line 66
    invoke-virtual {v1, v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->setBytes([B)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 70
    .line 71
    if-eqz v0, :cond_6

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/GifImageView;->m()V

    .line 74
    .line 75
    .line 76
    :cond_6
    invoke-virtual {p2}, Ll/brm;->a()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_8

    .line 81
    .line 82
    if-eqz p3, :cond_8

    .line 83
    .line 84
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 93
    .line 94
    .line 95
    :cond_7
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/media/InAppGifHandler;->gifImageView:Lcom/clevertap/android/sdk/gif/GifImageView;

    .line 96
    .line 97
    if-eqz p0, :cond_8

    .line 98
    .line 99
    invoke-virtual {p0, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    :cond_8
    if-eqz p1, :cond_9

    .line 103
    .line 104
    invoke-virtual {p2}, Ll/brm;->c()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, Landroid/widget/ImageView;

    .line 113
    .line 114
    if-eqz p0, :cond_9

    .line 115
    .line 116
    const/16 p1, 0x8

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 119
    .line 120
    .line 121
    :cond_9
    :goto_1
    return-void
.end method
