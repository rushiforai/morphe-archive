.class public final Ll/fpy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ll/fpy0;


# instance fields
.field public final a:Z

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/bpy0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bpy0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/bpy0;->d()Ll/fpy0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/fpy0;->d:Ll/fpy0;

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Ll/bpy0;Ll/dpy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/bpy0;->e(Ll/bpy0;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iput-boolean p2, p0, Ll/fpy0;->a:Z

    .line 9
    .line 10
    invoke-static {p1}, Ll/bpy0;->f(Ll/bpy0;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    iput-boolean p2, p0, Ll/fpy0;->b:Z

    .line 15
    .line 16
    invoke-static {p1}, Ll/bpy0;->g(Ll/bpy0;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput-boolean p1, p0, Ll/fpy0;->c:Z

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/fpy0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/fpy0;

    .line 18
    .line 19
    iget-boolean v2, p0, Ll/fpy0;->a:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Ll/fpy0;->a:Z

    .line 22
    .line 23
    if-ne v2, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v2, p0, Ll/fpy0;->b:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Ll/fpy0;->b:Z

    .line 28
    .line 29
    if-ne v2, v3, :cond_2

    .line 30
    .line 31
    iget-boolean p0, p0, Ll/fpy0;->c:Z

    .line 32
    .line 33
    iget-boolean p1, p1, Ll/fpy0;->c:Z

    .line 34
    .line 35
    if-ne p0, p1, :cond_2

    .line 36
    .line 37
    return v0

    .line 38
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/fpy0;->a:Z

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/fpy0;->b:Z

    .line 4
    .line 5
    shl-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    add-int/2addr v1, v1

    .line 8
    add-int/2addr v0, v1

    .line 9
    iget-boolean p0, p0, Ll/fpy0;->c:Z

    .line 10
    .line 11
    add-int/2addr v0, p0

    .line 12
    return v0
.end method
