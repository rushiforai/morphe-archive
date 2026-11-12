.class public final Lg7d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/FrameLayout;

.field public final c:Lcom/opera/android/custom_views/CircleImageView;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/CircleImageView;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lg7d;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg7d;->b:Landroid/widget/FrameLayout;

    iput-object p2, p0, Lg7d;->c:Lcom/opera/android/custom_views/CircleImageView;

    return-void
.end method

.method public constructor <init>(Lpq3;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Landroid/widget/TextView;Landroid/widget/TextView;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/CircleImageView;)V
    .registers 8

    const/4 p1, 0x1

    iput-byte p1, p0, Lg7d;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p2, p0, Lg7d;->b:Landroid/widget/FrameLayout;

    .line 13
    iput-object p7, p0, Lg7d;->c:Lcom/opera/android/custom_views/CircleImageView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lg7d;->a:B

    iget-object p0, p0, Lg7d;->b:Landroid/widget/FrameLayout;

    return-object p0
.end method
