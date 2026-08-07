.class public final Ll/rkr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public synthetic constructor <init>(IJLl/qkr0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/rkr0;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/rkr0;->b:J

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic a(Ll/rkr0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/rkr0;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic b(Ll/rkr0;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/rkr0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method
