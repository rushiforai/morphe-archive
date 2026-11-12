.class public final Lmu2;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lgjm;

.field public final c:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

.field public final d:Lx5g;

.field public final e:Lode;

.field public f:La4g;


# direct methods
.method public constructor <init>(Lgjm;Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;Lx5g;)V
    .registers 4

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lmu2;->b:Lgjm;

    iput-object p2, p0, Lmu2;->c:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    iput-object p3, p0, Lmu2;->d:Lx5g;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lmu2;->e:Lode;

    new-instance p1, Liu2;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p1}, Lx5g;->b(Lx5g;Lcom/opera/api/Callback;)V

    return-void
.end method
