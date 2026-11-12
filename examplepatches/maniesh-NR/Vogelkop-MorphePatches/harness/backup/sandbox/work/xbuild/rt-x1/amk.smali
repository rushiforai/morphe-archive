.class public final Lamk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lzsk;

.field public final b:Lnsh;

.field public final c:Lxlk;

.field public final d:F

.field public final e:F


# direct methods
.method public constructor <init>(Lzsk;Lnsh;Lxlk;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lamk;->a:Lzsk;

    iput-object p2, p0, Lamk;->b:Lnsh;

    iput-object p3, p0, Lamk;->c:Lxlk;

    iget-object p2, p3, Lxlk;->c:Lwlk;

    iget v0, p2, Lwlk;->d:F

    iget-byte p1, p1, Lzsk;->c:B

    int-to-float p1, p1

    div-float/2addr v0, p1

    iput v0, p0, Lamk;->d:F

    iget-object p1, p3, Lxlk;->b:Lwlk;

    if-nez p1, :cond_1c

    invoke-static {p2}, Lamk;->a(Lwlk;)F

    move-result p1

    goto :goto_28

    :cond_1c
    invoke-static {p2}, Lamk;->a(Lwlk;)F

    move-result p2

    invoke-static {p1}, Lamk;->a(Lwlk;)F

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    :goto_28
    iput p1, p0, Lamk;->e:F

    return-void
.end method

.method public static a(Lwlk;)F
    .registers 3

    iget-object v0, p0, Lwlk;->c:Lo9g;

    iget v1, v0, Lo9g;->a:I

    mul-int/lit8 v1, v1, 0xc

    iget v0, v0, Lo9g;->b:I

    add-int/2addr v1, v0

    if-gtz v1, :cond_f

    const p0, 0x7f7fffff    # Float.MAX_VALUE

    return p0

    :cond_f
    iget p0, p0, Lwlk;->d:F

    int-to-float v0, v1

    div-float/2addr p0, v0

    return p0
.end method
