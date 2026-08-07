.class public final Ll/g31$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g31;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "h"
.end annotation


# instance fields
.field public final a:I

.field public final b:J

.field public final c:I


# direct methods
.method public constructor <init>(IJI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/g31$h;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/g31$h;->b:J

    .line 7
    .line 8
    iput p4, p0, Ll/g31$h;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/g31$h;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/g31$h;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/g31$h;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/g31$h;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/g31$h;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/g31$h;->c:I

    .line 2
    .line 3
    return p0
.end method
