.class public abstract Ll/gxl$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l4f$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gxl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/l4f$b<",
        "Ll/gxl;",
        ">;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:I


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


# virtual methods
.method public bridge synthetic a(Ll/l4f$a;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gxl;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gxl$g;->b(Ll/gxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/gxl;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/gxl$g;->b:I

    .line 2
    .line 3
    iput v0, p0, Ll/gxl$g;->a:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/gxl;->e()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/gxl$g;->b:I

    .line 10
    .line 11
    iget v1, p0, Ll/gxl$g;->a:I

    .line 12
    .line 13
    invoke-virtual {p0, v1, v0, p1}, Ll/gxl$g;->c(IILl/gxl;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public abstract c(IILl/gxl;)V
.end method
