.class public Ll/og3$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/og3;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/og3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/og3<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field public final d:I

.field public final e:I

.field public final f:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/og3$d;->d:I

    .line 5
    .line 6
    iput p2, p0, Ll/og3$d;->e:I

    .line 7
    .line 8
    sub-int/2addr p2, p1

    .line 9
    div-int/lit16 p2, p2, 0x3de

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ll/og3$d;->f:I

    .line 17
    .line 18
    return-void
.end method
