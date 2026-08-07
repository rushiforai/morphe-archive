.class public Lv/VImage;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"

# interfaces
.implements Ll/hs40$a;


# instance fields
.field public final c:Ll/hs40;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/hs40;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lv/VImage;->c:Ll/hs40;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/hs40;

    invoke-direct {p1, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object p1, p0, Lv/VImage;->c:Ll/hs40;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/hs40;

    invoke-direct {p1, p0}, Ll/hs40;-><init>(Ll/hs40$a;)V

    iput-object p1, p0, Lv/VImage;->c:Ll/hs40;

    return-void
.end method

.method public static synthetic d(Lv/VImage;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/VImage;->g()V

    return-void
.end method

.method public static synthetic f()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public c(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p1

    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/pyk0;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/pyk0;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p1, v0}, Ll/c33;->b(Landroid/view/View;Ljava/lang/Throwable;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    :try_start_0
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p1

    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/qyk0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/qyk0;-><init>(Lv/VImage;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0, p1, v0}, Ll/c33;->b(Landroid/view/View;Ljava/lang/Throwable;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lv/VImage;->c:Ll/hs40;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hs40;->a(Landroid/graphics/ColorFilter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
