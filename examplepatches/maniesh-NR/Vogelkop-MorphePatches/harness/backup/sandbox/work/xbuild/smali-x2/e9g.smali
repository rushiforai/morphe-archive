.class public final synthetic Le9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;
.implements Lla;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;I)V
    .registers 3

    iput-object p1, p0, Le9g;->b:Ljava/lang/Object;

    iput-byte p2, p0, Le9g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final k(Landroid/view/View;)Z
    .registers 2

    iget-object p1, p0, Le9g;->b:Ljava/lang/Object;

    check-cast p1, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-byte p0, p0, Le9g;->a:B

    invoke-virtual {p1, p0}, Lcom/google/android/material/sidesheet/SideSheetBehavior;->x(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 4

    iget-object p1, p0, Le9g;->b:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iget-byte p0, p0, Le9g;->a:B

    const/4 v0, 0x0

    if-eqz p2, :cond_d

    invoke-static {p0, v0, p1, v0}, Lhj;->b(IILjava/lang/String;Z)V

    return-void

    :cond_d
    invoke-static {v0, p0, p1, v0}, Lhj;->b(IILjava/lang/String;Z)V

    return-void
.end method
