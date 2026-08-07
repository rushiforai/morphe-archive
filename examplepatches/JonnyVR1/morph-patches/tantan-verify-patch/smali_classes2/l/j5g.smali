.class public final synthetic Ll/j5g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l5g;

.field public final synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Ll/l5g;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5g;->a:Ll/l5g;

    iput-object p2, p0, Ll/j5g;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j5g;->a:Ll/l5g;

    iget-object p0, p0, Ll/j5g;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, p0}, Ll/k5g;->b(Ll/l5g;Landroid/graphics/Bitmap;)V

    return-void
.end method
