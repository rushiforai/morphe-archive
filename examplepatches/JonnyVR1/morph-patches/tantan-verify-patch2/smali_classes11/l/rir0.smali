.class public final Ll/rir0;
.super Ll/qfr0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Ll/bgr0;

.field public final synthetic c:Ll/sir0;


# direct methods
.method public constructor <init>(Ll/sir0;Ll/bgr0;Ll/bgr0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/rir0;->b:Ll/bgr0;

    .line 2
    .line 3
    iput-object p1, p0, Ll/rir0;->c:Ll/sir0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/qfr0;-><init>(Ll/bgr0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/rir0;->b:Ll/bgr0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/bgr0;->a(J)Ll/zfr0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p1, Ll/zfr0;->a:Ll/cgr0;

    .line 8
    .line 9
    iget-wide v0, p2, Ll/cgr0;->b:J

    .line 10
    .line 11
    iget-object v2, p0, Ll/rir0;->c:Ll/sir0;

    .line 12
    .line 13
    new-instance v3, Ll/zfr0;

    .line 14
    .line 15
    new-instance v4, Ll/cgr0;

    .line 16
    .line 17
    invoke-static {v2}, Ll/sir0;->a(Ll/sir0;)J

    .line 18
    .line 19
    .line 20
    move-result-wide v5

    .line 21
    add-long/2addr v0, v5

    .line 22
    iget-wide v5, p2, Ll/cgr0;->a:J

    .line 23
    .line 24
    invoke-direct {v4, v5, v6, v0, v1}, Ll/cgr0;-><init>(JJ)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p1, Ll/zfr0;->b:Ll/cgr0;

    .line 28
    .line 29
    iget-wide v0, p1, Ll/cgr0;->b:J

    .line 30
    .line 31
    iget-object p0, p0, Ll/rir0;->c:Ll/sir0;

    .line 32
    .line 33
    new-instance p2, Ll/cgr0;

    .line 34
    .line 35
    invoke-static {p0}, Ll/sir0;->a(Ll/sir0;)J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    add-long/2addr v0, v5

    .line 40
    iget-wide p0, p1, Ll/cgr0;->a:J

    .line 41
    .line 42
    invoke-direct {p2, p0, p1, v0, v1}, Ll/cgr0;-><init>(JJ)V

    .line 43
    .line 44
    .line 45
    invoke-direct {v3, v4, p2}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 46
    .line 47
    .line 48
    return-object v3
.end method
