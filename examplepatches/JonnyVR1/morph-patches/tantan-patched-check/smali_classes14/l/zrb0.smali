.class public final synthetic Ll/zrb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zrb0;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zrb0;->a:Landroid/view/View;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {p0, p1}, Ll/fsb0;->A(Landroid/view/View;Landroid/graphics/Bitmap;)V

    return-void
.end method
