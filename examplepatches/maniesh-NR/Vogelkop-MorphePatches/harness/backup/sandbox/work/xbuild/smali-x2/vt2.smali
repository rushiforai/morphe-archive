.class public final synthetic Lvt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lam9;


# instance fields
.field public final synthetic a:Landroidx/fragment/app/w;

.field public final synthetic b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;


# direct methods
.method public synthetic constructor <init>(Landroidx/fragment/app/w;Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvt2;->a:Landroidx/fragment/app/w;

    iput-object p2, p0, Lvt2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    return-void
.end method


# virtual methods
.method public final onBackStackChanged()V
    .registers 2

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    iget-object v0, p0, Lvt2;->a:Landroidx/fragment/app/w;

    invoke-virtual {v0}, Landroidx/fragment/app/w;->J()I

    move-result v0

    if-nez v0, :cond_f

    iget-object p0, p0, Lvt2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_f
    return-void
.end method
