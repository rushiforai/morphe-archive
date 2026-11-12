.class public final Lb98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lb98;->a:B

    iput-object p1, p0, Lb98;->b:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout;Lcom/google/android/material/button/MaterialButton;Lcr2;Lvs;Lov0;)V
    .registers 6

    const/4 p2, 0x2

    iput-byte p2, p0, Lb98;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb98;->b:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lb98;->a:B

    iget-object p0, p0, Lb98;->b:Landroid/widget/FrameLayout;

    return-object p0
.end method
