.class public abstract Le/e/a/vendor/lang3/CharUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic $r8$clinit:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v0, 0x80

    .line 38
    new-array v0, v0, [Ljava/lang/String;

    new-instance v1, Le/e/a/vendor/lang3/CharUtils$0;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 7175
    invoke-static {v0, v1}, Ljava/util/Arrays;->setAll([Ljava/lang/Object;Ljava/util/function/IntFunction;)V

    return-void
.end method

.method public static isHex(C)Z
    .registers 2

    .line 211
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-le p0, v0, :cond_2

    :cond_0
    const/16 v0, 0x61

    if-lt p0, v0, :cond_1

    const/16 v0, 0x66

    if-le p0, v0, :cond_2

    :cond_1
    const/16 v0, 0x41

    if-lt p0, v0, :cond_3

    const/16 v0, 0x46

    if-gt p0, v0, :cond_3

    :cond_2
    const/4 p0, 0x1

    return p0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method
