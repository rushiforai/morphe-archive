.class public final synthetic Ll/jbi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

.field public final synthetic b:Ll/xc00;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jbi0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    iput-object p2, p0, Ll/jbi0;->b:Ll/xc00;

    iput-object p3, p0, Ll/jbi0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jbi0;->a:Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;

    iget-object v1, p0, Ll/jbi0;->b:Ll/xc00;

    iget-object p0, p0, Ll/jbi0;->c:Ljava/lang/String;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;->o0(Lcom/p1/mobile/putong/core/ui/jsbridge/TantanCoreBridge;Ll/xc00;Ljava/lang/String;Landroid/graphics/Bitmap;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
