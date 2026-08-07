.class public abstract Ll/l4b0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final f:Ljava/lang/String;


# instance fields
.field protected a:I

.field protected b:Lcom/immomo/moment/opengl/Drawable2d;

.field protected c:[I

.field protected d:[I

.field protected e:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/z3k;->a:Ljava/lang/String;

    .line 2
    .line 3
    sput-object v0, Ll/l4b0;->f:Ljava/lang/String;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/l4b0;->e:I

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/z3k;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Ll/l4b0;->a:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/l4b0;->b()Lcom/immomo/moment/opengl/Drawable2d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Ll/l4b0;->b:Lcom/immomo/moment/opengl/Drawable2d;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/l4b0;->c()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/l4b0;->d:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v3, p0, Ll/l4b0;->e:I

    .line 8
    .line 9
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/l4b0;->d:[I

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/l4b0;->c:[I

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget v3, p0, Ll/l4b0;->e:I

    .line 19
    .line 20
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Ll/l4b0;->c:[I

    .line 24
    .line 25
    :cond_1
    return-void
.end method


# virtual methods
.method public abstract b()Lcom/immomo/moment/opengl/Drawable2d;
.end method

.method public abstract c()V
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/l4b0;->a()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/l4b0;->a:I

    .line 5
    .line 6
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 7
    .line 8
    .line 9
    const/4 v0, -0x1

    .line 10
    iput v0, p0, Ll/l4b0;->a:I

    .line 11
    .line 12
    return-void
.end method
