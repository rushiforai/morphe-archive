.class public final Lm43;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laz;


# instance fields
.field public final a:Ldl;

.field public final b:Ljava/lang/String;

.field public final c:B

.field public final d:Ljava/util/List;


# direct methods
.method public constructor <init>(Ldl;Ljava/lang/String;ILjava/util/List;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm43;->a:Ldl;

    iput-object p2, p0, Lm43;->b:Ljava/lang/String;

    iput-byte p3, p0, Lm43;->c:B

    iput-object p4, p0, Lm43;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Ldl;
    .registers 1

    iget-object p0, p0, Lm43;->a:Ldl;

    return-object p0
.end method

.method public final b()Z
    .registers 1

    iget-byte p0, p0, Lm43;->c:B

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final c()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lm43;->d:Ljava/util/List;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lm43;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final e()Z
    .registers 2

    iget-byte p0, p0, Lm43;->c:B

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_7

    return v0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final f()Z
    .registers 1

    iget-byte p0, p0, Lm43;->c:B

    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
