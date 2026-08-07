.class public Lcom/momo/xeengine/XEngineException;
.super Ljava/lang/Exception;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field public static final CONTEXT_NOT_SET:Ljava/lang/String; = "\u5f15\u64ce\u5168\u5c40\u4e0a\u4e0b\u6587\u672a\u8bbe\u7f6e"

.field public static final LIBRARY_LOAD_ERROR:Ljava/lang/String; = "\u5f15\u64ce\u52a8\u6001\u5e93\u52a0\u8f7d\u9519\u8bef"

.field public static final LIBRARY_VERSION_ERROR:Ljava/lang/String; = "\u5f15\u64ce\u52a8\u6001\u5e93\u7248\u672c\u9519\u8bef"

.field public static final UNKNOWN_ERROR:Ljava/lang/String; = "\u672a\u77e5\u5f02\u5e38"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .locals 0

    .line 6
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    return-void
.end method
