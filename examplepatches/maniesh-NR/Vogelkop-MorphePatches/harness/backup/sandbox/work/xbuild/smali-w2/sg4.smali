.class public final Lsg4;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(ILjava/lang/RuntimeException;)V
    .registers 4

    const-string v0, "Expected camera missing from device."

    invoke-direct {p0, v0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput p1, p0, Lsg4;->a:I

    return-void
.end method
