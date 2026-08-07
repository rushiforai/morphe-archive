.class public Ll/qof0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w4d0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/w4d0<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# static fields
.field public static a:Ll/qof0;


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

.method public static a()Ll/qof0;
    .locals 1

    .line 1
    sget-object v0, Ll/qof0;->a:Ll/qof0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qof0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/qof0;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/qof0;->a:Ll/qof0;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/qof0;->a:Ll/qof0;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public b(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic release(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qof0;->b(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
