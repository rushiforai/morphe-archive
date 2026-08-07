.class public Ll/xgu;
.super Ll/ahu;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/xgu;",
        ">",
        "Ll/ahu<",
        "TD;>;",
        "Ll/iam<",
        "TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/knu;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ahu;-><init>(Ll/knu;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public R2(Ll/xgu;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/xgu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xgu;->R2(Ll/xgu;)V

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
