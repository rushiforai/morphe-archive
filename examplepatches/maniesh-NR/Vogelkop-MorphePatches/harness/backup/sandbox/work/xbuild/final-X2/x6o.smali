.class public final Lx6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Landroid/widget/ImageView;

.field public final d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final e:Ly6o;

.field public final f:Landroid/widget/LinearLayout;

.field public final g:Landroid/widget/ImageView;

.field public final h:Lcom/opera/android/ui/catalog/widget/OperaTextView;


# direct methods
.method public constructor <init>(Landroid/view/View;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Ly6o;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx6o;->a:Landroid/view/View;

    iput-object p2, p0, Lx6o;->b:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lx6o;->c:Landroid/widget/ImageView;

    iput-object p4, p0, Lx6o;->d:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p5, p0, Lx6o;->e:Ly6o;

    iput-object p6, p0, Lx6o;->f:Landroid/widget/LinearLayout;

    iput-object p7, p0, Lx6o;->g:Landroid/widget/ImageView;

    iput-object p8, p0, Lx6o;->h:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lx6o;->a:Landroid/view/View;

    return-object p0
.end method
