.class public final Ljmf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaRadioButton;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/opera/android/ui/catalog/widget/OperaRadioButton;B)V
    .registers 4

    iput-byte p3, p0, Ljmf;->a:B

    iput-object p1, p0, Ljmf;->b:Landroid/view/View;

    iput-object p2, p0, Ljmf;->c:Lcom/opera/android/ui/catalog/widget/OperaRadioButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ljmf;->a:B

    iget-object p0, p0, Ljmf;->b:Landroid/view/View;

    return-object p0
.end method
