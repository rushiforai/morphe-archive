.class public final Lst2;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

.field public final c:Lx5g;

.field public final d:Lode;

.field public e:La4g;


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;Lx5g;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lst2;->b:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iput-object p2, p0, Lst2;->c:Lx5g;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lst2;->d:Lode;

    new-instance p1, Lab;

    const/16 v0, 0x1c

    invoke-direct {p1, p0, v0}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {p2, p1}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    return-void
.end method
