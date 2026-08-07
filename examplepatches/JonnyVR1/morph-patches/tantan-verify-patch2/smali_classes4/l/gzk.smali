.class public final synthetic Ll/gzk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/pzk;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/data/UserLiveState;


# direct methods
.method public synthetic constructor <init>(Ll/pzk;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gzk;->a:Ll/pzk;

    iput-object p2, p0, Ll/gzk;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/gzk;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/gzk;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/gzk;->e:Lcom/p1/mobile/putong/data/UserLiveState;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/gzk;->a:Ll/pzk;

    iget-object v1, p0, Ll/gzk;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/gzk;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/gzk;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/gzk;->e:Lcom/p1/mobile/putong/data/UserLiveState;

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/pzk;->D(Ll/pzk;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UserLiveState;Landroid/view/View;)V

    return-void
.end method
