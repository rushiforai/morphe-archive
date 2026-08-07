.class public final Ll/fmr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cmr0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:I

.field public final c:I

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(Ll/ylr0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/ylr0;->b:Ll/bgw0;

    .line 5
    .line 6
    iput-object p1, p0, Ll/fmr0;->a:Ll/bgw0;

    .line 7
    .line 8
    const/16 v0, 0xc

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/bgw0;->k(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/bgw0;->E()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    and-int/lit16 v0, v0, 0xff

    .line 18
    .line 19
    iput v0, p0, Ll/fmr0;->c:I

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/bgw0;->E()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Ll/fmr0;->b:I

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public final zza()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public final zzb()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fmr0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final zzc()I
    .locals 2

    .line 1
    iget v0, p0, Ll/fmr0;->c:I

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/fmr0;->a:Ll/bgw0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/16 v1, 0x10

    .line 15
    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/fmr0;->a:Ll/bgw0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    iget v0, p0, Ll/fmr0;->d:I

    .line 26
    .line 27
    add-int/lit8 v1, v0, 0x1

    .line 28
    .line 29
    iput v1, p0, Ll/fmr0;->d:I

    .line 30
    .line 31
    rem-int/lit8 v0, v0, 0x2

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/fmr0;->a:Ll/bgw0;

    .line 36
    .line 37
    invoke-virtual {v0}, Ll/bgw0;->B()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/fmr0;->e:I

    .line 42
    .line 43
    and-int/lit16 p0, v0, 0xf0

    .line 44
    .line 45
    shr-int/lit8 p0, p0, 0x4

    .line 46
    .line 47
    return p0

    .line 48
    :cond_2
    iget p0, p0, Ll/fmr0;->e:I

    .line 49
    .line 50
    and-int/lit8 p0, p0, 0xf

    .line 51
    .line 52
    return p0
.end method
