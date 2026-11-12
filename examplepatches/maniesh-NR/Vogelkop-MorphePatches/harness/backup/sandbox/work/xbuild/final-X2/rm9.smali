.class public final Lrm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/widget/LinearLayout;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final e:Lvs;

.field public final f:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lvs;Landroid/widget/LinearLayout;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrm9;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lrm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p3, p0, Lrm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p4, p0, Lrm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p5, p0, Lrm9;->e:Lvs;

    iput-object p6, p0, Lrm9;->f:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lrm9;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method
