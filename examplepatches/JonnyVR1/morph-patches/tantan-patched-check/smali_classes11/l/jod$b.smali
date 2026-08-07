.class public final Ll/jod$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:I

.field public final b:J


# direct methods
.method public constructor <init>(IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/jod$b;->a:I

    .line 5
    .line 6
    iput-wide p2, p0, Ll/jod$b;->b:J

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(IJLl/jod$a;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Ll/jod$b;-><init>(IJ)V

    return-void
.end method

.method public static synthetic a(Ll/jod$b;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/jod$b;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic b(Ll/jod$b;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/jod$b;->a:I

    .line 2
    .line 3
    return p0
.end method
