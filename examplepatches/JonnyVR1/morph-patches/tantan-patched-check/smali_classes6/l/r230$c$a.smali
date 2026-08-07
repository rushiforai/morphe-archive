.class public Ll/r230$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lr0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r230$c;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r230$c;


# direct methods
.method public constructor <init>(Ll/r230$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r230$c$a;->a:Ll/r230$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;I)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/r230$c$a;->a:Ll/r230$c;

    .line 2
    .line 3
    iget-object p1, p1, Ll/r230$c;->c:Ll/r230;

    .line 4
    .line 5
    invoke-static {p1}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/r230$d;->t(Ll/r230$d;)Ll/x20;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/r230$c$a;->a:Ll/r230$c;

    .line 16
    .line 17
    iget-object p0, p0, Ll/r230$c;->c:Ll/r230;

    .line 18
    .line 19
    invoke-static {p0}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/r230$d;->t(Ll/r230$d;)Ll/x20;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public onAnimationStart(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/r230$c$a;->a:Ll/r230$c;

    .line 2
    .line 3
    iget-object p1, p1, Ll/r230$c;->c:Ll/r230;

    .line 4
    .line 5
    invoke-static {p1}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/r230$d;->u(Ll/r230$d;)Ll/x20;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/r230$c$a;->a:Ll/r230$c;

    .line 16
    .line 17
    iget-object p0, p0, Ll/r230$c;->c:Ll/r230;

    .line 18
    .line 19
    invoke-static {p0}, Ll/r230;->e(Ll/r230;)Ll/r230$d;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/r230$d;->u(Ll/r230$d;)Ll/x20;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
