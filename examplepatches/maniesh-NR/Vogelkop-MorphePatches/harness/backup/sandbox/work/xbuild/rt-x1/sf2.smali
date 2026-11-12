.class public final Lsf2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/ImageView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/ImageView;B)V
    .registers 3

    iput-byte p2, p0, Lsf2;->a:B

    iput-object p1, p0, Lsf2;->b:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lsf2;
    .registers 4

    const v0, 0x7f0d0402

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    if-eqz p0, :cond_13

    new-instance p1, Lsf2;

    check-cast p0, Landroid/widget/ImageView;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lsf2;-><init>(Landroid/widget/ImageView;B)V

    return-object p1

    :cond_13
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lsf2;->a:B

    iget-object p0, p0, Lsf2;->b:Landroid/widget/ImageView;

    return-object p0
.end method
