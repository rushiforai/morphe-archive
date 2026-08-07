.class public final synthetic Ll/vsh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cth0;


# direct methods
.method public synthetic constructor <init>(Ll/cth0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vsh0;->a:Ll/cth0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsh0;->a:Ll/cth0;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/cth0;->j(Ll/cth0;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
