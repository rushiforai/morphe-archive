.class public final synthetic Ll/ukf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;Landroid/view/View;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ukf;->a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;

    iput-object p2, p0, Ll/ukf;->b:Landroid/view/View;

    iput p3, p0, Ll/ukf;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ukf;->a:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;

    iget-object v1, p0, Ll/ukf;->b:Landroid/view/View;

    iget p0, p0, Ll/ukf;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;->a(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/ExpandProfileLikeAct$a;Landroid/view/View;I)V

    return-void
.end method
