.class public final Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;
    }
.end annotation


# instance fields
.field private final a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

.field private final b:Lcom/uuzuche/lib_zxing/decoding/b;

.field private c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Vector;Ljava/lang/String;Lcom/uuzuche/lib_zxing/view/ViewfinderView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/uuzuche/lib_zxing/activity/CaptureFragment;",
            "Ljava/util/Vector<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/uuzuche/lib_zxing/view/ViewfinderView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 5
    .line 6
    new-instance v0, Lcom/uuzuche/lib_zxing/decoding/b;

    .line 7
    .line 8
    new-instance v1, Ll/wnl0;

    .line 9
    .line 10
    invoke-direct {v1, p4}, Ll/wnl0;-><init>(Lcom/uuzuche/lib_zxing/view/ViewfinderView;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, p1, p2, p3, v1}, Lcom/uuzuche/lib_zxing/decoding/b;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureFragment;Ljava/util/Vector;Ljava/lang/String;Ll/t5d0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b:Lcom/uuzuche/lib_zxing/decoding/b;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 19
    .line 20
    .line 21
    sget-object p1, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 22
    .line 23
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 24
    .line 25
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/x94;->p()V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 2
    .line 3
    sget-object v1, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 10
    .line 11
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b:Lcom/uuzuche/lib_zxing/decoding/b;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/uuzuche/lib_zxing/decoding/b;->a()Landroid/os/Handler;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/pdc0;->b:I

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Ll/x94;->n(Landroid/os/Handler;I)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v1, Ll/pdc0;->a:I

    .line 31
    .line 32
    invoke-virtual {v0, p0, v1}, Ll/x94;->m(Landroid/os/Handler;I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->V3()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    sget-object v0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->DONE:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 4
    .line 5
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ll/x94;->q()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b:Lcom/uuzuche/lib_zxing/decoding/b;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/uuzuche/lib_zxing/decoding/b;->a()Landroid/os/Handler;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/pdc0;->h:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 25
    .line 26
    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b:Lcom/uuzuche/lib_zxing/decoding/b;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    sget v0, Ll/pdc0;->d:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 35
    .line 36
    .line 37
    sget v0, Ll/pdc0;->c:I

    .line 38
    .line 39
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    sget v1, Ll/pdc0;->a:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 8
    .line 9
    sget-object v0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 10
    .line 11
    if-ne p1, v0, :cond_6

    .line 12
    .line 13
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget v0, Ll/pdc0;->a:I

    .line 18
    .line 19
    invoke-virtual {p1, p0, v0}, Ll/x94;->m(Landroid/os/Handler;I)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    sget v1, Ll/pdc0;->i:I

    .line 24
    .line 25
    if-ne v0, v1, :cond_1

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget v1, Ll/pdc0;->d:I

    .line 32
    .line 33
    if-ne v0, v1, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->SUCCESS:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    if-nez v0, :cond_2

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-string v1, "barcode_bitmap"

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/graphics/Bitmap;

    .line 54
    .line 55
    :goto_0
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 56
    .line 57
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p1, Ll/r5d0;

    .line 60
    .line 61
    invoke-virtual {p0, p1, v0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->X3(Ll/r5d0;Landroid/graphics/Bitmap;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    sget v1, Ll/pdc0;->c:I

    .line 66
    .line 67
    if-ne v0, v1, :cond_4

    .line 68
    .line 69
    sget-object p1, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;->PREVIEW:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->c:Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler$State;

    .line 72
    .line 73
    invoke-static {}, Ll/x94;->c()Ll/x94;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->b:Lcom/uuzuche/lib_zxing/decoding/b;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/uuzuche/lib_zxing/decoding/b;->a()Landroid/os/Handler;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget v0, Ll/pdc0;->b:I

    .line 84
    .line 85
    invoke-virtual {p1, p0, v0}, Ll/x94;->n(Landroid/os/Handler;I)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_4
    sget v1, Ll/pdc0;->j:I

    .line 90
    .line 91
    if-ne v0, v1, :cond_5

    .line 92
    .line 93
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 94
    .line 95
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast p1, Landroid/content/Intent;

    .line 102
    .line 103
    const/4 v1, -0x1

    .line 104
    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 108
    .line 109
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    sget v1, Ll/pdc0;->f:I

    .line 118
    .line 119
    if-ne v0, v1, :cond_6

    .line 120
    .line 121
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Ljava/lang/String;

    .line 124
    .line 125
    new-instance v0, Landroid/content/Intent;

    .line 126
    .line 127
    const-string v1, "android.intent.action.VIEW"

    .line 128
    .line 129
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 134
    .line 135
    .line 136
    const/high16 p1, 0x80000

    .line 137
    .line 138
    invoke-virtual {v0, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 139
    .line 140
    .line 141
    iget-object p0, p0, Lcom/uuzuche/lib_zxing/decoding/CaptureActivityHandler;->a:Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 142
    .line 143
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 148
    .line 149
    .line 150
    :cond_6
    return-void
.end method
