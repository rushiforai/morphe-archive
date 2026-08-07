.class public Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->initSubscription()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public g(Ljava/lang/Integer;)V
    .locals 3

    .line 1
    const/16 v0, 0x66

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->a2(Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_3

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 28
    .line 29
    const-string p1, "\u4e0a\u4f20\u5931\u8d25,\u70b9\u51fb\u91cd\u8bd5"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 40
    .line 41
    const/16 v2, 0x65

    .line 42
    .line 43
    if-ne v2, v0, :cond_1

    .line 44
    .line 45
    const/4 p1, 0x2

    .line 46
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->a2(Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 52
    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_3

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 62
    .line 63
    const-string p1, "\u4e0a\u4f20\u6210\u529f\uff0c\u70b9\u51fb\u9000\u51fa"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const/4 v0, 0x1

    .line 70
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->a2(Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;I)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->c:Lv/VProgressBar;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->c:Lv/VProgressBar;

    .line 86
    .line 87
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 92
    .line 93
    .line 94
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_3

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->e:Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct;->d:Lv/VText;

    .line 107
    .line 108
    const-string p1, "\u6b63\u5728\u4e0a\u4f20\u65e5\u5fd7"

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void
.end method

.method public onCompleted()V
    .locals 0

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/log/UploadLogAct$a;->g(Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
