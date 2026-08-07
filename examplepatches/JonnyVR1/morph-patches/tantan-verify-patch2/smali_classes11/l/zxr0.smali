.class public final Ll/zxr0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;Ll/uwr0;)Ll/mwr0;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance p1, Ll/vwr0;

    .line 2
    .line 3
    new-instance v0, Ll/txr0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/txr0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/vwr0;-><init>(Ll/uwr0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance v0, Ll/yxr0;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/yxr0;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/mwr0;

    .line 21
    .line 22
    new-instance v1, Ll/cxr0;

    .line 23
    .line 24
    const/high16 v2, 0x500000

    .line 25
    .line 26
    invoke-direct {v1, v0, v2}, Ll/cxr0;-><init>(Ll/bxr0;I)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-direct {p0, v1, p1, v0}, Ll/mwr0;-><init>(Ll/lvr0;Ll/tvr0;I)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/mwr0;->d()V

    .line 34
    .line 35
    .line 36
    return-object p0
.end method
