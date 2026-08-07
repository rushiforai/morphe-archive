.class public final Ll/s5g0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fzi0;

.field public b:Z

.field public c:J

.field public d:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/fzi0;->b()Ll/fzi0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/s5g0;->a:Ll/fzi0;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/s5g0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/aqg0;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :pswitch_0
    const-string p0, "d"

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_1
    const-string p0, "h"

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_2
    const-string p0, "min"

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_3
    const-string p0, "s"

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_4
    const-string p0, "ms"

    .line 30
    .line 31
    return-object p0

    .line 32
    :pswitch_5
    const-string p0, "\u03bcs"

    .line 33
    .line 34
    return-object p0

    .line 35
    :pswitch_6
    const-string p0, "ns"

    .line 36
    .line 37
    return-object p0

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static b(J)Ljava/util/concurrent/TimeUnit;
    .locals 4

    .line 1
    const-wide v0, 0x4e94914f0000L

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    div-long v0, p0, v0

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    sget-object p0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-wide v0, 0x34630b8a000L

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    div-long v0, p0, v0

    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-lez v0, :cond_1

    .line 27
    .line 28
    sget-object p0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    const-wide v0, 0xdf8475800L

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    div-long v0, p0, v0

    .line 37
    .line 38
    cmp-long v0, v0, v2

    .line 39
    .line 40
    if-lez v0, :cond_2

    .line 41
    .line 42
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_2
    const-wide/32 v0, 0x3b9aca00

    .line 46
    .line 47
    .line 48
    div-long v0, p0, v0

    .line 49
    .line 50
    cmp-long v0, v0, v2

    .line 51
    .line 52
    if-lez v0, :cond_3

    .line 53
    .line 54
    sget-object p0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    const-wide/32 v0, 0xf4240

    .line 58
    .line 59
    .line 60
    div-long v0, p0, v0

    .line 61
    .line 62
    cmp-long v0, v0, v2

    .line 63
    .line 64
    if-lez v0, :cond_4

    .line 65
    .line 66
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_4
    const-wide/16 v0, 0x3e8

    .line 70
    .line 71
    div-long/2addr p0, v0

    .line 72
    cmp-long p0, p0, v2

    .line 73
    .line 74
    if-lez p0, :cond_5

    .line 75
    .line 76
    sget-object p0, Ljava/util/concurrent/TimeUnit;->MICROSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_5
    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 80
    .line 81
    return-object p0
.end method

.method public static c()Ll/s5g0;
    .locals 1

    .line 1
    new-instance v0, Ll/s5g0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s5g0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/s5g0;->g()Ll/s5g0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    return-object v0
.end method

.method public static d()Ll/s5g0;
    .locals 1

    .line 1
    new-instance v0, Ll/s5g0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s5g0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public e(Ljava/util/concurrent/TimeUnit;)J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/s5g0;->f()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 8
    .line 9
    .line 10
    move-result-wide p0

    .line 11
    return-wide p0
.end method

.method public final f()J
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/s5g0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/s5g0;->a:Ll/fzi0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/fzi0;->a()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iget-wide v2, p0, Ll/s5g0;->d:J

    .line 12
    .line 13
    sub-long/2addr v0, v2

    .line 14
    iget-wide v2, p0, Ll/s5g0;->c:J

    .line 15
    .line 16
    add-long/2addr v0, v2

    .line 17
    return-wide v0

    .line 18
    :cond_0
    iget-wide v0, p0, Ll/s5g0;->c:J

    .line 19
    .line 20
    return-wide v0
.end method

.method public g()Ll/s5g0;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/s5g0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    xor-int/2addr v0, v1

    .line 5
    const-string v2, "This stopwatch is already running."

    .line 6
    .line 7
    invoke-static {v0, v2}, Ll/xn80;->w(ZLjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    iput-boolean v1, p0, Ll/s5g0;->b:Z

    .line 11
    .line 12
    iget-object v0, p0, Ll/s5g0;->a:Ll/fzi0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/fzi0;->a()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iput-wide v0, p0, Ll/s5g0;->d:J

    .line 19
    .line 20
    return-object p0
.end method

.method public h()Ll/s5g0;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s5g0;->a:Ll/fzi0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fzi0;->a()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-boolean v2, p0, Ll/s5g0;->b:Z

    .line 8
    .line 9
    const-string v3, "This stopwatch is already stopped."

    .line 10
    .line 11
    invoke-static {v2, v3}, Ll/xn80;->w(ZLjava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, p0, Ll/s5g0;->b:Z

    .line 16
    .line 17
    iget-wide v2, p0, Ll/s5g0;->c:J

    .line 18
    .line 19
    iget-wide v4, p0, Ll/s5g0;->d:J

    .line 20
    .line 21
    sub-long/2addr v0, v4

    .line 22
    add-long/2addr v2, v0

    .line 23
    iput-wide v2, p0, Ll/s5g0;->c:J

    .line 24
    .line 25
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/s5g0;->f()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1}, Ll/s5g0;->b(J)Ljava/util/concurrent/TimeUnit;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    long-to-double v0, v0

    .line 10
    sget-object v2, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    const-wide/16 v3, 0x1

    .line 13
    .line 14
    invoke-virtual {v2, v3, v4, p0}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    long-to-double v2, v2

    .line 19
    div-double/2addr v0, v2

    .line 20
    invoke-static {v0, v1}, Lcom/google/common/base/b;->c(D)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {p0}, Ll/s5g0;->a(Ljava/util/concurrent/TimeUnit;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    add-int/2addr v1, v2

    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, " "

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
