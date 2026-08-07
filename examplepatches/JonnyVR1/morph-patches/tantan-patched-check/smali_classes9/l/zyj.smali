.class public final synthetic Ll/zyj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ezj;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/ezj;Landroid/view/View;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zyj;->a:Ll/ezj;

    iput-object p2, p0, Ll/zyj;->b:Landroid/view/View;

    iput-object p3, p0, Ll/zyj;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyj;->a:Ll/ezj;

    iget-object v1, p0, Ll/zyj;->b:Landroid/view/View;

    iget-object p0, p0, Ll/zyj;->c:Ll/y20;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Ll/ezj;->S3(Ll/ezj;Landroid/view/View;Ll/y20;Landroid/graphics/Bitmap;)V

    return-void
.end method
