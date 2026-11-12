.class public final Lphg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Legd;

.field public final b:Lvjd;

.field public final c:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Legd;Lvjd;Landroid/graphics/Bitmap;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lphg;->a:Legd;

    iput-object p2, p0, Lphg;->b:Lvjd;

    iput-object p3, p0, Lphg;->c:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    const-class v1, Lphg;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const/4 p0, 0x0

    return p0

    :cond_16
    check-cast p1, Lphg;

    iget-object p0, p0, Lphg;->a:Legd;

    iget-object p1, p1, Lphg;->a:Legd;

    invoke-virtual {p0, p1}, Legd;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lphg;->a:Legd;

    invoke-virtual {p0}, Legd;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
