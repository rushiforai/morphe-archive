.class public final synthetic Ll/lk4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

.field public final synthetic b:Z

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;ZLl/x20;ZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lk4;->a:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    iput-boolean p2, p0, Ll/lk4;->b:Z

    iput-object p3, p0, Ll/lk4;->c:Ll/x20;

    iput-boolean p4, p0, Ll/lk4;->d:Z

    iput-object p5, p0, Ll/lk4;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/lk4;->a:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    iget-boolean v1, p0, Ll/lk4;->b:Z

    iget-object v2, p0, Ll/lk4;->c:Ll/x20;

    iget-boolean v3, p0, Ll/lk4;->d:Z

    iget-object v4, p0, Ll/lk4;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->s(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;ZLl/x20;ZLcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
