.class public final Ll/qpd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nvl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00062\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ#\u0010\u000f\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u00042\u0008\u0010\u000e\u001a\u0004\u0018\u00010\rH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Ll/qpd;",
        "Ll/nvl;",
        "<init>",
        "()V",
        "",
        "imageUrl",
        "Landroid/widget/ImageView;",
        "imageView",
        "",
        "roundPx",
        "",
        "a",
        "(Ljava/lang/String;Landroid/widget/ImageView;I)V",
        "Ll/vim;",
        "callback",
        "b",
        "(Ljava/lang/String;Ll/vim;)V",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Landroid/widget/ImageView;I)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/widget/ImageView;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    invoke-static {p2}, Lcom/bumptech/glide/a;->u(Landroid/view/View;)Ll/m2d0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/m2d0;->h()Ll/a2d0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/gnd0;

    .line 12
    .line 13
    invoke-direct {v0, p3}, Ll/gnd0;-><init>(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/lr2;->j0(Ll/tgj0;)Ll/lr2;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/a2d0;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, p2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;Ll/vim;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ll/vim;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object p0, Ll/lv0;->a:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/m2d0;->f()Ll/a2d0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/qpd$a;

    .line 18
    .line 19
    invoke-direct {v0, p1, p2}, Ll/qpd$a;-><init>(Ljava/lang/String;Ll/vim;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/a2d0;->z0(Ll/l2d0;)Ll/a2d0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance p1, Ll/qpd$b;

    .line 27
    .line 28
    invoke-direct {p1}, Ll/qpd$b;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ll/a2d0;->u0(Ll/cli0;)Ll/cli0;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/qpd$b;

    .line 36
    .line 37
    :cond_0
    return-void
.end method
