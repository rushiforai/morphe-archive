.class public abstract Ll/ypf0;
.super Ll/xr2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ll/xr2<",
        "TZ;>;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final b:I

.field private final c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/high16 v0, -0x80000000

    .line 9
    invoke-direct {p0, v0, v0}, Ll/ypf0;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xr2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Ll/ypf0;->b:I

    .line 5
    .line 6
    iput p2, p0, Ll/ypf0;->c:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ll/hrf0;)V
    .locals 0
    .param p1    # Ll/hrf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final k(Ll/hrf0;)V
    .locals 3
    .param p1    # Ll/hrf0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Ll/ypf0;->b:I

    .line 2
    .line 3
    iget v1, p0, Ll/ypf0;->c:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ylk0;->u(II)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Ll/ypf0;->b:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget p0, p0, Ll/ypf0;->c:I

    .line 14
    .line 15
    invoke-interface {p1, v1, p0}, Ll/hrf0;->d(II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget p0, p0, Ll/ypf0;->c:I

    .line 20
    .line 21
    const-string p1, ", either provide dimensions in the constructor or call override()"

    .line 22
    .line 23
    const-string v0, "Width and height must both be > 0 or Target#SIZE_ORIGINAL, but given width: "

    .line 24
    .line 25
    const-string v2, " and height: "

    .line 26
    .line 27
    invoke-static {v0, v1, v2, p0, p1}, Ll/cmq;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
