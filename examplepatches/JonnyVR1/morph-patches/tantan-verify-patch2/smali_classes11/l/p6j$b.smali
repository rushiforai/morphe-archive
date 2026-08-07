.class public final Ll/p6j$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/p6j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:J


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/p6j$b;->a:I

    .line 5
    .line 6
    iput p2, p0, Ll/p6j$b;->b:I

    .line 7
    .line 8
    const/high16 p1, 0x3f800000    # 1.0f

    .line 9
    .line 10
    iput p1, p0, Ll/p6j$b;->c:F

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ll/p6j;
    .locals 7

    .line 1
    new-instance v0, Ll/p6j;

    .line 2
    .line 3
    iget v1, p0, Ll/p6j$b;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/p6j$b;->b:I

    .line 6
    .line 7
    iget v3, p0, Ll/p6j$b;->c:F

    .line 8
    .line 9
    iget-wide v4, p0, Ll/p6j$b;->d:J

    .line 10
    .line 11
    const/4 v6, 0x0

    .line 12
    invoke-direct/range {v0 .. v6}, Ll/p6j;-><init>(IIFJLl/p6j$a;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public b(F)Ll/p6j$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/p6j$b;->c:F

    .line 2
    .line 3
    return-object p0
.end method
