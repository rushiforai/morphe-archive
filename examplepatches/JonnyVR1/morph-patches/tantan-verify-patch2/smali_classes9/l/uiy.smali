.class public final synthetic Ll/uiy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/riy;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/riy;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uiy;->a:Ll/riy;

    iput-object p2, p0, Ll/uiy;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uiy;->a:Ll/riy;

    iget-object p0, p0, Ll/uiy;->b:Ljava/lang/String;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/member/subModule/leaderBoard/MemberLeaderViewDomestic;->a(Ll/riy;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
