.class public final Lejb;
.super Lfjb;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 4

    const-string v0, "Notification type not supported"

    const/4 v1, 0x0

    const-string v2, "unsupported_type"

    invoke-direct {p0, v2, v0, v1}, Lfjb;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
