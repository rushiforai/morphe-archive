.class public Ll/cjm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/cjm$a;
    }
.end annotation


# static fields
.field public static final a:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/cjm$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/cjm;->a:Lrx/subjects/a;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lrx/subjects/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ll/cjm$a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cjm;->a:Lrx/subjects/a;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Ljava/math/BigDecimal;Ljava/math/BigDecimal;J)Ll/cjm$a;
    .locals 3

    .line 1
    new-instance v0, Ll/cjm$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cjm$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p0, v0, Ll/cjm$a;->a:Ljava/math/BigDecimal;

    .line 7
    .line 8
    iput-wide p2, v0, Ll/cjm$a;->e:J

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide p2

    .line 14
    iput-wide p2, v0, Ll/cjm$a;->d:J

    .line 15
    .line 16
    iput-object p1, v0, Ll/cjm$a;->b:Ljava/math/BigDecimal;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide p1

    .line 22
    const-wide/16 v1, 0x400

    .line 23
    .line 24
    cmp-long p1, p1, v1

    .line 25
    .line 26
    if-ltz p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Ljava/math/BigDecimal;

    .line 29
    .line 30
    const/16 p2, 0x400

    .line 31
    .line 32
    invoke-direct {p1, p2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValue()J

    .line 45
    .line 46
    .line 47
    move-result-wide p2

    .line 48
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "Mb/s"

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iput-object p0, v0, Ll/cjm$a;->c:Ljava/lang/String;

    .line 61
    .line 62
    return-object v0

    .line 63
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValue()J

    .line 69
    .line 70
    .line 71
    move-result-wide p2

    .line 72
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p0, "kb/s"

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, v0, Ll/cjm$a;->c:Ljava/lang/String;

    .line 85
    .line 86
    return-object v0
.end method

.method public static c()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/cjm$a;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/cjm;->a:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method
