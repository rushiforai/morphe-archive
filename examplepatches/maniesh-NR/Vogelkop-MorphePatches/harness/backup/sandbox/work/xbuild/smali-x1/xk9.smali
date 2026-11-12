.class public final Lxk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/widget/LinearLayout;

.field public final b:Lcom/opera/android/custom_views/SeparatorView;

.field public final c:Landroidx/recyclerview/widget/RecyclerView;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

.field public final e:Ljq2;


# direct methods
.method public constructor <init>(Ljq2;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lxk9;->a:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lxk9;->b:Lcom/opera/android/custom_views/SeparatorView;

    iput-object p3, p0, Lxk9;->c:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p5, p0, Lxk9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p1, p0, Lxk9;->e:Ljq2;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lxk9;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method
