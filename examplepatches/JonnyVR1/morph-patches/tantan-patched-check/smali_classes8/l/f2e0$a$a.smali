.class public Ll/f2e0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/f2e0$a;->d(Ll/x20;JJLjava/util/concurrent/TimeUnit;)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:J

.field public final synthetic d:J

.field public final synthetic e:J

.field public final synthetic f:Ll/x20;

.field public final synthetic g:Ll/mu10;

.field public final synthetic h:J

.field public final synthetic i:Ll/f2e0$a;


# direct methods
.method public constructor <init>(Ll/f2e0$a;JJLl/x20;Ll/mu10;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f2e0$a$a;->i:Ll/f2e0$a;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/f2e0$a$a;->d:J

    .line 4
    .line 5
    iput-wide p4, p0, Ll/f2e0$a$a;->e:J

    .line 6
    .line 7
    iput-object p6, p0, Ll/f2e0$a$a;->f:Ll/x20;

    .line 8
    .line 9
    iput-object p7, p0, Ll/f2e0$a$a;->g:Ll/mu10;

    .line 10
    .line 11
    iput-wide p8, p0, Ll/f2e0$a$a;->h:J

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-wide p2, p0, Ll/f2e0$a$a;->b:J

    .line 17
    .line 18
    iput-wide p4, p0, Ll/f2e0$a$a;->c:J

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public call()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/f2e0$a$a;->f:Ll/x20;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/f2e0$a$a;->g:Ll/mu10;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/mu10;->isUnsubscribed()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/f2e0$a$a;->i:Ll/f2e0$a;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/f2e0$a;->a()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 21
    .line 22
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    sget-wide v2, Ll/f2e0;->a:J

    .line 27
    .line 28
    add-long v4, v0, v2

    .line 29
    .line 30
    iget-wide v6, p0, Ll/f2e0$a$a;->b:J

    .line 31
    .line 32
    cmp-long v4, v4, v6

    .line 33
    .line 34
    const-wide/16 v8, 0x1

    .line 35
    .line 36
    if-ltz v4, :cond_1

    .line 37
    .line 38
    iget-wide v4, p0, Ll/f2e0$a$a;->h:J

    .line 39
    .line 40
    add-long/2addr v6, v4

    .line 41
    add-long/2addr v6, v2

    .line 42
    cmp-long v2, v0, v6

    .line 43
    .line 44
    if-ltz v2, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-wide v2, p0, Ll/f2e0$a$a;->c:J

    .line 48
    .line 49
    iget-wide v6, p0, Ll/f2e0$a$a;->a:J

    .line 50
    .line 51
    add-long/2addr v6, v8

    .line 52
    iput-wide v6, p0, Ll/f2e0$a$a;->a:J

    .line 53
    .line 54
    mul-long/2addr v6, v4

    .line 55
    add-long/2addr v2, v6

    .line 56
    goto :goto_1

    .line 57
    :cond_1
    :goto_0
    iget-wide v2, p0, Ll/f2e0$a$a;->h:J

    .line 58
    .line 59
    add-long v4, v0, v2

    .line 60
    .line 61
    iget-wide v6, p0, Ll/f2e0$a$a;->a:J

    .line 62
    .line 63
    add-long/2addr v6, v8

    .line 64
    iput-wide v6, p0, Ll/f2e0$a$a;->a:J

    .line 65
    .line 66
    mul-long/2addr v2, v6

    .line 67
    sub-long v2, v4, v2

    .line 68
    .line 69
    iput-wide v2, p0, Ll/f2e0$a$a;->c:J

    .line 70
    .line 71
    move-wide v2, v4

    .line 72
    :goto_1
    iput-wide v0, p0, Ll/f2e0$a$a;->b:J

    .line 73
    .line 74
    sub-long/2addr v2, v0

    .line 75
    iget-object v0, p0, Ll/f2e0$a$a;->g:Ll/mu10;

    .line 76
    .line 77
    iget-object v1, p0, Ll/f2e0$a$a;->i:Ll/f2e0$a;

    .line 78
    .line 79
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 80
    .line 81
    invoke-virtual {v1, p0, v2, v3, v4}, Ll/f2e0$a;->c(Ll/x20;JLjava/util/concurrent/TimeUnit;)Ll/kcg0;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {v0, p0}, Ll/mu10;->a(Ll/kcg0;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method
