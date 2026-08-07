.class public final Lcom/android/billingclient/api/a$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/AnyThread;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private volatile a:Lcom/android/billingclient/api/e;

.field private final b:Landroid/content/Context;

.field private volatile c:Ll/vkb0;

.field private volatile d:Z

.field private volatile e:Z


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ll/ely0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method private final e()Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object p0, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/16 v2, 0x80

    .line 15
    .line 16
    invoke-virtual {v1, p0, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    .line 21
    .line 22
    const-string v1, "com.google.android.play.billingclient.enableBillingOverridesTesting"

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 25
    .line 26
    .line 27
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    return p0

    .line 29
    :catch_0
    move-exception p0

    .line 30
    const-string v1, "BillingClient"

    .line 31
    .line 32
    const-string v2, "Unable to retrieve metadata value for enableBillingOverridesTesting."

    .line 33
    .line 34
    invoke-static {v1, v2, p0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return v0
.end method


# virtual methods
.method public a()Lcom/android/billingclient/api/a;
    .locals 9
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->c:Ll/vkb0;

    .line 6
    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/android/billingclient/api/a$a;->d:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/android/billingclient/api/a$a;->e:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p0, "Please provide a valid listener for purchases updates."

    .line 19
    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/billingclient/api/a$a;->e()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    const/4 v1, 0x0

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    new-instance p0, Lcom/android/billingclient/api/e0;

    .line 35
    .line 36
    invoke-direct {p0, v1, v0, v1, v1}, Lcom/android/billingclient/api/e0;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 37
    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_2
    new-instance p0, Lcom/android/billingclient/api/b;

    .line 41
    .line 42
    invoke-direct {p0, v1, v0, v1, v1}, Lcom/android/billingclient/api/b;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->a:Lcom/android/billingclient/api/e;

    .line 47
    .line 48
    if-eqz v0, :cond_7

    .line 49
    .line 50
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->a:Lcom/android/billingclient/api/e;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/android/billingclient/api/e;->a()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_7

    .line 57
    .line 58
    iget-object v0, p0, Lcom/android/billingclient/api/a$a;->c:Ll/vkb0;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    iget-object v3, p0, Lcom/android/billingclient/api/a$a;->a:Lcom/android/billingclient/api/e;

    .line 63
    .line 64
    iget-object v4, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 65
    .line 66
    iget-object v5, p0, Lcom/android/billingclient/api/a$a;->c:Ll/vkb0;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/android/billingclient/api/a$a;->e()Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eqz p0, :cond_4

    .line 73
    .line 74
    new-instance v1, Lcom/android/billingclient/api/e0;

    .line 75
    .line 76
    const/4 v7, 0x0

    .line 77
    const/4 v8, 0x0

    .line 78
    const/4 v2, 0x0

    .line 79
    const/4 v6, 0x0

    .line 80
    invoke-direct/range {v1 .. v8}, Lcom/android/billingclient/api/e0;-><init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/vkb0;Ll/bas0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 81
    .line 82
    .line 83
    return-object v1

    .line 84
    :cond_4
    new-instance v1, Lcom/android/billingclient/api/b;

    .line 85
    .line 86
    const/4 v7, 0x0

    .line 87
    const/4 v8, 0x0

    .line 88
    const/4 v2, 0x0

    .line 89
    const/4 v6, 0x0

    .line 90
    invoke-direct/range {v1 .. v8}, Lcom/android/billingclient/api/b;-><init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/vkb0;Ll/bas0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 91
    .line 92
    .line 93
    return-object v1

    .line 94
    :cond_5
    iget-object v4, p0, Lcom/android/billingclient/api/a$a;->a:Lcom/android/billingclient/api/e;

    .line 95
    .line 96
    iget-object v5, p0, Lcom/android/billingclient/api/a$a;->b:Landroid/content/Context;

    .line 97
    .line 98
    invoke-direct {p0}, Lcom/android/billingclient/api/a$a;->e()Z

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    if-eqz p0, :cond_6

    .line 103
    .line 104
    new-instance v2, Lcom/android/billingclient/api/e0;

    .line 105
    .line 106
    const/4 v7, 0x0

    .line 107
    const/4 v8, 0x0

    .line 108
    const/4 v3, 0x0

    .line 109
    const/4 v6, 0x0

    .line 110
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/e0;-><init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/tot0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 111
    .line 112
    .line 113
    return-object v2

    .line 114
    :cond_6
    new-instance v2, Lcom/android/billingclient/api/b;

    .line 115
    .line 116
    const/4 v7, 0x0

    .line 117
    const/4 v8, 0x0

    .line 118
    const/4 v3, 0x0

    .line 119
    const/4 v6, 0x0

    .line 120
    invoke-direct/range {v2 .. v8}, Lcom/android/billingclient/api/b;-><init>(Ljava/lang/String;Lcom/android/billingclient/api/e;Landroid/content/Context;Ll/tot0;Lcom/android/billingclient/api/g0;Ljava/util/concurrent/ExecutorService;)V

    .line 121
    .line 122
    .line 123
    return-object v2

    .line 124
    :cond_7
    const-string p0, "Pending purchases for one-time products must be supported."

    .line 125
    .line 126
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    const/4 p0, 0x0

    .line 130
    return-object p0

    .line 131
    :cond_8
    const-string p0, "Please provide a valid Context."

    .line 132
    .line 133
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    const/4 p0, 0x0

    .line 137
    return-object p0
.end method

.method public b()Lcom/android/billingclient/api/a$a;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/billingclient/api/e;->c()Lcom/android/billingclient/api/e$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/billingclient/api/e$a;->b()Lcom/android/billingclient/api/e$a;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/billingclient/api/e$a;->a()Lcom/android/billingclient/api/e;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/android/billingclient/api/a$a;->c(Lcom/android/billingclient/api/e;)Lcom/android/billingclient/api/a$a;

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public c(Lcom/android/billingclient/api/e;)Lcom/android/billingclient/api/a$a;
    .locals 0
    .param p1    # Lcom/android/billingclient/api/e;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/a$a;->a:Lcom/android/billingclient/api/e;

    return-object p0
.end method

.method public d(Ll/vkb0;)Lcom/android/billingclient/api/a$a;
    .locals 0
    .param p1    # Ll/vkb0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/a$a;->c:Ll/vkb0;

    .line 2
    .line 3
    return-object p0
.end method
