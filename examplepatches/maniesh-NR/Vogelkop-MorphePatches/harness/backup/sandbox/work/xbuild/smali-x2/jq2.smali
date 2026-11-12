.class public final Ljq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;B)V
    .registers 3

    iput-byte p2, p0, Ljq2;->a:B

    iput-object p1, p0, Ljq2;->b:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ljq2;->a:B

    iget-object p0, p0, Ljq2;->b:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    return-object p0
.end method
