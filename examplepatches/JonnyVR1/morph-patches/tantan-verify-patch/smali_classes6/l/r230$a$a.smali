.class public Ll/r230$a$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r230$a;->a(Ll/q3d0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/fn2;

.field public final synthetic b:Ll/r230$a;


# direct methods
.method public constructor <init>(Ll/r230$a;Ll/fn2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$a$a;->b:Ll/r230$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/r230$a$a;->a:Ll/fn2;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/r230$a$a;->a:Ll/fn2;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    instance-of p1, p3, Ll/wp0;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const-string p1, "AnimLiveImage"

    .line 16
    .line 17
    const-string p3, "normal use anim webp"

    .line 18
    .line 19
    invoke-static {p1, p3}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-object p1, p0, Ll/r230$a$a;->b:Ll/r230$a;

    .line 23
    .line 24
    iget-object v0, p1, Ll/r230$a;->b:Ll/r230;

    .line 25
    .line 26
    iget-object v2, p1, Ll/r230$a;->a:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 27
    .line 28
    invoke-static {v0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v4, p1, Ll/r230$f;->b:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p1, p0, Ll/r230$a$a;->b:Ll/r230$a;

    .line 35
    .line 36
    iget-object p1, p1, Ll/r230$a;->b:Ll/r230;

    .line 37
    .line 38
    invoke-static {p1}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object v5, p1, Ll/r230$f;->c:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 43
    .line 44
    iget-object p0, p0, Ll/r230$a$a;->b:Ll/r230$a;

    .line 45
    .line 46
    iget-object p0, p0, Ll/r230$a;->b:Ll/r230;

    .line 47
    .line 48
    invoke-static {p0}, Ll/r230;->f(Ll/r230;)Ll/r230$j;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/r230$j;->f(Ll/r230$j;)Z

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    const-string v1, "normal"

    .line 57
    .line 58
    move-object v3, p2

    .line 59
    invoke-static/range {v0 .. v6}, Ll/r230;->l(Ll/r230;Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ll/qim;Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture$ImageUri;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
