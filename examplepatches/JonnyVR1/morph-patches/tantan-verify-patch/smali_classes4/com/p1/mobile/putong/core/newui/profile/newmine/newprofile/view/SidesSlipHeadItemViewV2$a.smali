.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;->V(Lcom/p1/mobile/android/app/Act;Ll/pol;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;->c:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "mode_select"

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    filled-new-array {p1}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "e_mode_entrance"

    .line 14
    .line 15
    const-string v1, "p_navigation_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 23
    .line 24
    iget-object p1, p1, Ll/dkb;->h4:Lrx/subjects/b;

    .line 25
    .line 26
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/SidesSlipHeadItemViewV2$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 34
    .line 35
    .line 36
    return-void
.end method
