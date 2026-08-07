.class public Ll/yox0;
.super Ll/bpx0;
.source "SourceFile"

# interfaces
.implements Ll/fyr0;


# instance fields
.field public i:Ll/gyr0;

.field public final j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bpx0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string p1, "moov"

    .line 5
    .line 6
    iput-object p1, p0, Ll/yox0;->j:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b(Ll/cpx0;Ljava/nio/ByteBuffer;JLl/cyr0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/nio/Buffer;->remaining()I

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/bpx0;->b:Ll/cpx0;

    .line 11
    .line 12
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    iput-wide v0, p0, Ll/bpx0;->d:J

    .line 17
    .line 18
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    add-long/2addr v0, p3

    .line 23
    invoke-interface {p1, v0, v1}, Ll/cpx0;->l(J)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ll/cpx0;->zzb()J

    .line 27
    .line 28
    .line 29
    move-result-wide p1

    .line 30
    iput-wide p1, p0, Ll/bpx0;->e:J

    .line 31
    .line 32
    iput-object p5, p0, Ll/bpx0;->a:Ll/cyr0;

    .line 33
    .line 34
    return-void
.end method

.method public final d(Ll/gyr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yox0;->i:Ll/gyr0;

    .line 2
    .line 3
    return-void
.end method

.method public final zza()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yox0;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
