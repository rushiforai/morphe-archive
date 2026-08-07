.class public final synthetic Ll/aa4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/c;Lcom/p1/mobile/putong/feed/data/CameraSticker;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aa4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

    iput-object p2, p0, Ll/aa4;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iput p3, p0, Ll/aa4;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aa4;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/c;

    iget-object v1, p0, Ll/aa4;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iget p0, p0, Ll/aa4;->c:I

    check-cast p1, Ljava/io/File;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/c;->F(Lcom/p1/mobile/putong/feed/newui/camera/widget/c;Lcom/p1/mobile/putong/feed/data/CameraSticker;ILjava/io/File;)V

    return-void
.end method
