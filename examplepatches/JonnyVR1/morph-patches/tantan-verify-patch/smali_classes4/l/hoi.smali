.class public Ll/hoi;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/hoi;


# instance fields
.field public a:Z

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hoi;->a:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/hoi;->b:Lrx/subjects/a;

    .line 12
    .line 13
    return-void
.end method

.method public static a()Ll/hoi;
    .locals 2

    .line 1
    sget-object v0, Ll/hoi;->c:Ll/hoi;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/hoi;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/hoi;->c:Ll/hoi;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/hoi;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/hoi;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/hoi;->c:Ll/hoi;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/hoi;->c:Ll/hoi;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p0, "e_find_partner_bubble"

    .line 2
    .line 3
    const-string v0, "p_suggest_users_home_view"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance p0, Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "\u8981\u627e\u7684\u642d\u5b50\uff0c\u90fd\u5728\u8fd9\u91cc"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/qa00;->i:I

    .line 24
    .line 25
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 26
    .line 27
    .line 28
    const/high16 v0, 0x41500000    # 13.0f

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    const/4 v0, -0x1

    .line 34
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 38
    .line 39
    invoke-direct {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget v0, Ll/o9c0;->d:I

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    filled-new-array {p1}, [I

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-wide/16 v0, 0x1388

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const/high16 p1, 0x40c00000    # 6.0f

    .line 72
    .line 73
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/high16 p1, 0x40e00000    # 7.0f

    .line 82
    .line 83
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget p1, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 92
    .line 93
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 94
    .line 95
    or-int/2addr p1, v0

    .line 96
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    const-string v0, "growth_find_user_bubble"

    .line 105
    .line 106
    invoke-virtual {p1, p0, p2, v0}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    :goto_0
    return-void
.end method
