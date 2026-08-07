.class public Ll/a0h;
.super Ll/w1e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/a0h$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/w1e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic g(Ll/a0h;Ll/a0h$a;)Landroid/app/Dialog;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/a0h;->h(Ll/a0h$a;)Landroid/app/Dialog;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ll/a0h$a;)Ll/rzg;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a0h$a;->a:Ll/rzg;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/a0h$a;->a:Ll/rzg;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Ll/a0h$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const v1, -0x18f8f039

    .line 19
    .line 20
    .line 21
    if-eq v0, v1, :cond_3

    .line 22
    .line 23
    const v1, 0x5f9cd963

    .line 24
    .line 25
    .line 26
    if-eq v0, v1, :cond_2

    .line 27
    .line 28
    const v1, 0x6a03370c

    .line 29
    .line 30
    .line 31
    if-eq v0, v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    const-string v0, "TEXT_TYPE"

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    goto :goto_0

    .line 41
    :cond_2
    const-string v0, "SELECT_ITEM_TYPE"

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    new-instance p0, Ll/szg;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/szg;-><init>()V

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_3
    const-string v0, "TWO_LINKAGE_TYPE"

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    new-instance p0, Ll/vzg;

    .line 64
    .line 65
    invoke-direct {p0}, Ll/vzg;-><init>()V

    .line 66
    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_4
    :goto_0
    new-instance p0, Ll/uzg;

    .line 70
    .line 71
    invoke-direct {p0}, Ll/uzg;-><init>()V

    .line 72
    .line 73
    .line 74
    return-object p0
.end method


# virtual methods
.method public final h(Ll/a0h$a;)Landroid/app/Dialog;
    .locals 2

    .line 1
    new-instance p0, Ll/urg;

    .line 2
    .line 3
    iget-object v0, p1, Ll/a0h$a;->f:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ll/urg;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/a0h;->i(Ll/a0h$a;)Ll/rzg;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object v1, p1, Ll/a0h$a;->d:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-interface {v0, v1, p1, p0}, Ll/rzg;->a(Ljava/lang/Object;Ll/a0h$a;Landroid/app/Dialog;)V

    .line 15
    .line 16
    .line 17
    return-object p0
.end method
