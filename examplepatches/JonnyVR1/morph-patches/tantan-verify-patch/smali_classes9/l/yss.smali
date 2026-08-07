.class public final synthetic Ll/yss;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ats;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;


# direct methods
.method public synthetic constructor <init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yss;->a:Ll/ats;

    iput-object p2, p0, Ll/yss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    iput-object p3, p0, Ll/yss;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/yss;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yss;->a:Ll/ats;

    iget-object v1, p0, Ll/yss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    iget-object v2, p0, Ll/yss;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/yss;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ats;->w(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Landroid/view/View;)V

    return-void
.end method
