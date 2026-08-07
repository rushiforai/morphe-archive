.class public final synthetic Ll/ooi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ooi0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

    iput-boolean p2, p0, Ll/ooi0;->b:Z

    iput-object p3, p0, Ll/ooi0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iput-object p4, p0, Ll/ooi0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/ooi0;->e:Ljava/lang/String;

    iput p6, p0, Ll/ooi0;->f:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ooi0;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

    iget-boolean v1, p0, Ll/ooi0;->b:Z

    iget-object v2, p0, Ll/ooi0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    iget-object v3, p0, Ll/ooi0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/ooi0;->e:Ljava/lang/String;

    iget v5, p0, Ll/ooi0;->f:I

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/live/base/data/BLiveSignInReward;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->b(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;ZLcom/p1/mobile/putong/live/livingroom/common/signin/a;Ljava/lang/String;Ljava/lang/String;ILcom/p1/mobile/putong/live/base/data/BLiveSignInReward;)V

    return-void
.end method
