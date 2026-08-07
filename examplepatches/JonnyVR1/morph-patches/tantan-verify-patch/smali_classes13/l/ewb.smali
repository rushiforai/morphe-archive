.class public Ll/ewb;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ewb$a;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Bitmap$CompressFormat;

.field public b:I

.field public c:I

.field public d:I

.field public e:Landroid/net/Uri;

.field public f:Z

.field public g:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ewb;->e:Landroid/net/Uri;

    .line 5
    .line 6
    sget-object p1, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 7
    .line 8
    iput-object p1, p0, Ll/ewb;->a:Landroid/graphics/Bitmap$CompressFormat;

    .line 9
    .line 10
    const/4 p1, -0x1

    .line 11
    iput p1, p0, Ll/ewb;->c:I

    .line 12
    .line 13
    iput p1, p0, Ll/ewb;->d:I

    .line 14
    .line 15
    const/16 p1, 0x5a

    .line 16
    .line 17
    iput p1, p0, Ll/ewb;->b:I

    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic a(Ll/ewb;Landroid/graphics/Bitmap$CompressFormat;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewb;->a:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public static bridge synthetic b(Ll/ewb;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ewb;->d:I

    return-void
.end method

.method public static bridge synthetic c(Ll/ewb;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ewb;->f:Z

    return-void
.end method

.method public static bridge synthetic d(Ll/ewb;Ll/qcj;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ewb;->g:Ll/qcj;

    return-void
.end method

.method public static bridge synthetic e(Ll/ewb;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ewb;->b:I

    return-void
.end method

.method public static bridge synthetic f(Ll/ewb;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/ewb;->c:I

    return-void
.end method


# virtual methods
.method public g()Landroid/graphics/Bitmap$CompressFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ewb;->a:Landroid/graphics/Bitmap$CompressFormat;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ewb;->e:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ewb;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public j(Landroid/graphics/Bitmap;)I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ewb;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/ewb;->g:Ll/qcj;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget p0, p0, Ll/ewb;->b:I

    .line 21
    .line 22
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Ll/ewb;->c:I

    .line 2
    .line 3
    return p0
.end method
