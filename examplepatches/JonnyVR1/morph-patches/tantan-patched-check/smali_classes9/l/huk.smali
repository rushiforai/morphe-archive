.class public final synthetic Ll/huk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

.field public final synthetic b:Ll/ats;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;Ll/ats;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/huk;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

    iput-object p2, p0, Ll/huk;->b:Ll/ats;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/huk;->a:Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;

    iget-object p0, p0, Ll/huk;->b:Ll/ats;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;->a(Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/GuardHeaderItemView;Ll/ats;Landroid/view/View;)V

    return-void
.end method
