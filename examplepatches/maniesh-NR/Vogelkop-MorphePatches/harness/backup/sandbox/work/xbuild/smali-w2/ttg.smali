.class public final Lttg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;


# direct methods
.method public constructor <init>(Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lttg;->a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p2, p0, Lttg;->b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iput-object p3, p0, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_22

    instance-of v0, p1, Lttg;

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    check-cast p1, Lttg;

    iget-object v0, p0, Lttg;->a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, p1, Lttg;->a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, Lttg;->b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v2, p1, Lttg;->b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eq v0, v2, :cond_17

    return v1

    :cond_17
    iget-object p0, p0, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-object p1, p1, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    :cond_21
    return v1

    :cond_22
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lttg;->a:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lttg;->b:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lttg;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
