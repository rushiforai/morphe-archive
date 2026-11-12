.class public final Lynk;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/widget/inline/InlinePresentationSpec;

.field public final b:Landroid/app/PendingIntent;


# direct methods
.method public constructor <init>(Landroid/widget/inline/InlinePresentationSpec;Landroid/app/PendingIntent;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lynk;->a:Landroid/widget/inline/InlinePresentationSpec;

    iput-object p2, p0, Lynk;->b:Landroid/app/PendingIntent;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1e

    instance-of v0, p1, Lynk;

    if-eqz v0, :cond_1c

    check-cast p1, Lynk;

    iget-object v0, p0, Lynk;->a:Landroid/widget/inline/InlinePresentationSpec;

    iget-object v1, p1, Lynk;->a:Landroid/widget/inline/InlinePresentationSpec;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object p0, p0, Lynk;->b:Landroid/app/PendingIntent;

    iget-object p1, p1, Lynk;->b:Landroid/app/PendingIntent;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1e

    :cond_1c
    const/4 p0, 0x0

    return p0

    :cond_1e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lynk;->a:Landroid/widget/inline/InlinePresentationSpec;

    invoke-virtual {v0}, Landroid/widget/inline/InlinePresentationSpec;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lynk;->b:Landroid/app/PendingIntent;

    invoke-virtual {p0}, Landroid/app/PendingIntent;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
