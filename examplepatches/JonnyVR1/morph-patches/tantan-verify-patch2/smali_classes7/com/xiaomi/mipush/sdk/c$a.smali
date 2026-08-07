.class public Lcom/xiaomi/mipush/sdk/c$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Z

.field public j:Z

.field public k:I

.field private l:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/c$a;->j:Z

    .line 9
    .line 10
    iput v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->k:I

    .line 11
    .line 12
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 13
    .line 14
    return-void
.end method

.method private a()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p0, v0}, Lcom/xiaomi/push/g;->h(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static b(Lcom/xiaomi/mipush/sdk/c$a;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "appId"

    .line 7
    .line 8
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v1, "appToken"

    .line 14
    .line 15
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 18
    .line 19
    .line 20
    const-string v1, "regId"

    .line 21
    .line 22
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    const-string v1, "regSec"

    .line 28
    .line 29
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->d:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    const-string v1, "devId"

    .line 35
    .line 36
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 39
    .line 40
    .line 41
    const-string v1, "vName"

    .line 42
    .line 43
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->e:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    const-string v1, "valid"

    .line 49
    .line 50
    iget-boolean v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    const-string v1, "paused"

    .line 56
    .line 57
    iget-boolean v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->j:Z

    .line 58
    .line 59
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    const-string v1, "envType"

    .line 63
    .line 64
    iget v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->k:I

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 67
    .line 68
    .line 69
    const-string v1, "regResource"

    .line 70
    .line 71
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/c$a;->g:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    return-object p0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    return-object p0
.end method


# virtual methods
.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->b:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->c:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->d:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->e:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/xiaomi/mipush/sdk/c$a;->j:Z

    .line 35
    .line 36
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->h:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    iput v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->k:I

    .line 40
    .line 41
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/c$a;->d:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {p1}, Ll/u3r0;->A(Landroid/content/Context;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/c$a;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->e:Ljava/lang/String;

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 21
    .line 22
    return-void
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/c$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/c$a;->g:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/c;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "appId"

    .line 18
    .line 19
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 20
    .line 21
    invoke-interface {p1, v0, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 22
    .line 23
    .line 24
    const-string p0, "appToken"

    .line 25
    .line 26
    invoke-interface {p1, p0, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 27
    .line 28
    .line 29
    const-string p0, "regResource"

    .line 30
    .line 31
    invoke-interface {p1, p0, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 32
    .line 33
    .line 34
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public h()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/c$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/xiaomi/mipush/sdk/c$a;->i(Ljava/lang/String;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    xor-int/lit8 v1, v0, 0x1

    .line 20
    .line 21
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/c$a;->d:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    xor-int/lit8 v3, v2, 0x1

    .line 28
    .line 29
    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 30
    .line 31
    invoke-static {v4}, Ll/u3r0;->p(Landroid/content/Context;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    const/4 v5, 0x0

    .line 40
    const/4 v6, 0x1

    .line 41
    if-eqz v4, :cond_1

    .line 42
    .line 43
    :cond_0
    :goto_0
    move p0, v6

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v7, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 48
    .line 49
    invoke-static {v7}, Ll/u3r0;->A(Landroid/content/Context;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-static {v4, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    if-nez v4, :cond_0

    .line 58
    .line 59
    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 62
    .line 63
    invoke-static {p0}, Ll/u3r0;->z(Landroid/content/Context;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v4, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    move p0, v5

    .line 75
    :goto_1
    if-eqz p1, :cond_3

    .line 76
    .line 77
    if-eqz p2, :cond_3

    .line 78
    .line 79
    if-nez v0, :cond_3

    .line 80
    .line 81
    if-nez v2, :cond_3

    .line 82
    .line 83
    if-eqz p0, :cond_3

    .line 84
    .line 85
    move v5, v6

    .line 86
    :cond_3
    if-nez v5, :cond_4

    .line 87
    .line 88
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    filled-new-array {p1, p2, v0, v1, p0}, [Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const-string p1, "register invalid, aid=%s;atn=%s;rid=%s;rse=%s;did=%s"

    .line 113
    .line 114
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/ouq0;->D(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_4
    return v5
.end method

.method public j()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/c;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "valid"

    .line 15
    .line 16
    iget-boolean p0, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 17
    .line 18
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/c$a;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/c$a;->d:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 6
    .line 7
    invoke-static {v0}, Ll/u3r0;->A(Landroid/content/Context;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/c$a;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->e:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lcom/xiaomi/mipush/sdk/c$a;->i:Z

    .line 21
    .line 22
    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/c$a;->h:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/c$a;->l:Landroid/content/Context;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/c;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "regId"

    .line 35
    .line 36
    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 37
    .line 38
    .line 39
    const-string p1, "regSec"

    .line 40
    .line 41
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 42
    .line 43
    .line 44
    const-string p1, "devId"

    .line 45
    .line 46
    iget-object p2, p0, Lcom/xiaomi/mipush/sdk/c$a;->f:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 49
    .line 50
    .line 51
    const-string p1, "vName"

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/c$a;->a()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {v1, p1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 58
    .line 59
    .line 60
    const-string p0, "valid"

    .line 61
    .line 62
    invoke-interface {v1, p0, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 63
    .line 64
    .line 65
    const-string p0, "appRegion"

    .line 66
    .line 67
    invoke-interface {v1, p0, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 68
    .line 69
    .line 70
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 71
    .line 72
    .line 73
    return-void
.end method
