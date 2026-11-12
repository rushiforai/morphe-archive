.class public final Lgwa;
.super Ljava/lang/Exception;
.source "SourceFile"


# instance fields
.field public final a:B


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .registers 4

    invoke-direct {p0, p2, p3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-byte p1, p0, Lgwa;->a:B

    return-void
.end method
