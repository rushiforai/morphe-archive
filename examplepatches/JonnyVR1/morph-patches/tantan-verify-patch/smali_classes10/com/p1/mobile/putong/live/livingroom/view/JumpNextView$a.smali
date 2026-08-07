.class public Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 2
    .line 3
    iget v1, p1, Landroid/os/Message;->what:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->i(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->f(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->h(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 26
    .line 27
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->e(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)Ll/y20;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->e(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)Ll/y20;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->f(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-lez v0, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->d:Lv/VText;

    .line 54
    .line 55
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->A0:I

    .line 56
    .line 57
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iget p1, p1, Landroid/os/Message;->what:I

    .line 62
    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->g(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)Landroid/os/Handler;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView$a;->a:Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;->f(Lcom/p1/mobile/putong/live/livingroom/view/JumpNextView;)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/lit8 p0, p0, -0x1

    .line 91
    .line 92
    const-wide/16 v0, 0x3e8

    .line 93
    .line 94
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 95
    .line 96
    .line 97
    :cond_1
    return-void
.end method
