.class public final Ls59;
.super Lp10;
.source "SourceFile"


# instance fields
.field public final d:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 5

    const v0, 0x7f1404b8

    const/4 v1, 0x1

    const v2, 0x7f1404be

    invoke-direct {p0, v2, v0, v1}, Lp10;-><init>(IIB)V

    iput-boolean p1, p0, Ls59;->d:Z

    return-void
.end method


# virtual methods
.method public final c()Z
    .registers 1

    iget-boolean p0, p0, Ls59;->d:Z

    return p0
.end method
