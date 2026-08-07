.class public final synthetic Ll/xdh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xdh0;->a:Ll/y20;

    iput-object p2, p0, Ll/xdh0;->b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    iput-object p3, p0, Ll/xdh0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xdh0;->a:Ll/y20;

    iget-object v1, p0, Ll/xdh0;->b:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    iget-object p0, p0, Ll/xdh0;->c:Ljava/lang/String;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Ll/aeh0;->c(Ll/y20;Lcom/tantan/library/svga/compose/SVGADynamicEntity;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method
