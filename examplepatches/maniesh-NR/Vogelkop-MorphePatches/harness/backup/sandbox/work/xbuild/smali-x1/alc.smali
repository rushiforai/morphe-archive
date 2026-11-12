.class public final Lalc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/view/View;

.field public final c:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final d:Ly83;

.field public final e:Lmlc;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroidx/constraintlayout/widget/ConstraintLayout;Ly83;Lmlc;B)V
    .registers 6

    iput-byte p5, p0, Lalc;->a:B

    iput-object p1, p0, Lalc;->b:Landroid/view/View;

    iput-object p2, p0, Lalc;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p3, p0, Lalc;->d:Ly83;

    iput-object p4, p0, Lalc;->e:Lmlc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lalc;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lalc;->b:Landroid/view/View;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lalc;->b:Landroid/view/View;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
