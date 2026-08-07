.class public Ll/d2t;
.super Ll/hzq;
.source "SourceFile"


# instance fields
.field public d:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hzq;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/d2t;->d:I

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f()I
    .locals 1

    .line 1
    iget v0, p0, Ll/d2t;->d:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Ll/hzq;->f()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method
