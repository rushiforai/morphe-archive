.class public final Ll/rpv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/content/Context;


# direct methods
.method public constructor <init>(Ll/xvw0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rpv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rpv0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/spv0;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/content/IntentFilter;

    .line 2
    .line 3
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ll/sgs0;->wa:Ll/dgs0;

    .line 9
    .line 10
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ljava/lang/Boolean;

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 28
    .line 29
    const/16 v3, 0x21

    .line 30
    .line 31
    if-lt v1, v3, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/rpv0;->b:Landroid/content/Context;

    .line 34
    .line 35
    const/4 v1, 0x4

    .line 36
    invoke-static {p0, v2, v0, v1}, Ll/jdy0;->a(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p0, p0, Ll/rpv0;->b:Landroid/content/Context;

    .line 42
    .line 43
    invoke-static {p0, v2, v0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    :goto_0
    const/4 v0, 0x0

    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    const-string v1, "status"

    .line 51
    .line 52
    const/4 v2, -0x1

    .line 53
    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    const-string v3, "level"

    .line 58
    .line 59
    invoke-virtual {p0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const-string v4, "scale"

    .line 64
    .line 65
    invoke-virtual {p0, v4, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    int-to-double v2, v3

    .line 70
    int-to-double v4, p0

    .line 71
    const/4 p0, 0x2

    .line 72
    const/4 v6, 0x1

    .line 73
    if-eq v1, p0, :cond_1

    .line 74
    .line 75
    const/4 p0, 0x5

    .line 76
    if-ne v1, p0, :cond_2

    .line 77
    .line 78
    :cond_1
    move v0, v6

    .line 79
    :cond_2
    div-double/2addr v2, v4

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    const-wide/high16 v2, -0x4010000000000000L    # -1.0

    .line 82
    .line 83
    :goto_1
    new-instance p0, Ll/spv0;

    .line 84
    .line 85
    invoke-direct {p0, v2, v3, v0}, Ll/spv0;-><init>(DZ)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0xe

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnprotectedReceiver"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/qpv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qpv0;-><init>(Ll/rpv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/rpv0;->a:Ll/xvw0;

    .line 7
    .line 8
    invoke-interface {p0, v0}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
