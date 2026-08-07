.class public final Ll/mri$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mri;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:[J

.field public final b:[I

.field public final c:I

.field public final d:[J

.field public final e:[I

.field public final f:J


# direct methods
.method public constructor <init>([J[II[J[IJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mri$b;->a:[J

    .line 5
    .line 6
    iput-object p2, p0, Ll/mri$b;->b:[I

    .line 7
    .line 8
    iput p3, p0, Ll/mri$b;->c:I

    .line 9
    .line 10
    iput-object p4, p0, Ll/mri$b;->d:[J

    .line 11
    .line 12
    iput-object p5, p0, Ll/mri$b;->e:[I

    .line 13
    .line 14
    iput-wide p6, p0, Ll/mri$b;->f:J

    .line 15
    .line 16
    return-void
.end method

.method public synthetic constructor <init>([J[II[J[IJLl/mri$a;)V
    .locals 0

    .line 17
    invoke-direct/range {p0 .. p7}, Ll/mri$b;-><init>([J[II[J[IJ)V

    return-void
.end method
