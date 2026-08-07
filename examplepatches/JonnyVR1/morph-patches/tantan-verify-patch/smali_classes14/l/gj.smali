.class public final synthetic Ll/gj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/nj;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/CameraSticker;


# direct methods
.method public synthetic constructor <init>(Ll/nj;Lcom/p1/mobile/putong/account/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gj;->a:Ll/nj;

    iput-object p2, p0, Ll/gj;->b:Lcom/p1/mobile/putong/account/data/CameraSticker;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gj;->a:Ll/nj;

    iget-object p0, p0, Ll/gj;->b:Lcom/p1/mobile/putong/account/data/CameraSticker;

    check-cast p1, Ljava/io/File;

    invoke-static {v0, p0, p1}, Ll/nj;->r(Ll/nj;Lcom/p1/mobile/putong/account/data/CameraSticker;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
