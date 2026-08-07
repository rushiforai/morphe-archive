.class public Ll/agr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bgr0;


# instance fields
.field public final a:J

.field public final b:Ll/zfr0;


# direct methods
.method public constructor <init>(JJ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/agr0;->a:J

    .line 5
    .line 6
    const-wide/16 p1, 0x0

    .line 7
    .line 8
    cmp-long v0, p3, p1

    .line 9
    .line 10
    new-instance v1, Ll/zfr0;

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    sget-object p1, Ll/cgr0;->c:Ll/cgr0;

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v0, Ll/cgr0;

    .line 18
    .line 19
    invoke-direct {v0, p1, p2, p3, p4}, Ll/cgr0;-><init>(JJ)V

    .line 20
    .line 21
    .line 22
    move-object p1, v0

    .line 23
    :goto_0
    invoke-direct {v1, p1, p1}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/agr0;->b:Ll/zfr0;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/agr0;->b:Ll/zfr0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/agr0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
