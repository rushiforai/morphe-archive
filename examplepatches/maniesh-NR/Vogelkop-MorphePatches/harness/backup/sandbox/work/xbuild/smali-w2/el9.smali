.class public final Lel9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/widget/LinearLayout;

.field public final b:Landroidx/recyclerview/widget/RecyclerView;

.field public final c:Landroidx/recyclerview/widget/RecyclerView;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final e:Lcom/opera/android/ui/catalog/widget/OperaTextView;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lel9;->a:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lel9;->b:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p3, p0, Lel9;->c:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Lel9;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p5, p0, Lel9;->e:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lel9;->a:Landroid/widget/LinearLayout;

    return-object p0
.end method
