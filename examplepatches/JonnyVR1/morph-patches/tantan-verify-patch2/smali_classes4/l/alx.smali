.class public final synthetic Ll/alx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Privilege;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;ZZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/alx;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    iput-object p2, p0, Ll/alx;->b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    iput-boolean p3, p0, Ll/alx;->c:Z

    iput-boolean p4, p0, Ll/alx;->d:Z

    iput-object p5, p0, Ll/alx;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    iput-object p6, p0, Ll/alx;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/alx;->a:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;

    iget-object v1, p0, Ll/alx;->b:Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;

    iget-boolean v2, p0, Ll/alx;->c:Z

    iget-boolean v3, p0, Ll/alx;->d:Z

    iget-object v4, p0, Ll/alx;->e:Lcom/p1/mobile/putong/core/data/Privilege;

    iget-object v5, p0, Ll/alx;->f:Ljava/lang/String;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;->n(Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/test1/MeTabRevampTest1ViewModel;Lcom/p1/mobile/putong/core/newui/profile/newme/revamp/common/MeTabRevampMemberCardHelper$CardType;ZZLcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
