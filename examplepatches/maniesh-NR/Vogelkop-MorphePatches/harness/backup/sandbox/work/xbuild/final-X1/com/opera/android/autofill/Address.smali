.class public final Lcom/opera/android/autofill/Address;
.super Lcom/opera/android/autofill/AutofillItem;
.source "SourceFile"


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;

.field public final m:Ljava/lang/String;

.field public final n:Ljava/lang/String;

.field public final o:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 16

    invoke-direct/range {p0 .. p1}, Lcom/opera/android/autofill/AutofillItem;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/autofill/Address;->c:Ljava/lang/String;

    iput-object p4, p0, Lcom/opera/android/autofill/Address;->d:Ljava/lang/String;

    iput-object p5, p0, Lcom/opera/android/autofill/Address;->e:Ljava/lang/String;

    iput-object p6, p0, Lcom/opera/android/autofill/Address;->f:Ljava/lang/String;

    iput-object p7, p0, Lcom/opera/android/autofill/Address;->g:Ljava/lang/String;

    iput-object p8, p0, Lcom/opera/android/autofill/Address;->h:Ljava/lang/String;

    iput-object p9, p0, Lcom/opera/android/autofill/Address;->i:Ljava/lang/String;

    iput-object p10, p0, Lcom/opera/android/autofill/Address;->j:Ljava/lang/String;

    iput-object p11, p0, Lcom/opera/android/autofill/Address;->k:Ljava/lang/String;

    iput-object p12, p0, Lcom/opera/android/autofill/Address;->l:Ljava/lang/String;

    iput-object p13, p0, Lcom/opera/android/autofill/Address;->m:Ljava/lang/String;

    iput-object p14, p0, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    iput-boolean p15, p0, Lcom/opera/android/autofill/Address;->o:Z

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/opera/android/autofill/Address;
    .registers 31
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p9    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p10    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p11    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p12    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p13    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/opera/android/autofill/Address;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move-object/from16 v12, p11

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    move/from16 v15, p14

    invoke-direct/range {v0 .. v15}, Lcom/opera/android/autofill/Address;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method


# virtual methods
.method public final getCompanyName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final getCountryCode()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->j:Ljava/lang/String;

    return-object p0
.end method

.method public final getDependentLocality()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final getEmailAddress()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->l:Ljava/lang/String;

    return-object p0
.end method

.method public final getFullName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final getLanguageCode()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->m:Ljava/lang/String;

    return-object p0
.end method

.method public final getLocality()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->f:Ljava/lang/String;

    return-object p0
.end method

.method public final getPhoneNumber()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->k:Ljava/lang/String;

    return-object p0
.end method

.method public final getPostalCode()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->h:Ljava/lang/String;

    return-object p0
.end method

.method public final getRegion()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->e:Ljava/lang/String;

    return-object p0
.end method

.method public final getSortingCode()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->i:Ljava/lang/String;

    return-object p0
.end method

.method public final getStreetAddress()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final isContactInfo()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/autofill/Address;->o:Z

    return p0
.end method
