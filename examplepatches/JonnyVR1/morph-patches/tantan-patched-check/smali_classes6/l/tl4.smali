.class public final synthetic Ll/tl4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jk20;


# direct methods
.method public synthetic constructor <init>(Ll/jk20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl4;->a:Ll/jk20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tl4;->a:Ll/jk20;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/vl4;->b(Ll/jk20;Landroid/graphics/Bitmap;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
