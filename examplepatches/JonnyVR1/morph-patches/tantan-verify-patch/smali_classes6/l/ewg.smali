.class public final synthetic Ll/ewg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fwg;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/CameraCategory;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/fwg;Lcom/p1/mobile/putong/feed/data/CameraCategory;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ewg;->a:Ll/fwg;

    iput-object p2, p0, Ll/ewg;->b:Lcom/p1/mobile/putong/feed/data/CameraCategory;

    iput p3, p0, Ll/ewg;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ewg;->a:Ll/fwg;

    iget-object v1, p0, Ll/ewg;->b:Lcom/p1/mobile/putong/feed/data/CameraCategory;

    iget p0, p0, Ll/ewg;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/fwg;->y(Ll/fwg;Lcom/p1/mobile/putong/feed/data/CameraCategory;ILandroid/view/View;)V

    return-void
.end method
