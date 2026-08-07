.class public Ll/h5o0$a$a;
.super Ll/ye2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/h5o0$a;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:I

.field public final synthetic c:Ll/wp0;

.field public final synthetic d:Ll/h5o0$a;


# direct methods
.method public constructor <init>(Ll/h5o0$a;ILl/wp0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h5o0$a$a;->d:Ll/h5o0$a;

    .line 2
    .line 3
    iput p2, p0, Ll/h5o0$a$a;->b:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/h5o0$a$a;->c:Ll/wp0;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/ye2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/drawable/Drawable;I)V
    .locals 2
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget p1, p0, Ll/h5o0$a$a;->a:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/h5o0$a$a;->b:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-le v0, v1, :cond_1

    .line 9
    .line 10
    :cond_0
    if-gt p1, p2, :cond_1

    .line 11
    .line 12
    iput p2, p0, Ll/h5o0$a$a;->a:I

    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    iget-object p0, p0, Ll/h5o0$a$a;->c:Ll/wp0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/wp0;->stop()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onAnimationStart(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, -0x1

    .line 2
    iput p1, p0, Ll/h5o0$a$a;->a:I

    .line 3
    .line 4
    return-void
.end method
