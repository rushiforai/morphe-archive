.class public final Lm09;
.super Lp09;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "TOGGLE"

    const/4 v1, 0x3

    invoke-direct {p0, v0, v1}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;
    .registers 2

    const/4 p0, 0x0

    return-object p0
.end method
