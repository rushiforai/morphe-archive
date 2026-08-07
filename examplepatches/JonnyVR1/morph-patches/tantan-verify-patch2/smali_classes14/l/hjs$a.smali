.class public final Ll/hjs$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w8e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hjs;-><init>(Ll/jjs;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;ILl/ahu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\t\u001a\u00020\u00042\u0006\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u000c\u001a\u00020\u000bH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u000e\u00a8\u0006\u0010"
    }
    d2 = {
        "l/hjs$a",
        "Ll/w8e;",
        "",
        "progress",
        "",
        "b",
        "(I)V",
        "Ljava/io/File;",
        "file",
        "a",
        "(Ljava/io/File;)V",
        "",
        "errMsg",
        "onFailed",
        "(Ljava/lang/String;)V",
        "d",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/hjs;


# direct methods
.method public constructor <init>(Ll/hjs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static e(Ll/hjs;Ll/hjs$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ll/hjs$a;->onFailed(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ljava/io/File;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    invoke-virtual {p1, v0}, Ll/hjs;->t(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->o:Landroidx/constraintlayout/widget/Group;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->p:Lv/VText;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->q:Lv/VText;

    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const/high16 v0, 0x3f800000    # 1.0f

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 57
    .line 58
    invoke-static {p1}, Ll/hjs;->a(Ll/hjs;)Ll/y20;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    iget-object p0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/hjs;->j()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-virtual {v0, v1}, Ll/hjs;->t(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->h:Lv/VText;

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->i5:I

    .line 16
    .line 17
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 25
    .line 26
    invoke-static {v0, p1}, Ll/hjs;->e(Ll/hjs;I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 30
    .line 31
    invoke-static {p1}, Ll/hjs;->a(Ll/hjs;)Ll/y20;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/hjs;->j()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method

.method public bridge c(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/w8e;->c(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 5
    .line 6
    iget-object v1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 7
    .line 8
    new-instance v2, Ll/fjs;

    .line 9
    .line 10
    invoke-direct {v2, v1, p0, p1}, Ll/fjs;-><init>(Ll/hjs;Ll/hjs$a;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 p0, 0x1f4

    .line 14
    .line 15
    invoke-static {v0, v2, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public bridge onCancel()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onCancel()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFailed(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-virtual {p1, v0}, Ll/hjs;->t(I)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->h:Lv/VText;

    .line 17
    .line 18
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->k5:I

    .line 19
    .line 20
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->p:Lv/VText;

    .line 34
    .line 35
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->j5:I

    .line 36
    .line 37
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    const/high16 v0, 0x3f000000    # 0.5f

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->o:Landroidx/constraintlayout/widget/Group;

    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 68
    .line 69
    invoke-virtual {p1}, Ll/hjs;->l()Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/view/LiveVChatGiftItemView;->p:Lv/VText;

    .line 74
    .line 75
    const/4 v0, 0x1

    .line 76
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 80
    .line 81
    invoke-static {p1}, Ll/hjs;->a(Ll/hjs;)Ll/y20;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    if-eqz p1, :cond_0

    .line 86
    .line 87
    iget-object p0, p0, Ll/hjs$a;->a:Ll/hjs;

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/hjs;->j()I

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    return-void
.end method

.method public bridge onStart()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/w8e;->onStart()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
