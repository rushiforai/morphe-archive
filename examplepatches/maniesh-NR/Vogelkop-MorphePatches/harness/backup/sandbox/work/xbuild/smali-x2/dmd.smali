.class public final Ldmd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Ldmd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ldmd;->b:Landroid/widget/LinearLayout;

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lcr2;Lcom/google/android/material/card/MaterialCardView;Lvs;Lov0;)V
    .registers 6

    const/4 p2, 0x1

    iput-byte p2, p0, Ldmd;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Ldmd;->b:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ldmd;->a:B

    iget-object p0, p0, Ldmd;->b:Landroid/widget/LinearLayout;

    return-object p0
.end method
