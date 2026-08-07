.class public final Ll/nf60;
.super Ll/q5c;
.source "SourceFile"


# instance fields
.field public final c:Ll/joi;

.field public d:I


# direct methods
.method public constructor <init>(IILl/joi;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/q5c;-><init>(II)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/nf60;->c:Ll/joi;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/nf60;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ll/joi;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nf60;->c:Ll/joi;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()V
    .locals 1

    .line 1
    iget v0, p0, Ll/nf60;->d:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p0, Ll/nf60;->d:I

    .line 6
    .line 7
    return-void
.end method
