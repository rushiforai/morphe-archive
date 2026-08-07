.class public final synthetic Ll/uwg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ywg;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/CameraSticker;


# direct methods
.method public synthetic constructor <init>(Ll/ywg;ILcom/p1/mobile/putong/feed/data/CameraSticker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uwg;->a:Ll/ywg;

    iput p2, p0, Ll/uwg;->b:I

    iput-object p3, p0, Ll/uwg;->c:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/uwg;->a:Ll/ywg;

    iget v1, p0, Ll/uwg;->b:I

    iget-object p0, p0, Ll/uwg;->c:Lcom/p1/mobile/putong/feed/data/CameraSticker;

    invoke-static {v0, v1, p0, p1}, Ll/ywg;->E(Ll/ywg;ILcom/p1/mobile/putong/feed/data/CameraSticker;Landroid/view/View;)V

    return-void
.end method
