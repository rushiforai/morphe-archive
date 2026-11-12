.class public final Lfn5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgn5;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lfn5;->a:I

    return-void
.end method


# virtual methods
.method public final getId()J
    .registers 5

    iget p0, p0, Lfn5;->a:I

    int-to-long v0, p0

    const-wide v2, 0x100000000L

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public final getType()I
    .registers 1

    const/4 p0, 0x3

    return p0
.end method
