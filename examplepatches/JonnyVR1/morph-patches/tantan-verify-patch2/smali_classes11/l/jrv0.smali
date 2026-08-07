.class public final Ll/jrv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Landroid/view/ViewGroup;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Landroid/content/Context;

.field public final d:Ljava/util/Set;


# direct methods
.method public constructor <init>(Ll/xvw0;Landroid/view/ViewGroup;Landroid/content/Context;Ljava/util/Set;)V
    .locals 0
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jrv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p4, p0, Ll/jrv0;->d:Ljava/util/Set;

    .line 7
    .line 8
    iput-object p2, p0, Ll/jrv0;->b:Landroid/view/ViewGroup;

    .line 9
    .line 10
    iput-object p3, p0, Ll/jrv0;->c:Landroid/content/Context;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a()Ll/krv0;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->T5:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/jrv0;->b:Landroid/view/ViewGroup;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/jrv0;->d:Ljava/util/Set;

    .line 24
    .line 25
    const-string v1, "banner"

    .line 26
    .line 27
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Ll/jrv0;->b:Landroid/view/ViewGroup;

    .line 35
    .line 36
    new-instance v0, Ll/krv0;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->isHardwareAccelerated()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-direct {v0, p0}, Ll/krv0;-><init>(Ljava/lang/Boolean;)V

    .line 47
    .line 48
    .line 49
    return-object v0

    .line 50
    :cond_1
    :goto_0
    sget-object v0, Ll/sgs0;->U5:Ll/dgs0;

    .line 51
    .line 52
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    const/4 v1, 0x0

    .line 67
    if-eqz v0, :cond_4

    .line 68
    .line 69
    iget-object v0, p0, Ll/jrv0;->d:Ljava/util/Set;

    .line 70
    .line 71
    const-string v2, "native"

    .line 72
    .line 73
    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_4

    .line 78
    .line 79
    iget-object p0, p0, Ll/jrv0;->c:Landroid/content/Context;

    .line 80
    .line 81
    instance-of v0, p0, Landroid/app/Activity;

    .line 82
    .line 83
    if-eqz v0, :cond_4

    .line 84
    .line 85
    new-instance v0, Ll/krv0;

    .line 86
    .line 87
    check-cast p0, Landroid/app/Activity;

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    if-eqz v2, :cond_2

    .line 94
    .line 95
    invoke-virtual {v2}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 100
    .line 101
    const/high16 v3, 0x1000000

    .line 102
    .line 103
    and-int/2addr v2, v3

    .line 104
    if-eqz v2, :cond_2

    .line 105
    .line 106
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {p0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const/4 v3, 0x0

    .line 118
    invoke-virtual {v2, p0, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    iget p0, p0, Landroid/content/pm/ActivityInfo;->flags:I

    .line 123
    .line 124
    and-int/lit16 p0, p0, 0x200

    .line 125
    .line 126
    if-eqz p0, :cond_3

    .line 127
    .line 128
    const/4 v3, 0x1

    .line 129
    :cond_3
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 130
    .line 131
    .line 132
    move-result-object v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 133
    :catch_0
    :goto_1
    invoke-direct {v0, v1}, Ll/krv0;-><init>(Ljava/lang/Boolean;)V

    .line 134
    .line 135
    .line 136
    return-object v0

    .line 137
    :cond_4
    new-instance p0, Ll/krv0;

    .line 138
    .line 139
    invoke-direct {p0, v1}, Ll/krv0;-><init>(Ljava/lang/Boolean;)V

    .line 140
    .line 141
    .line 142
    return-object p0
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x16

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 1

    .line 1
    new-instance v0, Ll/irv0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/irv0;-><init>(Ll/jrv0;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/jrv0;->a:Ll/xvw0;

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
