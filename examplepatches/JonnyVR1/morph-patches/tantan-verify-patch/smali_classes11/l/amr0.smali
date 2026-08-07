.class public final Ll/amr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:I

.field public c:I

.field public d:J

.field public final e:Z

.field public final f:Ll/bgw0;

.field public final g:Ll/bgw0;

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Ll/bgw0;Ll/bgw0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/amr0;->g:Ll/bgw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/amr0;->f:Ll/bgw0;

    .line 7
    .line 8
    iput-boolean p3, p0, Ll/amr0;->e:Z

    .line 9
    .line 10
    const/16 p3, 0xc

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Ll/bgw0;->k(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/bgw0;->E()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Ll/amr0;->a:I

    .line 20
    .line 21
    invoke-virtual {p1, p3}, Ll/bgw0;->k(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ll/bgw0;->E()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Ll/amr0;->i:I

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/bgw0;->v()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 p2, 0x1

    .line 35
    if-ne p1, p2, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 p2, 0x0

    .line 39
    :goto_0
    const-string p1, "first_chunk must be 1"

    .line 40
    .line 41
    invoke-static {p2, p1}, Ll/ter0;->b(ZLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    const/4 p1, -0x1

    .line 45
    iput p1, p0, Ll/amr0;->b:I

    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public final a()Z
    .locals 4

    .line 1
    iget v0, p0, Ll/amr0;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Ll/amr0;->b:I

    .line 6
    .line 7
    iget v2, p0, Ll/amr0;->a:I

    .line 8
    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-boolean v0, p0, Ll/amr0;->e:Z

    .line 14
    .line 15
    iget-object v2, p0, Ll/amr0;->f:Ll/bgw0;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/bgw0;->K()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-virtual {v2}, Ll/bgw0;->J()J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    :goto_0
    iput-wide v2, p0, Ll/amr0;->d:J

    .line 29
    .line 30
    iget v0, p0, Ll/amr0;->b:I

    .line 31
    .line 32
    iget v2, p0, Ll/amr0;->h:I

    .line 33
    .line 34
    if-ne v0, v2, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Ll/amr0;->g:Ll/bgw0;

    .line 37
    .line 38
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/amr0;->c:I

    .line 43
    .line 44
    iget-object v0, p0, Ll/amr0;->g:Ll/bgw0;

    .line 45
    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-virtual {v0, v2}, Ll/bgw0;->l(I)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Ll/amr0;->i:I

    .line 51
    .line 52
    const/4 v2, -0x1

    .line 53
    add-int/2addr v0, v2

    .line 54
    iput v0, p0, Ll/amr0;->i:I

    .line 55
    .line 56
    if-lez v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Ll/amr0;->g:Ll/bgw0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/bgw0;->E()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr v2, v0

    .line 65
    :cond_2
    iput v2, p0, Ll/amr0;->h:I

    .line 66
    .line 67
    :cond_3
    return v1
.end method
