.class public final synthetic Ll/xwg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ywg;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xwg;->a:Ll/ywg;

    iput-object p2, p0, Ll/xwg;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iput p3, p0, Ll/xwg;->c:I

    iput-boolean p4, p0, Ll/xwg;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xwg;->a:Ll/ywg;

    iget-object v1, p0, Ll/xwg;->b:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    iget v2, p0, Ll/xwg;->c:I

    iget-boolean p0, p0, Ll/xwg;->d:Z

    check-cast p1, Ljava/io/File;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ywg;->H(Ll/ywg;Lcom/p1/mobile/putong/feed/data/CameraSticker;IZLjava/io/File;)V

    return-void
.end method
