.class public Ll/iq0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/by3;


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Ll/by3;

.field public final b:I


# direct methods
.method public constructor <init>(Ll/by3;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iq0$b;->a:Ll/by3;

    .line 5
    .line 6
    iput p2, p0, Ll/iq0$b;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c(Landroid/net/Uri;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iq0$b;->a:Ll/by3;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/by3;->c(Landroid/net/Uri;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/iq0$b;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    check-cast p1, Ll/iq0$b;

    .line 11
    .line 12
    iget v1, p0, Ll/iq0$b;->b:I

    .line 13
    .line 14
    iget v3, p1, Ll/iq0$b;->b:I

    .line 15
    .line 16
    if-ne v1, v3, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/iq0$b;->a:Ll/by3;

    .line 19
    .line 20
    iget-object p1, p1, Ll/iq0$b;->a:Ll/by3;

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ll/by3;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    return v0

    .line 29
    :cond_1
    return v2
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq0$b;->a:Ll/by3;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/by3;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit16 v0, v0, 0x3f5

    .line 8
    .line 9
    iget p0, p0, Ll/iq0$b;->b:I

    .line 10
    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Ll/i950;->b(Ljava/lang/Object;)Ll/i950$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "imageCacheKey"

    .line 6
    .line 7
    iget-object v2, p0, Ll/iq0$b;->a:Ll/by3;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/i950$a;->b(Ljava/lang/String;Ljava/lang/Object;)Ll/i950$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "frameIndex"

    .line 14
    .line 15
    iget p0, p0, Ll/iq0$b;->b:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, p0}, Ll/i950$a;->a(Ljava/lang/String;I)Ll/i950$a;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/i950$a;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
