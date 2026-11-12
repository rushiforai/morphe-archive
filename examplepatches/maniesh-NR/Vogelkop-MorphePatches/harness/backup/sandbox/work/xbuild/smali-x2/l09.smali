.class public final Ll09;
.super Lp09;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "TEXT"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;
    .registers 3

    const/4 p0, 0x0

    if-eqz p1, :cond_5

    move-object v0, p1

    goto :goto_6

    :cond_5
    move-object v0, p0

    :goto_6
    if-eqz v0, :cond_c

    invoke-static {p1}, Landroid/view/autofill/AutofillValue;->forText(Ljava/lang/CharSequence;)Landroid/view/autofill/AutofillValue;

    move-result-object p0

    :cond_c
    return-object p0
.end method
