.class public Ll/smd0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/smd0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:F

.field public c:I

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>(IFI)V
    .locals 1

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, p2, p3, v0}, Ll/smd0$a;-><init>(IFIZ)V

    return-void
.end method

.method public constructor <init>(IFIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/smd0$a;->e:I

    .line 6
    .line 7
    iput p1, p0, Ll/smd0$a;->a:I

    .line 8
    .line 9
    iput p2, p0, Ll/smd0$a;->b:F

    .line 10
    .line 11
    iput p3, p0, Ll/smd0$a;->c:I

    .line 12
    .line 13
    iput-boolean p4, p0, Ll/smd0$a;->d:Z

    .line 14
    .line 15
    return-void
.end method
