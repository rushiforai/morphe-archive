.class public final Llwk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;B)V
    .registers 3

    iput-byte p2, p0, Llwk;->a:B

    iput-object p1, p0, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/view/View;)Llwk;
    .registers 3

    if-eqz p0, :cond_b

    new-instance v0, Llwk;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Llwk;-><init>(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;B)V

    return-object v0

    :cond_b
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Llwk;->a:B

    iget-object p0, p0, Llwk;->b:Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    return-object p0
.end method
