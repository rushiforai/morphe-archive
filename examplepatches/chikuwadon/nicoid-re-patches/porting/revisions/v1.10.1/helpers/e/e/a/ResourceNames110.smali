.class public final Le/e/a/ResourceNames110;
.super Ljava/lang/Object;
.source "ResourceNames110.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static entry(Landroid/content/res/Resources;I)Ljava/lang/String;
    .registers 3

    .line 3
    const-string v0, ""

    if-gtz p1, :cond_5

    return-object v0

    :cond_5
    :try_start_5
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0
    :try_end_9
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5 .. :try_end_9} :catch_a

    return-object p0

    :catch_a
    move-exception p0

    return-object v0
.end method
