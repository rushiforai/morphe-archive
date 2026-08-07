.class public final Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;Ll/weh0;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;-><init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView$a;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-eq p1, v1, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-lez p1, :cond_4

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-int/2addr v2, v1

    .line 40
    rem-int/2addr v2, p1

    .line 41
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->f(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;I)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->d(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-lez v2, :cond_3

    .line 53
    .line 54
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->d(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->g(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;I)V

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->e(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->b(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    check-cast v2, Ljava/lang/CharSequence;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    if-le p1, v1, :cond_5

    .line 93
    .line 94
    const/4 p1, 0x0

    .line 95
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;->c(Lcom/p1/mobile/putong/core/ui/gift/opt/view/SvipVerticalTextView;)J

    .line 96
    .line 97
    .line 98
    move-result-wide v0

    .line 99
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 100
    .line 101
    .line 102
    :cond_5
    :goto_0
    return-void
.end method
