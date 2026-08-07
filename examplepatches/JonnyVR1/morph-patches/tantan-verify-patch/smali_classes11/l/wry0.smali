.class public final Ll/wry0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    value = 0x1f
.end annotation


# direct methods
.method public static a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;Z)Ll/fpy0;
    .locals 4
    .annotation build Landroidx/annotation/DoNotInline;
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/amd;->a(Landroid/media/AudioFormat;Landroid/media/AudioAttributes;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/fpy0;->d:Ll/fpy0;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p1, Ll/bpy0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/bpy0;-><init>()V

    .line 13
    .line 14
    .line 15
    sget v0, Ll/mpw0;->a:I

    .line 16
    .line 17
    const/16 v1, 0x20

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    const/4 v3, 0x1

    .line 21
    if-le v0, v1, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-ne p0, v0, :cond_1

    .line 25
    .line 26
    move v2, v3

    .line 27
    :cond_1
    invoke-virtual {p1, v3}, Ll/bpy0;->a(Z)Ll/bpy0;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v2}, Ll/bpy0;->b(Z)Ll/bpy0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/bpy0;->c(Z)Ll/bpy0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ll/bpy0;->d()Ll/fpy0;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0
.end method
