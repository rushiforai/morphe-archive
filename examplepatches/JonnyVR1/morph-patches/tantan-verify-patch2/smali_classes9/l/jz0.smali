.class public Ll/jz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/iz0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

.field public b:Ll/iz0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jz0;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/areaA/view/BottomInputView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Ll/iz0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jz0;->b:Ll/iz0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/iz0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jz0;->a(Ll/iz0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
