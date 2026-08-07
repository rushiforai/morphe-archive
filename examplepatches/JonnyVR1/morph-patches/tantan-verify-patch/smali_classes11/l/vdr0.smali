.class public final Ll/vdr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bgr0;


# instance fields
.field public final a:Ll/ydr0;

.field public final b:J

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J


# direct methods
.method public constructor <init>(Ll/ydr0;JJJJJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vdr0;->a:Ll/ydr0;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/vdr0;->b:J

    .line 7
    .line 8
    iput-wide p6, p0, Ll/vdr0;->c:J

    .line 9
    .line 10
    iput-wide p8, p0, Ll/vdr0;->d:J

    .line 11
    .line 12
    iput-wide p10, p0, Ll/vdr0;->e:J

    .line 13
    .line 14
    iput-wide p12, p0, Ll/vdr0;->f:J

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic c(Ll/vdr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vdr0;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic d(Ll/vdr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vdr0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic e(Ll/vdr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vdr0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static bridge synthetic f(Ll/vdr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vdr0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 13

    .line 1
    iget-object v0, p0, Ll/vdr0;->a:Ll/ydr0;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ll/ydr0;->zza(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iget-wide v5, p0, Ll/vdr0;->c:J

    .line 8
    .line 9
    iget-wide v7, p0, Ll/vdr0;->d:J

    .line 10
    .line 11
    iget-wide v9, p0, Ll/vdr0;->e:J

    .line 12
    .line 13
    iget-wide v11, p0, Ll/vdr0;->f:J

    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    invoke-static/range {v1 .. v12}, Ll/xdr0;->f(JJJJJJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    new-instance p0, Ll/zfr0;

    .line 22
    .line 23
    new-instance v2, Ll/cgr0;

    .line 24
    .line 25
    invoke-direct {v2, p1, p2, v0, v1}, Ll/cgr0;-><init>(JJ)V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0, v2, v2}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 29
    .line 30
    .line 31
    return-object p0
.end method

.method public final g(J)J
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vdr0;->a:Ll/ydr0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ydr0;->zza(J)J

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/vdr0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
