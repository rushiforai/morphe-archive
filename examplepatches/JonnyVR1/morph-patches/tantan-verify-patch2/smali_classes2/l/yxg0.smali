.class public final Ll/yxg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static h:Ll/geg0;


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Ll/sxg0;

.field public c:Ltech/sud/runtime/a/c;

.field public d:Z

.field public e:Ljava/util/HashMap;

.field public f:Ll/geg0;

.field public final g:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/yxg0;->e:Ljava/util/HashMap;

    .line 6
    .line 7
    iput-object v0, p0, Ll/yxg0;->f:Ll/geg0;

    .line 8
    .line 9
    new-instance v0, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/yxg0;->g:Ljava/util/HashMap;

    .line 15
    .line 16
    iput-object p1, p0, Ll/yxg0;->a:Landroid/app/Activity;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/yxg0;->d:Z

    .line 20
    .line 21
    new-instance v1, Ll/sxg0;

    .line 22
    .line 23
    invoke-direct {v1}, Ll/sxg0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/yxg0;->b:Ll/sxg0;

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    iput-boolean p0, v1, Ll/sxg0;->a:Z

    .line 30
    .line 31
    iput-boolean v0, v1, Ll/sxg0;->b:Z

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v1, Ll/sxg0;->c:Ljava/lang/String;

    .line 42
    .line 43
    const-string p0, ""

    .line 44
    .line 45
    iput-object p0, v1, Ll/sxg0;->d:Ljava/lang/String;

    .line 46
    .line 47
    iput-boolean v0, v1, Ll/sxg0;->e:Z

    .line 48
    .line 49
    iput-boolean v0, v1, Ll/sxg0;->f:Z

    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "runtime.LoadPath"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/yxg0;->e:Ljava/util/HashMap;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    new-instance v0, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/yxg0;->e:Ljava/util/HashMap;

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Ll/yxg0;->e:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V
    .locals 1

    .line 1
    const-string v0, "|"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p2, "function name ("

    .line 12
    .line 13
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, ") have illegal character"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iget-boolean v0, p0, Ll/yxg0;->d:Z

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 37
    .line 38
    invoke-interface {p0, p1, p2}, Ltech/sud/runtime/a/a;->a(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    iget-object p0, p0, Ll/yxg0;->g:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final c()Z
    .locals 6

    .line 1
    const-string v0, "checkGlEsVersion \u7b2c\u4e00\u6b21\u68c0\u6d4b\u4e0d\u901a\u8fc7\uff0c\u8d70\u540e\u9762\u903b\u8f91\uff0c\u5f53\u524dGlES\u4e3b\u7248\u672c\u53f7\u4e3a\uff1a"

    .line 2
    .line 3
    iget-object p0, p0, Ll/yxg0;->a:Landroid/app/Activity;

    .line 4
    .line 5
    const-string v1, "activity"

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/app/ActivityManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/content/pm/ConfigurationInfo;->getGlEsVersion()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    const/4 v3, 0x1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    :try_start_0
    const-string v4, "\\."

    .line 26
    .line 27
    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    aget-object v4, v1, v2

    .line 32
    .line 33
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    aget-object v1, v1, v3

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v5, 0x2

    .line 44
    if-gt v4, v5, :cond_1

    .line 45
    .line 46
    if-ne v4, v5, :cond_0

    .line 47
    .line 48
    if-ltz v1, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, " \u6b21\u7248\u672c\u53f7\u4e3a\uff1a"

    .line 60
    .line 61
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/ysg0;->b(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :catch_0
    move-exception v0

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    :goto_0
    return v3

    .line 78
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string v4, "checkGlEsVersion \u7b2c\u4e00\u6b21\u5224\u65ad\u62a5\u4e86\u9519\u8bef\uff0c\u4f46\u4e0d\u5f71\u54cd\u4ec0\u4e48\uff0c\u5185\u5bb9\u662f\uff1a"

    .line 81
    .line 82
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0}, Ll/ysg0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {v0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    :goto_2
    iget v0, p0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    .line 100
    .line 101
    const/high16 v1, 0x20000

    .line 102
    .line 103
    if-lt v0, v1, :cond_3

    .line 104
    .line 105
    move v2, v3

    .line 106
    :cond_3
    if-nez v2, :cond_4

    .line 107
    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v1, "checkGlEsVersion \u68c0\u6d4b\u51fa\u4e0d\u652f\u6301\uff0creqGlEsVersion\u503c\u4e3a\uff1a"

    .line 111
    .line 112
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget p0, p0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    .line 116
    .line 117
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-static {p0}, Ll/ysg0;->b(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_4
    return v2
.end method
