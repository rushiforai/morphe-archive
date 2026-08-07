.class public final Ll/uvt0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/vcw0;

.field public final b:Ll/xwu0;

.field public final c:Ll/b7w0;


# direct methods
.method public constructor <init>(Ll/xwu0;Ll/b7w0;Ll/vcw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/uvt0;->a:Ll/vcw0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/uvt0;->b:Ll/xwu0;

    .line 7
    .line 8
    iput-object p2, p0, Ll/uvt0;->c:Ll/b7w0;

    .line 9
    .line 10
    return-void
.end method

.method public static b(I)Ljava/lang/String;
    .locals 1

    .line 1
    add-int/lit8 p0, p0, -0x1

    .line 2
    .line 3
    if-eqz p0, :cond_4

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eq p0, v0, :cond_3

    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    if-eq p0, v0, :cond_2

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    if-eq p0, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x4

    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    const-string p0, "u"

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "ac"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "cb"

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_2
    const-string p0, "cc"

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_3
    const-string p0, "bb"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_4
    const-string p0, "h"

    .line 33
    .line 34
    return-object p0
.end method


# virtual methods
.method public final a(JI)V
    .locals 6

    .line 1
    sget-object v0, Ll/sgs0;->z8:Ll/dgs0;

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
    const-string v1, "acr"

    .line 18
    .line 19
    const-string v2, "app_open_ad"

    .line 20
    .line 21
    const-string v3, "ad_format"

    .line 22
    .line 23
    const-string v4, "show_time"

    .line 24
    .line 25
    const-string v5, "ad_closed"

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/uvt0;->a:Ll/vcw0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/uvt0;->c:Ll/b7w0;

    .line 32
    .line 33
    invoke-static {v5}, Ll/ucw0;->b(Ljava/lang/String;)Ll/ucw0;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 40
    .line 41
    invoke-virtual {v5, p0}, Ll/ucw0;->g(Ll/t6w0;)Ll/ucw0;

    .line 42
    .line 43
    .line 44
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v5, v4, p0}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v5, v3, v2}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 52
    .line 53
    .line 54
    invoke-static {p3}, Ll/uvt0;->b(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v5, v1, p0}, Ll/ucw0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ucw0;

    .line 59
    .line 60
    .line 61
    invoke-interface {v0, v5}, Ll/vcw0;->a(Ll/ucw0;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    iget-object v0, p0, Ll/uvt0;->b:Ll/xwu0;

    .line 66
    .line 67
    iget-object p0, p0, Ll/uvt0;->c:Ll/b7w0;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/xwu0;->a()Ll/wwu0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iget-object p0, p0, Ll/b7w0;->b:Ll/a7w0;

    .line 74
    .line 75
    iget-object p0, p0, Ll/a7w0;->b:Ll/t6w0;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Ll/wwu0;->e(Ll/t6w0;)Ll/wwu0;

    .line 78
    .line 79
    .line 80
    const-string p0, "action"

    .line 81
    .line 82
    invoke-virtual {v0, p0, v5}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 83
    .line 84
    .line 85
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, v4, p0}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v3, v2}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 93
    .line 94
    .line 95
    invoke-static {p3}, Ll/uvt0;->b(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, v1, p0}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ll/wwu0;->g()V

    .line 103
    .line 104
    .line 105
    return-void
.end method
