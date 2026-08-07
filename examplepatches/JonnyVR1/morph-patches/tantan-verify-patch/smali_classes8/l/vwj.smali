.class public final synthetic Ll/vwj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/wwj;

.field public final synthetic b:Landroid/graphics/Bitmap;


# direct methods
.method public synthetic constructor <init>(Ll/wwj;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vwj;->a:Ll/wwj;

    iput-object p2, p0, Ll/vwj;->b:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vwj;->a:Ll/wwj;

    iget-object p0, p0, Ll/vwj;->b:Landroid/graphics/Bitmap;

    invoke-static {v0, p0}, Ll/wwj;->b(Ll/wwj;Landroid/graphics/Bitmap;)V

    return-void
.end method
