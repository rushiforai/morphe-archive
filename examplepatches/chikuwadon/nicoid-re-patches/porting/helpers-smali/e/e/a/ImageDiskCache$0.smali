.class public final synthetic Le/e/a/ImageDiskCache$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/ImageDiskCache;"
    method = "lambda$trim$0"
    proto = "(Ljava/io/File;Ljava/lang/String;)Z"
.end annotation


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 3

    .line 0
    invoke-static {p1, p2}, Le/e/a/ImageDiskCache;->lambda$trim$0(Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
