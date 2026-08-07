.class public Ll/r230$c;
.super Ll/li2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r230;->D(Lcom/facebook/drawee/view/SimpleDraweeView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/li2<",
        "Ll/qim;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic b:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public final synthetic c:Ll/r230;


# direct methods
.method public constructor <init>(Ll/r230;Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$c;->c:Ll/r230;

    .line 2
    .line 3
    iput-object p2, p0, Ll/r230$c;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/li2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic e(Ljava/lang/String;Ljava/lang/Object;Landroid/graphics/drawable/Animatable;)V
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    check-cast p2, Ll/qim;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/r230$c;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 7
    .param p2    # Ll/qim;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/drawable/Animatable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of p1, p3, Ll/wp0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-string p1, "AnimLiveImage"

    .line 6
    .line 7
    const-string v0, "anim webp"

    .line 8
    .line 9
    invoke-static {p1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    check-cast p3, Ll/wp0;

    .line 13
    .line 14
    new-instance p1, Ll/r230$i;

    .line 15
    .line 16
    invoke-virtual {p3}, Ll/wp0;->d()Ll/yq0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/r230$c;->c:Ll/r230;

    .line 21
    .line 22
    invoke-static {v1}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v1}, Ll/r230$d;->s(Ll/r230$d;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-direct {p1, v0, v1}, Ll/r230$i;-><init>(Ll/yq0;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p3, p1}, Ll/wp0;->i(Ll/yq0;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ll/r230$c$a;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Ll/r230$c$a;-><init>(Ll/r230$c;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p3, p1}, Ll/wp0;->j(Ll/lr0;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Ll/r230$c;->c:Ll/r230;

    .line 45
    .line 46
    iget-object v2, p0, Ll/r230$c;->b:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 47
    .line 48
    invoke-static {v0}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object v4, p1, Ll/r230$f;->b:Ljava/lang/String;

    .line 53
    .line 54
    iget-object p0, p0, Ll/r230$c;->c:Ll/r230;

    .line 55
    .line 56
    invoke-static {p0}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    iget-object v5, p0, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 61
    .line 62
    const/4 v6, 0x0

    .line 63
    const-string v1, "anim"

    .line 64
    .line 65
    move-object v3, p2

    .line 66
    invoke-static/range {v0 .. v6}, Ll/r230;->l(Ll/r230;Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/qim;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
