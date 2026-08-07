.class public final synthetic Ll/dl4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dl4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dl4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->a(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method
