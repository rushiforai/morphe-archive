.class public Ll/fyb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:I


# direct methods
.method public constructor <init>(IIF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/fyb;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/fyb;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/fyb;->c:F

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(IIJI)V
    .locals 0

    long-to-float p3, p3

    .line 11
    invoke-direct {p0, p1, p2, p3}, Ll/fyb;-><init>(IIF)V

    .line 12
    iput p5, p0, Ll/fyb;->d:I

    return-void
.end method
