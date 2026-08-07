.class public final synthetic Ll/jvp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/mvp;

.field public final synthetic b:Ll/xup;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;


# direct methods
.method public synthetic constructor <init>(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jvp;->a:Ll/mvp;

    iput-object p2, p0, Ll/jvp;->b:Ll/xup;

    iput-object p3, p0, Ll/jvp;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jvp;->a:Ll/mvp;

    iget-object v1, p0, Ll/jvp;->b:Ll/xup;

    iget-object p0, p0, Ll/jvp;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;

    invoke-static {v0, v1, p0, p1}, Ll/mvp;->r0(Ll/mvp;Ll/xup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFanBaseDetail;Landroid/view/View;)V

    return-void
.end method
