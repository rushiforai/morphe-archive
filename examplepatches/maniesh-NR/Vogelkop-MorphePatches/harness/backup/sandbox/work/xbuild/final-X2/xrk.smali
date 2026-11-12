.class public final Lxrk;
.super Llj;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lxrk;",
        "Llj;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic t:[Lxtb;


# instance fields
.field public final r:Lktl;

.field public final s:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Ld6h;

    const-class v1, Lxrk;

    const-string v2, "binding"

    const-string v3, "getBinding()Lcom/opera/android/databinding/WalletSunsetEntryBinding;"

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Ld6h;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    const/4 v1, 0x1

    new-array v1, v1, [Lxtb;

    aput-object v0, v1, v4

    sput-object v1, Lxrk;->t:[Lxtb;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140a3d

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance v0, Lgpk;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lgpk;-><init>(B)V

    invoke-virtual {p0, v0}, Lltl;->F0(Ljtl;)Lktl;

    move-result-object v0

    iput-object v0, p0, Lxrk;->r:Lktl;

    new-instance v0, Lyse;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lxrk;->s:Lzyk;

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    sget-object p1, Lxrk;->t:[Lxtb;

    const/4 p2, 0x0

    aget-object p1, p1, p2

    iget-object p1, p0, Lxrk;->r:Lktl;

    iget-object p1, p1, Lktl;->b:La5n;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Lhjn;

    iget-object p1, p1, Lhjn;->b:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance p2, Lh4i;

    const/16 v0, 0x14

    invoke-direct {p2, p0, v0}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
