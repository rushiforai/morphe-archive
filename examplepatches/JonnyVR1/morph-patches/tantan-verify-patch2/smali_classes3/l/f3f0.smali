.class public Ll/f3f0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;Landroid/app/Activity;)Ll/wc80;
    .locals 1

    .line 1
    const-string v0, "WECHAT_MOMENT"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ll/kvp0;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/kvp0;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    const-string v0, "WECHAT_SESSION"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    new-instance p0, Ll/vvp0;

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ll/vvp0;-><init>(Landroid/app/Activity;)V

    .line 26
    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    const-string v0, "QQ_MOMENT"

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    new-instance p0, Ll/gvb0;

    .line 38
    .line 39
    invoke-direct {p0, p1}, Ll/gvb0;-><init>(Landroid/app/Activity;)V

    .line 40
    .line 41
    .line 42
    return-object p0

    .line 43
    :cond_2
    const-string v0, "QQ_SESSION"

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    new-instance p0, Ll/hvb0;

    .line 52
    .line 53
    invoke-direct {p0, p1}, Ll/hvb0;-><init>(Landroid/app/Activity;)V

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    const-string v0, "SINA_WEIBO"

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_4

    .line 64
    .line 65
    new-instance p0, Ll/fqf0;

    .line 66
    .line 67
    invoke-direct {p0, p1}, Ll/fqf0;-><init>(Landroid/app/Activity;)V

    .line 68
    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_4
    const-string p0, "no platform found !!"

    .line 72
    .line 73
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const/4 p0, 0x0

    .line 77
    return-object p0
.end method

.method public static b(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/f3f0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
