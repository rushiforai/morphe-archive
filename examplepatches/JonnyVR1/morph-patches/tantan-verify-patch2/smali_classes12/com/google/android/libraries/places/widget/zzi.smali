.class public final synthetic Lcom/google/android/libraries/places/widget/zzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cb50;


# instance fields
.field public final synthetic zza:Landroid/widget/EditText;

.field public final synthetic zzb:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/EditText;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/widget/zzi;->zza:Landroid/widget/EditText;

    iput-object p2, p0, Lcom/google/android/libraries/places/widget/zzi;->zzb:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onChanged(Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/libraries/places/widget/zzi;->zza:Landroid/widget/EditText;

    iget-object p0, p0, Lcom/google/android/libraries/places/widget/zzi;->zzb:Landroid/view/View;

    check-cast p1, Ljava/lang/CharSequence;

    invoke-static {v0, p0, p1}, Lcom/google/android/libraries/places/widget/AutocompleteSupportFragment;->zzd(Landroid/widget/EditText;Landroid/view/View;Ljava/lang/CharSequence;)V

    return-void
.end method
