.class public final synthetic Ll/t2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/t2n;->a:I

    iput-boolean p2, p0, Ll/t2n;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/t2n;->a:I

    iget-boolean p0, p0, Ll/t2n;->b:Z

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/u2n;->c(IZLandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
