.class public final Lmpk;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:I


# direct methods
.method public constructor <init>(I)V
    .registers 4

    sget-object v0, Lnpk;->a:Lnpk;

    const/16 v1, 0x14

    invoke-direct {p0, v0, v1}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput p1, p0, Lmpk;->c:I

    return-void
.end method
