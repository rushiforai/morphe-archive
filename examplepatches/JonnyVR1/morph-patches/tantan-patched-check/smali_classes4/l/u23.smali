.class public final synthetic Ll/u23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u23;->a:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u23;->a:Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;

    invoke-static {p0}, Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;->a(Lcom/tantan/library/svga/drawer/bitmap/BitmapPool;)V

    return-void
.end method
