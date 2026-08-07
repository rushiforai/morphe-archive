.class public Ll/cqw;
.super Ll/u1j0;
.source "SourceFile"


# instance fields
.field private e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/CharSequence;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/u1j0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/cqw;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static r()Ll/cqw;
    .locals 1

    .line 1
    new-instance v0, Ll/cqw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cqw;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/cqw;->j()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public j()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/u1j0;->j()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    const/16 v2, 0x11

    .line 9
    .line 10
    invoke-virtual {p0, v2, v0, v1}, Landroid/widget/Toast;->setGravity(III)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public q(Ljava/lang/CharSequence;ZI)V
    .locals 4

    .line 1
    iget-object p2, p0, Ll/cqw;->e:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/cqw;->e:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    check-cast p2, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    sub-long/2addr v2, v0

    .line 26
    const-wide/16 v0, 0x7d0

    .line 27
    .line 28
    cmp-long p2, v2, v0

    .line 29
    .line 30
    if-gez p2, :cond_0

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 34
    .line 35
    invoke-virtual {p2}, Landroid/widget/Toast;->cancel()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/cqw;->j()V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 42
    .line 43
    invoke-virtual {p2, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    const/16 v0, 0x9

    .line 53
    .line 54
    if-le p2, v0, :cond_1

    .line 55
    .line 56
    if-nez p3, :cond_1

    .line 57
    .line 58
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 59
    .line 60
    const/4 p3, 0x1

    .line 61
    invoke-virtual {p2, p3}, Landroid/widget/Toast;->setDuration(I)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 66
    .line 67
    invoke-virtual {p2, p3}, Landroid/widget/Toast;->setDuration(I)V

    .line 68
    .line 69
    .line 70
    :goto_0
    iget-object p2, p0, Ll/u1j0;->a:Landroid/widget/Toast;

    .line 71
    .line 72
    invoke-virtual {p2}, Landroid/widget/Toast;->show()V

    .line 73
    .line 74
    .line 75
    iget-object p2, p0, Ll/cqw;->e:Ljava/util/HashMap;

    .line 76
    .line 77
    invoke-virtual {p2}, Ljava/util/HashMap;->clear()V

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Ll/cqw;->e:Ljava/util/HashMap;

    .line 81
    .line 82
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 83
    .line 84
    .line 85
    move-result-wide p2

    .line 86
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    return-void
.end method
