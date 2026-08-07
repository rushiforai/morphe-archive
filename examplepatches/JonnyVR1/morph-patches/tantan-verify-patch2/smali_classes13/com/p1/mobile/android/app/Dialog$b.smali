.class public Lcom/p1/mobile/android/app/Dialog$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/android/app/Dialog;->U()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Dialog;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/app/Dialog$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    iget-object p4, p1, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    iget-object p5, p4, Lcom/p1/mobile/android/app/Dialog$e;->A:Lcom/p1/mobile/android/app/Dialog$g;

    .line 6
    .line 7
    if-eqz p5, :cond_1

    .line 8
    .line 9
    iget-boolean p4, p4, Lcom/p1/mobile/android/app/Dialog$e;->J:Z

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Dialog$b;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/android/app/Dialog;->l:Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/android/app/Dialog$e;->A:Lcom/p1/mobile/android/app/Dialog$g;

    .line 21
    .line 22
    const/4 p4, 0x0

    .line 23
    invoke-interface {p1, p0, p2, p3, p4}, Lcom/p1/mobile/android/app/Dialog$g;->a(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
