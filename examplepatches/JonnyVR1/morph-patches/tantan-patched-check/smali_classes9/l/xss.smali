.class public final synthetic Ll/xss;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ats;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xss;->a:Ll/ats;

    iput-object p2, p0, Ll/xss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    iput-object p3, p0, Ll/xss;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/xss;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    iput-object p5, p0, Ll/xss;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xss;->a:Ll/ats;

    iget-object v1, p0, Ll/xss;->b:Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    iget-object v2, p0, Ll/xss;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/xss;->d:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    iget-object v4, p0, Ll/xss;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Landroid/view/View;

    invoke-static/range {v0 .. v5}, Ll/ats;->x(Ll/ats;Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
