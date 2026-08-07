.class public Ll/pxq0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public static a(Landroid/content/Context;)Ljava/io/File;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    const-string p0, "ERROR: Context cannot be null."

    .line 5
    .line 6
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    const-string p0, "ERROR: XMSF not configure the instance of LogAgent."

    .line 11
    .line 12
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method
