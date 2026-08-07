.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->b9(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$d;->b:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$d;->a:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Ll/aw90;->m:Ll/vxd0;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl$d;->a:I

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
