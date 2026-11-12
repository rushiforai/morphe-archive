.class public Lorg/chromium/components/autofill/AutofillAddressUiComponent;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Z

.field public final d:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;ZZ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->a:I

    iput-object p2, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->b:Ljava/lang/String;

    iput-boolean p3, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->c:Z

    iput-boolean p4, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->d:Z

    return-void
.end method


# virtual methods
.method public final getFieldType()I
    .registers 1

    iget p0, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->a:I

    return p0
.end method

.method public final getLabel()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final isFullLine()Z
    .registers 1

    iget-boolean p0, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->d:Z

    return p0
.end method

.method public final isRequired()Z
    .registers 1

    iget-boolean p0, p0, Lorg/chromium/components/autofill/AutofillAddressUiComponent;->c:Z

    return p0
.end method
