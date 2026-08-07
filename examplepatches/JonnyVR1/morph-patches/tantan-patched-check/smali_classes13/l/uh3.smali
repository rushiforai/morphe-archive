.class public final Ll/uh3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0010\u0007\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0000\u00a2\u0006\u0004\u0008\u0005\u0010\u0006R\"\u0010\r\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0005\u0010\u0008\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\"\u0010\u0011\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u000e\u0010\u0008\u001a\u0004\u0008\u000f\u0010\n\"\u0004\u0008\u0010\u0010\u000cR\"\u0010\u0018\u001a\u00020\u00128\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0013\u0010\u0017R\"\u0010\u001b\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0019\u0010\u0008\u001a\u0004\u0008\u001a\u0010\n\"\u0004\u0008\u0019\u0010\u000cR\"\u0010\u001d\u001a\u00020\u00078\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0010\u0010\u0008\u001a\u0004\u0008\u001c\u0010\n\"\u0004\u0008\u000e\u0010\u000c\u00a8\u0006\u001e"
    }
    d2 = {
        "Ll/uh3;",
        "",
        "<init>",
        "()V",
        "Ll/del0;",
        "a",
        "()Ll/del0;",
        "",
        "I",
        "getWidth",
        "()I",
        "f",
        "(I)V",
        "width",
        "b",
        "getHeight",
        "e",
        "height",
        "",
        "c",
        "F",
        "getFactory",
        "()F",
        "(F)V",
        "factory",
        "d",
        "getFrameRate",
        "frameRate",
        "getBgColor",
        "bgColor",
        "android_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2d0

    .line 5
    .line 6
    iput v0, p0, Ll/uh3;->a:I

    .line 7
    .line 8
    const/16 v0, 0x500

    .line 9
    .line 10
    iput v0, p0, Ll/uh3;->b:I

    .line 11
    .line 12
    const/high16 v0, 0x3e800000    # 0.25f

    .line 13
    .line 14
    iput v0, p0, Ll/uh3;->c:F

    .line 15
    .line 16
    const/16 v0, 0x1e

    .line 17
    .line 18
    iput v0, p0, Ll/uh3;->d:I

    .line 19
    .line 20
    const/high16 v0, -0x1000000

    .line 21
    .line 22
    iput v0, p0, Ll/uh3;->e:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()Ll/del0;
    .locals 6
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/del0;

    .line 2
    .line 3
    iget v1, p0, Ll/uh3;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/uh3;->b:I

    .line 6
    .line 7
    iget v3, p0, Ll/uh3;->c:F

    .line 8
    .line 9
    iget v4, p0, Ll/uh3;->d:I

    .line 10
    .line 11
    iget v5, p0, Ll/uh3;->e:I

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Ll/del0;-><init>(IIFII)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public final b(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uh3;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public final c(F)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uh3;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public final d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uh3;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public final e(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uh3;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public final f(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/uh3;->a:I

    .line 2
    .line 3
    return-void
.end method
