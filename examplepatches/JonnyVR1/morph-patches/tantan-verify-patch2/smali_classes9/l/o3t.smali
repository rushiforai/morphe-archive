.class public final synthetic Ll/o3t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/x3t;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/x3t;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o3t;->a:Ll/x3t;

    iput-object p2, p0, Ll/o3t;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    iput-object p3, p0, Ll/o3t;->c:Lcom/p1/mobile/putong/data/User;

    iput-boolean p4, p0, Ll/o3t;->d:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/o3t;->a:Ll/x3t;

    iget-object v1, p0, Ll/o3t;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMedal;

    iget-object v2, p0, Ll/o3t;->c:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/o3t;->d:Z

    invoke-static {v0, v1, v2, p0, p1}, Ll/x3t;->a(Ll/x3t;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;Lcom/p1/mobile/putong/data/User;ZLandroid/view/View;)V

    return-void
.end method
