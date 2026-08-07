.class public final Ll/vp1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sp1;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(IIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/vp1;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/vp1;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/vp1;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/vp1;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/vp1;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/vp1;->f:I

    .line 15
    .line 16
    return-void
.end method

.method public static c(Ll/ig60;)Ll/vp1;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    invoke-virtual {p0}, Ll/ig60;->u()I

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/ig60;->V(I)V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/vp1;

    .line 40
    .line 41
    invoke-direct/range {v0 .. v6}, Ll/vp1;-><init>(IIIIII)V

    .line 42
    .line 43
    .line 44
    return-object v0
.end method


# virtual methods
.method public a()J
    .locals 7

    .line 1
    iget v0, p0, Ll/vp1;->e:I

    .line 2
    .line 3
    int-to-long v1, v0

    .line 4
    iget v0, p0, Ll/vp1;->c:I

    .line 5
    .line 6
    int-to-long v3, v0

    .line 7
    const-wide/32 v5, 0xf4240

    .line 8
    .line 9
    .line 10
    mul-long/2addr v3, v5

    .line 11
    iget p0, p0, Ll/vp1;->d:I

    .line 12
    .line 13
    int-to-long v5, p0

    .line 14
    invoke-static/range {v1 .. v6}, Ll/bmk0;->W0(JJJ)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    return-wide v0
.end method

.method public b()I
    .locals 2

    .line 1
    iget v0, p0, Ll/vp1;->a:I

    .line 2
    .line 3
    const v1, 0x73646976

    .line 4
    .line 5
    .line 6
    if-eq v0, v1, :cond_2

    .line 7
    .line 8
    const v1, 0x73647561

    .line 9
    .line 10
    .line 11
    if-eq v0, v1, :cond_1

    .line 12
    .line 13
    const v1, 0x73747874

    .line 14
    .line 15
    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v1, "Found unsupported streamType fourCC: "

    .line 21
    .line 22
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget p0, p0, Ll/vp1;->a:I

    .line 26
    .line 27
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v0, "AviStreamHeaderChunk"

    .line 39
    .line 40
    invoke-static {v0, p0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, -0x1

    .line 44
    return p0

    .line 45
    :cond_0
    const/4 p0, 0x3

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0

    .line 49
    :cond_2
    const/4 p0, 0x2

    .line 50
    return p0
.end method

.method public getType()I
    .locals 0

    .line 1
    const p0, 0x68727473

    .line 2
    .line 3
    .line 4
    return p0
.end method
