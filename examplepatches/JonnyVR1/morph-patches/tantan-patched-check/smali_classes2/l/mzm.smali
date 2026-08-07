.class public final Ll/mzm;
.super Ll/y4e;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const-string v0, "image_manager_disk_cache"

    .line 2
    .line 3
    const-wide/32 v1, 0xfa00000

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, v0, v1, v2}, Ll/mzm;-><init>(Landroid/content/Context;Ljava/lang/String;J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 1

    .line 10
    new-instance v0, Ll/mzm$a;

    invoke-direct {v0, p1, p2}, Ll/mzm$a;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {p0, v0, p3, p4}, Ll/y4e;-><init>(Ll/y4e$a;J)V

    return-void
.end method
