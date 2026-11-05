.class public final Le/e/a/RefreshNotice199;
.super Ljava/lang/Object;
.source "RefreshNotice199.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static partial(Landroid/widget/Toast;)V
    .registers 2

    .line 7
    const-string p0, "nicoid-refresh"

    const-string v0, "Partial statistics refresh unavailable; retained existing row data"

    invoke-static {p0, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
