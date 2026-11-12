.class public final Lsv8;
.super Lia2;
.source "SourceFile"

# interfaces
.implements Lpv8;


# instance fields
.field public final c:I


# direct methods
.method public constructor <init>(I)V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    iput p1, p0, Lsv8;->c:I

    return-void
.end method
