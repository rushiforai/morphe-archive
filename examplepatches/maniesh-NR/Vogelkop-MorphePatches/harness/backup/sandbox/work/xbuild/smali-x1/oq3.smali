.class public final Loq3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:B

.field public c:Z

.field public final d:Ljava/lang/Runnable;

.field public final synthetic e:Lnv5;


# direct methods
.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Loq3;->a:B

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loq3;->e:Lnv5;

    .line 19
    new-instance p1, Lig;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v0}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Loq3;->d:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Loq3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Loq3;->e:Lnv5;

    new-instance p1, Lmni;

    const/16 v0, 0xd

    invoke-direct {p1, p0, v0}, Lmni;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Loq3;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 6

    iget-byte v0, p0, Loq3;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Loq3;->d:Ljava/lang/Runnable;

    iget-object v3, p0, Loq3;->e:Lnv5;

    packed-switch v0, :pswitch_data_4e

    check-cast v3, Lcom/google/android/material/sidesheet/SideSheetBehavior;

    iget-object v0, v3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->p:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_2b

    iput-byte p1, p0, Loq3;->b:B

    iget-boolean p1, p0, Loq3;->c:Z

    if-nez p1, :cond_2b

    iget-object p1, v3, Lcom/google/android/material/sidesheet/SideSheetBehavior;->p:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast v2, Lmni;

    invoke-virtual {p1, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iput-boolean v1, p0, Loq3;->c:Z

    :cond_2b
    return-void

    :pswitch_2c
    check-cast v3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    iget-object v0, v3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_4d

    iput-byte p1, p0, Loq3;->b:B

    iget-boolean p1, p0, Loq3;->c:Z

    if-nez p1, :cond_4d

    iget-object p1, v3, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->Y:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast v2, Lig;

    invoke-virtual {p1, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iput-boolean v1, p0, Loq3;->c:Z

    :cond_4d
    return-void

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2c
    .end packed-switch
.end method
