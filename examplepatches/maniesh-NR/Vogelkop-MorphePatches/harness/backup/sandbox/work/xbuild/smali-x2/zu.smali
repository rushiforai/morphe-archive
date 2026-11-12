.class public final Lzu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/opera/android/custom_views/OperaTextInputEditText;

.field public final d:Lcom/google/android/material/textfield/TextInputLayout;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/EqualWidthLinearLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 5

    const/4 p2, 0x1

    iput-byte p2, p0, Lzu;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lzu;->b:Landroid/widget/LinearLayout;

    .line 15
    iput-object p3, p0, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    .line 16
    iput-object p4, p0, Lzu;->d:Lcom/google/android/material/textfield/TextInputLayout;

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lzu;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzu;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lzu;->c:Lcom/opera/android/custom_views/OperaTextInputEditText;

    iput-object p3, p0, Lzu;->d:Lcom/google/android/material/textfield/TextInputLayout;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lzu;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lzu;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lzu;->b:Landroid/widget/LinearLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
