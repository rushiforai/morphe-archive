.class public Ll/qu6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:I = -0x1

.field public static d:I = 0x0

.field public static e:I = 0x1


# instance fields
.field public a:I

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qu6;->c:I

    .line 5
    .line 6
    iput v0, p0, Ll/qu6;->a:I

    .line 7
    .line 8
    iput v0, p0, Ll/qu6;->b:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/qu6;->a:I

    .line 2
    .line 3
    sget v1, Ll/qu6;->c:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/t$a;->O()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    sget v0, Ll/qu6;->e:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget v0, Ll/qu6;->d:I

    .line 23
    .line 24
    :goto_0
    iput v0, p0, Ll/qu6;->a:I

    .line 25
    .line 26
    :cond_1
    iget p0, p0, Ll/qu6;->a:I

    .line 27
    .line 28
    sget v0, Ll/qu6;->e:I

    .line 29
    .line 30
    if-ne p0, v0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_2
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public b()Z
    .locals 2

    .line 1
    iget v0, p0, Ll/qu6;->b:I

    .line 2
    .line 3
    sget v1, Ll/qu6;->c:I

    .line 4
    .line 5
    if-ne v0, v1, :cond_4

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Ll/joa;->P3()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/qu6;->e:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v0, Ll/qu6;->d:I

    .line 27
    .line 28
    :goto_0
    iput v0, p0, Ll/qu6;->b:I

    .line 29
    .line 30
    goto :goto_3

    .line 31
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/16 v1, 0x16

    .line 38
    .line 39
    if-le v0, v1, :cond_3

    .line 40
    .line 41
    invoke-static {}, Ll/joa;->P3()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_2
    sget v0, Ll/qu6;->d:I

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_3
    :goto_1
    sget v0, Ll/qu6;->e:I

    .line 52
    .line 53
    :goto_2
    iput v0, p0, Ll/qu6;->b:I

    .line 54
    .line 55
    :cond_4
    :goto_3
    iget p0, p0, Ll/qu6;->b:I

    .line 56
    .line 57
    sget v0, Ll/qu6;->e:I

    .line 58
    .line 59
    if-ne p0, v0, :cond_5

    .line 60
    .line 61
    const/4 p0, 0x1

    .line 62
    return p0

    .line 63
    :cond_5
    const/4 p0, 0x0

    .line 64
    return p0
.end method
