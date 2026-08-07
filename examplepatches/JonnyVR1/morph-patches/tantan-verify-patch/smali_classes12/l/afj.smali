.class public Ll/afj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/afj$a;
    }
.end annotation


# instance fields
.field protected final a:I

.field protected b:Ljava/lang/Object;

.field protected c:Landroid/opengl/EGLSurface;

.field protected d:Ll/afj$a;


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Landroid/opengl/EGL14;->EGL_NO_SURFACE:Landroid/opengl/EGLSurface;

    .line 5
    .line 6
    iput-object v0, p0, Ll/afj;->c:Landroid/opengl/EGLSurface;

    .line 7
    .line 8
    new-instance v0, Ll/afj$a;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/afj$a;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/afj;->d:Ll/afj$a;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0, v0, p1, p2}, Ll/afj;->a(IIII)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Ll/afj;->b:Ljava/lang/Object;

    .line 21
    .line 22
    const/4 p1, 0x1

    .line 23
    iput p1, p0, Ll/afj;->a:I

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a(IIII)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/afj;->d:Ll/afj$a;

    .line 2
    .line 3
    iput p1, p0, Ll/afj$a;->a:I

    .line 4
    .line 5
    iput p2, p0, Ll/afj$a;->b:I

    .line 6
    .line 7
    iput p3, p0, Ll/afj$a;->c:I

    .line 8
    .line 9
    iput p4, p0, Ll/afj$a;->d:I

    .line 10
    .line 11
    return-void
.end method
