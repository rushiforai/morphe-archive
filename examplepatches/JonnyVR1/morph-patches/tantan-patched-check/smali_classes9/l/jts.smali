.class public final synthetic Ll/jts;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ats;


# direct methods
.method public synthetic constructor <init>(Ll/ats;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jts;->a:Ll/ats;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jts;->a:Ll/ats;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->h0(Ll/ats;Landroid/view/View;)V

    return-void
.end method
