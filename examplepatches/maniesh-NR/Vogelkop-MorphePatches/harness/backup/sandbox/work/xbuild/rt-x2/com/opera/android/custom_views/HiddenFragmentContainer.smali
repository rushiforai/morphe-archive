.class public Lcom/opera/android/custom_views/HiddenFragmentContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Lz61;

.field public b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lz61;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/custom_views/HiddenFragmentContainer;->a:Lz61;

    return-void
.end method
