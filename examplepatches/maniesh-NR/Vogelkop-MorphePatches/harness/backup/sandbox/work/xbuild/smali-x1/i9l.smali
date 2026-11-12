.class public final synthetic Li9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr9l;


# direct methods
.method public synthetic constructor <init>(Lr9l;B)V
    .registers 3

    iput-byte p2, p0, Li9l;->a:B

    iput-object p1, p0, Li9l;->b:Lr9l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Li9l;->a:B

    iget-object p0, p0, Li9l;->b:Lr9l;

    packed-switch v0, :pswitch_data_10

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object p0, p0, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    return-object p0

    :pswitch_c
    iget-object p0, p0, Lr9l;->e:Landroid/view/ViewGroup;

    return-object p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method
