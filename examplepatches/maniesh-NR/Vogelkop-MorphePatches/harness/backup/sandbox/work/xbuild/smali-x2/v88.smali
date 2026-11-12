.class public final Lv88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Landroid/widget/TextView;

.field public final d:Lcom/opera/android/custom_views/StylingImageView;

.field public final e:Landroid/widget/TextView;

.field public final f:Lcom/google/android/material/button/MaterialButton;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Lcom/google/android/material/button/MaterialButton;B)V
    .registers 7

    iput-byte p6, p0, Lv88;->a:B

    iput-object p1, p0, Lv88;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lv88;->c:Landroid/widget/TextView;

    iput-object p3, p0, Lv88;->d:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p4, p0, Lv88;->e:Landroid/widget/TextView;

    iput-object p5, p0, Lv88;->f:Lcom/google/android/material/button/MaterialButton;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lv88;->a:B

    iget-object p0, p0, Lv88;->b:Landroid/widget/LinearLayout;

    return-object p0
.end method
