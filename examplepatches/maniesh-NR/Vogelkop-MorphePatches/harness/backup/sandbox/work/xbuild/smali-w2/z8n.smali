.class public final Lz8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final c:[I

.field public static final d:[I


# instance fields
.field public final a:Lff2;

.field public final synthetic b:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    const v0, 0x7f0409ff

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz8n;->c:[I

    const v0, 0x1010121

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lz8n;->d:[I

    return-void
.end method

.method public constructor <init>(Lff2;B)V
    .registers 3

    iput-byte p2, p0, Lz8n;->b:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz8n;->a:Lff2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Lz8n;->b:B

    iget-object p0, p0, Lz8n;->a:Lff2;

    packed-switch v0, :pswitch_data_34

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1c

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_1c

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_1c
    return-void

    :pswitch_1d
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_32

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_32

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
