.class public final Ll/bpy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z


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

.method public static bridge synthetic e(Ll/bpy0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bpy0;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic f(Ll/bpy0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bpy0;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static bridge synthetic g(Ll/bpy0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/bpy0;->c:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public final a(Z)Ll/bpy0;
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/bpy0;->a:Z

    .line 3
    .line 4
    return-object p0
.end method

.method public final b(Z)Ll/bpy0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bpy0;->b:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(Z)Ll/bpy0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bpy0;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Ll/fpy0;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bpy0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/bpy0;->b:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/bpy0;->c:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p0, "Secondary offload attribute fields are true but primary isFormatSupported is false"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    new-instance v0, Ll/fpy0;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-direct {v0, p0, v1}, Ll/fpy0;-><init>(Ll/bpy0;Ll/dpy0;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method
