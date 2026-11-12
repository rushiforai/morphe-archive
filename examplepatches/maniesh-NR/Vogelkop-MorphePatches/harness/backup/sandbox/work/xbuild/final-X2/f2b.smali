.class public final Lf2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final c:Lcom/google/android/material/button/MaterialButton;

.field public final d:Lcom/google/android/material/button/MaterialButton;

.field public final e:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;B)V
    .registers 6

    iput-byte p5, p0, Lf2b;->a:B

    iput-object p1, p0, Lf2b;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lf2b;->c:Lcom/google/android/material/button/MaterialButton;

    iput-object p3, p0, Lf2b;->d:Lcom/google/android/material/button/MaterialButton;

    iput-object p4, p0, Lf2b;->e:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lf2b;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lf2b;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lf2b;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
