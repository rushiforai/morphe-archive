.class public final Ll/g31$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g31$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g31;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "f"
.end annotation


# instance fields
.field public final a:I

.field public final b:I

.field public final c:Ll/ig60;


# direct methods
.method public constructor <init>(Ll/f31$b;Lcom/google/android/exoplayer2/k;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/f31$b;->b:Ll/ig60;

    .line 5
    .line 6
    iput-object p1, p0, Ll/g31$f;->c:Ll/ig60;

    .line 7
    .line 8
    const/16 v0, 0xc

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/ig60;->U(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/ig60;->L()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "audio/raw"

    .line 18
    .line 19
    iget-object v2, p2, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    iget v1, p2, Lcom/google/android/exoplayer2/k;->A:I

    .line 28
    .line 29
    iget p2, p2, Lcom/google/android/exoplayer2/k;->y:I

    .line 30
    .line 31
    invoke-static {v1, p2}, Ll/bmk0;->h0(II)I

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    rem-int v1, v0, p2

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "Audio sample size mismatch. stsd sample size: "

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, ", stsz sample size: "

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "AtomParsers"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    move v0, p2

    .line 69
    :cond_1
    if-nez v0, :cond_2

    .line 70
    .line 71
    const/4 v0, -0x1

    .line 72
    :cond_2
    iput v0, p0, Ll/g31$f;->a:I

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/ig60;->L()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iput p1, p0, Ll/g31$f;->b:I

    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public a()I
    .locals 2

    .line 1
    iget v0, p0, Ll/g31$f;->a:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/g31$f;->c:Ll/ig60;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ig60;->L()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g31$f;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/g31$f;->a:I

    .line 2
    .line 3
    return p0
.end method
