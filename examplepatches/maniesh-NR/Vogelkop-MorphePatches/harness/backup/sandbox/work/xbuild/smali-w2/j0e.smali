.class public final synthetic Lj0e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lm0e;


# direct methods
.method public synthetic constructor <init>(Lm0e;B)V
    .registers 3

    iput-byte p2, p0, Lj0e;->a:B

    iput-object p1, p0, Lj0e;->b:Lm0e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lj0e;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lj0e;->b:Lm0e;

    check-cast p1, Landroid/view/View;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result v0

    if-eqz v0, :cond_19

    iget-object p0, p0, Lm0e;->g:Lcom/opera/android/tabui2/TabUiRootFrameLayout;

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_19

    move-object v1, p1

    :cond_19
    return-object v1

    :pswitch_1a
    iget-object p0, p0, Lm0e;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_23

    move-object v1, p1

    :cond_23
    return-object v1

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1a
    .end packed-switch
.end method
