.class public final synthetic Ll/s2f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/sunshine/engine/base/a;

.field public final synthetic b:Landroid/graphics/Bitmap;

.field public final synthetic c:Landroid/media/MediaPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/sunshine/engine/base/a;Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s2f;->a:Lcom/sunshine/engine/base/a;

    iput-object p2, p0, Ll/s2f;->b:Landroid/graphics/Bitmap;

    iput-object p3, p0, Ll/s2f;->c:Landroid/media/MediaPlayer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s2f;->a:Lcom/sunshine/engine/base/a;

    iget-object v1, p0, Ll/s2f;->b:Landroid/graphics/Bitmap;

    iget-object p0, p0, Ll/s2f;->c:Landroid/media/MediaPlayer;

    invoke-static {v0, v1, p0}, Lcom/sunshine/engine/base/a;->a(Lcom/sunshine/engine/base/a;Landroid/graphics/Bitmap;Landroid/media/MediaPlayer;)V

    return-void
.end method
