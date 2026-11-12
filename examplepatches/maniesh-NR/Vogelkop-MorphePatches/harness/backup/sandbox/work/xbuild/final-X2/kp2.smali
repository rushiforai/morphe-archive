.class public final Lkp2;
.super Liq2;
.source "SourceFile"


# instance fields
.field public final L:Lorm;


# direct methods
.method public constructor <init>(Lorm;Lcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V
    .registers 11

    const v1, 0x7f1401fa

    const/4 v2, 0x0

    move-object v0, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Liq2;-><init>(IILcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V

    iput-object p1, v0, Lkp2;->L:Lorm;

    return-void
.end method
