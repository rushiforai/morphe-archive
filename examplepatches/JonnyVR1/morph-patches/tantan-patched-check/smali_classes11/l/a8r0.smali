.class public final Ll/a8r0;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# static fields
.field public static final a:Ll/a8r0;

.field public static final b:Ll/x7r0;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/a8r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a8r0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/a8r0;->a:Ll/a8r0;

    .line 7
    .line 8
    new-instance v0, Ll/x7r0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Ll/x7r0;-><init>(Ll/v7r0;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/a8r0;->b:Ll/x7r0;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic a()Ll/a8r0;
    .locals 1

    .line 1
    sget-object v0, Ll/a8r0;->a:Ll/a8r0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .locals 0

    .line 1
    sget-object p0, Ll/a8r0;->b:Ll/x7r0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOpacity()I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public final setAlpha(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method
