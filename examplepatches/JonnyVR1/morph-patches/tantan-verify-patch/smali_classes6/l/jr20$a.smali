.class public Ll/jr20$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jr20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jr20;


# direct methods
.method public constructor <init>(Ll/jr20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/jr20$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jr20$a;->e()V

    return-void
.end method

.method public static synthetic b(Ll/jr20$a;Ll/g90;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jr20$a;->f(Ll/g90;)V

    return-void
.end method

.method public static synthetic c(Ll/jr20$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jr20$a;->g(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d(Ll/jr20$a;Lrx/Notification;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/jr20$a;->h(Lrx/Notification;)V

    return-void
.end method


# virtual methods
.method public final synthetic e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 12
    .line 13
    iget-object v0, v0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, v1}, Ll/jr20;->i(Ll/jr20;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 25
    .line 26
    iget-object p0, p0, Ll/jr20;->f:Lv/VText;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic f(Ll/g90;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 12
    .line 13
    iget-object v0, v0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/MessageLocation;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jr20;->i(Ll/jr20;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 29
    .line 30
    invoke-static {v0}, Ll/jr20;->e(Ll/jr20;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1}, Ll/g90;->c()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 41
    .line 42
    invoke-static {v0}, Ll/jr20;->e(Ll/jr20;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1}, Ll/g90;->a()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jr20;->e(Ll/jr20;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p1}, Ll/g90;->b()Lcom/p1/mobile/putong/data/DoublePair;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, v0, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 63
    .line 64
    iget-object p0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 65
    .line 66
    iget-object p1, p0, Ll/jr20;->f:Lv/VText;

    .line 67
    .line 68
    invoke-static {p0}, Ll/jr20;->e(Ll/jr20;)Lcom/p1/mobile/putong/data/MessageLocation;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final synthetic g(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 5
    .line 6
    return-void
.end method

.method public final synthetic h(Lrx/Notification;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lrx/Notification;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lrx/Notification;->f()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    .line 12
    .line 13
    iget-object v0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jr20;->f(Ll/jr20;)Ll/l90;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 20
    .line 21
    iget-object p0, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 22
    .line 23
    invoke-virtual {v0, p1, p0}, Ll/e3;->a(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p1}, Lrx/Notification;->i()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 34
    .line 35
    iget-object p1, p1, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-eqz p1, :cond_1

    .line 42
    .line 43
    :try_start_0
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 44
    .line 45
    iget-object p1, p1, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/g1e;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    move-exception p1

    .line 52
    new-instance v0, Ljava/lang/Exception;

    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, "NewCaptionAct exception:"

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-direct {v0, v1, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    :goto_0
    iget-object p0, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 79
    .line 80
    iget-object p1, p0, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 81
    .line 82
    iget-object p0, p0, Ll/jr20;->o:Ll/uq20;

    .line 83
    .line 84
    const/4 p0, 0x1

    .line 85
    invoke-static {p1, p0}, Ll/k3h;->E0(Lcom/p1/mobile/android/app/Act;I)V

    .line 86
    .line 87
    .line 88
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 2
    .line 3
    iget-object v0, p1, Ll/jr20;->q:Ll/f90;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/f90;

    .line 8
    .line 9
    iget-object v1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 10
    .line 11
    iget-object v1, v1, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ll/f90;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p1, Ll/jr20;->q:Ll/f90;

    .line 17
    .line 18
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 19
    .line 20
    iget-object p1, p1, Ll/jr20;->q:Ll/f90;

    .line 21
    .line 22
    new-instance v0, Ll/fr20;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/fr20;-><init>(Ll/jr20$a;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/f90;->B(Ljava/lang/Runnable;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 31
    .line 32
    iget-object p1, p1, Ll/jr20;->q:Ll/f90;

    .line 33
    .line 34
    new-instance v0, Ll/gr20;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Ll/gr20;-><init>(Ll/jr20$a;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ll/f90;->C(Ll/y20;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 43
    .line 44
    invoke-static {p1}, Ll/jr20;->f(Ll/jr20;)Ll/l90;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/e3;->init()V

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 52
    .line 53
    iget-object v0, p1, Ll/jr20;->n:Lcom/p1/mobile/putong/app/PutongAct;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 60
    .line 61
    iget-object v1, v1, Ll/jr20;->q:Ll/f90;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->p(Landroid/widget/ListAdapter;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Ll/hr20;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/hr20;-><init>(Ll/jr20$a;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p1, Ll/jr20;->r:Lcom/p1/mobile/android/app/Dialog;

    .line 81
    .line 82
    iget-object p1, p0, Ll/jr20$a;->a:Ll/jr20;

    .line 83
    .line 84
    iget-object p1, p1, Ll/jr20;->o:Ll/uq20;

    .line 85
    .line 86
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->p()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-wide/16 v1, 0x3

    .line 93
    .line 94
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 95
    .line 96
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lrx/c;->materialize()Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-virtual {p1, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    new-instance v0, Ll/ir20;

    .line 121
    .line 122
    invoke-direct {v0, p0}, Ll/ir20;-><init>(Ll/jr20$a;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    return-void
.end method
