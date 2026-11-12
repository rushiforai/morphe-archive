.class public final Lpih;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp9n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/RadioButton;Lcom/opera/android/custom_views/RadioButton;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lpih;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lpih;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lpih;->a:B

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpih;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final h(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lpih;->a:B

    iget-object p0, p0, Lpih;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_18

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_d
    check-cast p1, Lcom/opera/android/custom_views/RadioButton;

    check-cast p0, Lcom/opera/android/custom_views/RadioButton;

    if-eq p1, p0, :cond_17

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/RadioButton;->setChecked(Z)V

    :cond_17
    return-void

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_d
    .end packed-switch
.end method
