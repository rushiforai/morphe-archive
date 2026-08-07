.class public final synthetic Ll/iaw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iaw;->a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    iput-object p2, p0, Ll/iaw;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iaw;->a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    iget-object p0, p0, Ll/iaw;->b:Ljava/lang/String;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzMatchView;->b(Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
