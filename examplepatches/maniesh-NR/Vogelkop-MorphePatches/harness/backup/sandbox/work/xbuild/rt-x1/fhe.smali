.class public final Lfhe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:B

.field public final c:I


# direct methods
.method public constructor <init>(III)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lfhe;->a:I

    iput-byte p2, p0, Lfhe;->b:B

    iput p3, p0, Lfhe;->c:I

    return-void
.end method
