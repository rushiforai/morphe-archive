.class public Landroidx/recyclerview/widget/g$h;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/recyclerview/widget/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Landroidx/recyclerview/widget/g$h;->a:I

    .line 5
    .line 6
    iput p2, p0, Landroidx/recyclerview/widget/g$h;->b:I

    .line 7
    .line 8
    iput p3, p0, Landroidx/recyclerview/widget/g$h;->c:I

    .line 9
    .line 10
    iput p4, p0, Landroidx/recyclerview/widget/g$h;->d:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/g$h;->d:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/g$h;->c:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method

.method public b()I
    .locals 1

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/g$h;->b:I

    .line 2
    .line 3
    iget p0, p0, Landroidx/recyclerview/widget/g$h;->a:I

    .line 4
    .line 5
    sub-int/2addr v0, p0

    .line 6
    return v0
.end method
