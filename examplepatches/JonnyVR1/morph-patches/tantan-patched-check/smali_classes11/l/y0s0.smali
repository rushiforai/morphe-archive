.class public final Ll/y0s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ll/ewr0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/vyr0;


# direct methods
.method public constructor <init>(Ll/vyr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y0s0;->b:Ll/vyr0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/y0s0;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final hasNext()Z
    .locals 1

    .line 1
    iget v0, p0, Ll/y0s0;->a:I

    .line 2
    .line 3
    iget-object p0, p0, Ll/y0s0;->b:Ll/vyr0;

    .line 4
    .line 5
    invoke-static {p0}, Ll/vyr0;->a(Ll/vyr0;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-ge v0, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic next()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Ll/y0s0;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/y0s0;->b:Ll/vyr0;

    .line 4
    .line 5
    invoke-static {v1}, Ll/vyr0;->a(Ll/vyr0;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    new-instance v0, Ll/vyr0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/y0s0;->b:Ll/vyr0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/vyr0;->a(Ll/vyr0;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p0, Ll/y0s0;->a:I

    .line 24
    .line 25
    add-int/lit8 v3, v2, 0x1

    .line 26
    .line 27
    iput v3, p0, Ll/y0s0;->a:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-direct {v0, p0}, Ll/vyr0;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_0
    invoke-static {}, Ll/mor;->a()V

    .line 42
    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    return-object p0
.end method
