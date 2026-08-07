.class public final Ll/trs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final i:Ll/trs0;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ljava/lang/String;

.field public static final m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;

.field public static final o:Ljava/lang/String;

.field public static final p:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/zis0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Ll/zis0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final d:Ll/jfs0;

.field public final e:Ll/rzs0;

.field public final f:Ll/e2s0;

.field public final g:Ll/t4s0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final h:Ll/xms0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/lxr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lxr0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lxr0;->c()Ll/trs0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/trs0;->i:Ll/trs0;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    const/16 v1, 0x24

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/trs0;->j:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Ll/trs0;->k:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/trs0;->l:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    sput-object v0, Ll/trs0;->m:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v0, 0x4

    .line 43
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Ll/trs0;->n:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v0, 0x5

    .line 50
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/trs0;->o:Ljava/lang/String;

    .line 55
    .line 56
    sget-object v0, Ll/otr0;->a:Ll/otr0;

    .line 57
    .line 58
    sput-object v0, Ll/trs0;->p:Ll/mhy0;

    .line 59
    .line 60
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ll/t4s0;Ll/zis0;Ll/jfs0;Ll/rzs0;Ll/xms0;Ll/wqs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/trs0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Ll/trs0;->b:Ll/zis0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/trs0;->c:Ll/zis0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/trs0;->d:Ll/jfs0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/trs0;->e:Ll/rzs0;

    .line 13
    .line 14
    iput-object p2, p0, Ll/trs0;->f:Ll/e2s0;

    .line 15
    .line 16
    iput-object p2, p0, Ll/trs0;->g:Ll/t4s0;

    .line 17
    .line 18
    iput-object p6, p0, Ll/trs0;->h:Ll/xms0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/trs0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/trs0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/trs0;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Ll/trs0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/trs0;->f:Ll/e2s0;

    .line 24
    .line 25
    iget-object v3, p1, Ll/trs0;->f:Ll/e2s0;

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Ll/e2s0;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Ll/trs0;->b:Ll/zis0;

    .line 34
    .line 35
    iget-object v3, p1, Ll/trs0;->b:Ll/zis0;

    .line 36
    .line 37
    invoke-static {v1, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Ll/trs0;->d:Ll/jfs0;

    .line 44
    .line 45
    iget-object v3, p1, Ll/trs0;->d:Ll/jfs0;

    .line 46
    .line 47
    invoke-static {v1, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Ll/trs0;->e:Ll/rzs0;

    .line 54
    .line 55
    iget-object v3, p1, Ll/trs0;->e:Ll/rzs0;

    .line 56
    .line 57
    invoke-static {v1, v3}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Ll/trs0;->h:Ll/xms0;

    .line 64
    .line 65
    iget-object p1, p1, Ll/trs0;->h:Ll/xms0;

    .line 66
    .line 67
    invoke-static {p0, p1}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/trs0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object v1, p0, Ll/trs0;->b:Ll/zis0;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/zis0;->hashCode()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v1, 0x0

    .line 19
    :goto_0
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x1f

    .line 21
    .line 22
    iget-object v1, p0, Ll/trs0;->d:Ll/jfs0;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/jfs0;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x1f

    .line 30
    .line 31
    iget-object v1, p0, Ll/trs0;->f:Ll/e2s0;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/e2s0;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x1f

    .line 39
    .line 40
    iget-object p0, p0, Ll/trs0;->e:Ll/rzs0;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/rzs0;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    add-int/2addr v0, p0

    .line 47
    mul-int/lit8 v0, v0, 0x1f

    .line 48
    .line 49
    return v0
.end method
