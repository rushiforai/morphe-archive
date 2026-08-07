.class public final Ll/o4l$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/o4l;->B()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000#\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J-\u0010\t\u001a\u00020\u00082\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "l/o4l$a",
        "Ll/fn2;",
        "",
        "id",
        "Ll/qim;",
        "imageInfo",
        "Landroid/graphics/drawable/Animatable;",
        "animatable",
        "",
        "h",
        "(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V",
        "external_intlGmsRelease"
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
.field public final synthetic a:Ll/o4l;


# direct methods
.method public constructor <init>(Ll/o4l;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/o4l$a;->a:Ll/o4l;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static j(Ll/o4l;II)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/o4l;->p(Ll/o4l;)Lv/VDraweeView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float p1, p1

    .line 10
    int-to-float p2, p2

    .line 11
    div-float/2addr p1, p2

    .line 12
    int-to-float p2, v0

    .line 13
    mul-float/2addr p1, p2

    .line 14
    float-to-int p1, p1

    .line 15
    invoke-static {p0}, Ll/o4l;->p(Ll/o4l;)Lv/VDraweeView;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 24
    .line 25
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o4l;->p(Ll/o4l;)Lv/VDraweeView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget-object p3, p0, Ll/o4l$a;->a:Ll/o4l;

    .line 16
    .line 17
    invoke-static {p3}, Ll/o4l;->p(Ll/o4l;)Lv/VDraweeView;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    iget-object p0, p0, Ll/o4l$a;->a:Ll/o4l;

    .line 22
    .line 23
    new-instance v0, Ll/n4l;

    .line 24
    .line 25
    invoke-direct {v0, p0, p1, p2}, Ll/n4l;-><init>(Ll/o4l;II)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p3, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method
