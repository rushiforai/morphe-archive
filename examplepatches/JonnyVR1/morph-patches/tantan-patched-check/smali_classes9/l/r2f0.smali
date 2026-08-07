.class public final synthetic Ll/r2f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/b3f0;

.field public final synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Ll/b3f0;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r2f0;->a:Ll/b3f0;

    iput-object p2, p0, Ll/r2f0;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r2f0;->a:Ll/b3f0;

    iget-object p0, p0, Ll/r2f0;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, p0}, Ll/b3f0;->k(Ll/b3f0;Landroid/graphics/Bitmap;)V

    return-void
.end method
