.class public Ltech/sud/runtime/component/c/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltech/sud/runtime/component/c/b$a;
    }
.end annotation


# static fields
.field private static a:Ltech/sud/runtime/component/c/b$a;

.field private static b:Z


# direct methods
.method public static a()Ltech/sud/runtime/component/c/b$a;
    .locals 3

    .line 1
    sget-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->g:Ltech/sud/runtime/component/c/b$a;

    .line 7
    .line 8
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 9
    .line 10
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "huawei"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->a:Ltech/sud/runtime/component/c/b$a;

    .line 25
    .line 26
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string v1, "xiaomi"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->b:Ltech/sud/runtime/component/c/b$a;

    .line 38
    .line 39
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    const-string v1, "vivo"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    const/4 v2, 0x1

    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    sput-boolean v2, Ltech/sud/runtime/component/c/b;->b:Z

    .line 52
    .line 53
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->c:Ltech/sud/runtime/component/c/b$a;

    .line 54
    .line 55
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const-string v1, "oppo"

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    sput-boolean v2, Ltech/sud/runtime/component/c/b;->b:Z

    .line 67
    .line 68
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->d:Ltech/sud/runtime/component/c/b$a;

    .line 69
    .line 70
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_4
    const-string v1, "samsung"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->e:Ltech/sud/runtime/component/c/b$a;

    .line 82
    .line 83
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_5
    const-string v1, "smartisan"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_6

    .line 93
    .line 94
    sget-object v0, Ltech/sud/runtime/component/c/b$a;->f:Ltech/sud/runtime/component/c/b$a;

    .line 95
    .line 96
    sput-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 97
    .line 98
    :cond_6
    :goto_0
    sget-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 99
    .line 100
    return-object v0
.end method

.method public static b()Z
    .locals 2

    .line 1
    sget-object v0, Ltech/sud/runtime/component/c/b;->a:Ltech/sud/runtime/component/c/b$a;

    .line 2
    .line 3
    sget-object v1, Ltech/sud/runtime/component/c/b$a;->f:Ltech/sud/runtime/component/c/b$a;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    return v0
.end method
