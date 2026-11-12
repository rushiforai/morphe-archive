.class public final Ld16;
.super Lk2g;
.source "SourceFile"


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Ld16;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final c:[Lvz8;

.field public final d:Lj2g;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhh3;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lhh3;-><init>(B)V

    sput-object v0, Ld16;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>([Lvz8;Lj2g;)V
    .registers 3

    invoke-direct {p0}, Lk2g;-><init>()V

    iput-object p1, p0, Ld16;->c:[Lvz8;

    iput-object p2, p0, Ld16;->d:Lj2g;

    return-void
.end method


# virtual methods
.method public final a()Lj2g;
    .registers 1

    iget-object p0, p0, Ld16;->d:Lj2g;

    return-object p0
.end method

.method public final b()[Lvz8;
    .registers 1

    iget-object p0, p0, Ld16;->c:[Lvz8;

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Z)Landroid/service/autofill/Dataset;
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    if-eqz p2, :cond_b

    move-object/from16 v4, p2

    goto :goto_c

    :cond_b
    const/4 v4, 0x0

    :goto_c
    const-string v5, ""

    if-eqz v4, :cond_213

    const/4 v6, 0x0

    const/16 v7, 0x1e

    const/high16 v8, 0x12000000

    const-string v9, "com.opera.android.autofill.EXTRA_BUNDLE"

    const-class v10, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    const-string v11, "com.opera.android.autofill.EXTRA_INLINE_SPEC"

    const-string v12, "com.opera.android.autofill.EXTRA_DATA"

    const-string v13, "com.opera.android.autofill.EXTRA_PARTITION"

    if-eqz v2, :cond_50

    new-instance v14, Le16;

    sget v15, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v15, Landroid/os/Bundle;

    invoke-direct {v15}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v15, v13, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v15, v12, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const/16 v16, 0x0

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v3, v7, :cond_39

    invoke-virtual {v15, v11, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_39
    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, v1, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v7, "com.opera.android.autofill.ACTION_EDIT_PASSWORD"

    invoke-virtual {v3, v7}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3, v9, v15}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v3

    invoke-static {v1, v6, v3, v8}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    invoke-direct {v14, v2, v3}, Le16;-><init>(Landroid/widget/inline/InlinePresentationSpec;Landroid/app/PendingIntent;)V

    goto :goto_54

    :cond_50
    const/16 v16, 0x0

    move-object/from16 v14, v16

    :goto_54
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_60

    move-object v5, v7

    :cond_60
    iget-object v7, v0, Ld16;->c:[Lvz8;

    array-length v15, v7

    move v8, v6

    :goto_64
    if-ge v8, v15, :cond_17f

    aget-object v6, v7, v8

    move-object/from16 v23, v7

    iget-object v7, v6, Lvz8;->c:Lnf2;

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    packed-switch v7, :pswitch_data_21a

    invoke-static {}, Lh9o;->p()V

    return-object v16

    :pswitch_77
    invoke-interface {v4}, Lr3g;->getPassword()Ljava/lang/String;

    move-result-object v7

    goto :goto_83

    :pswitch_7c
    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v7

    goto :goto_83

    :pswitch_81
    move-object/from16 v7, v16

    :goto_83
    new-instance v17, Log6;

    move/from16 v24, v8

    iget-object v8, v6, Lvz8;->d:Lp09;

    invoke-virtual {v8, v7}, Lp09;->d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;

    move-result-object v19

    new-instance v7, Landroid/widget/RemoteViews;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v18, v6

    const v6, 0x7f0d02b0

    invoke-direct {v7, v8, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v6

    const v8, 0x7f0a0a94

    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    invoke-static {v1, v4}, Lsfe;->a0(Landroid/content/Context;Lr3g;)Landroid/graphics/drawable/Icon;

    move-result-object v6

    const v8, 0x7f0a0322

    invoke-virtual {v7, v8, v6}, Landroid/widget/RemoteViews;->setImageViewIcon(ILandroid/graphics/drawable/Icon;)V

    new-instance v6, Landroid/widget/RemoteViews;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v22, v7

    const v7, 0x7f0d02ae

    invoke-direct {v6, v8, v7}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v7

    const v8, 0x7f1402ac

    if-eqz v7, :cond_d0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v25

    if-eqz v25, :cond_d0

    :goto_cc
    const v8, 0x7f0a0a94

    goto :goto_d5

    :cond_d0
    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_cc

    :goto_d5
    invoke-virtual {v6, v8, v7}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    invoke-static {v1, v4}, Lsfe;->a0(Landroid/content/Context;Lr3g;)Landroid/graphics/drawable/Icon;

    move-result-object v7

    const v8, 0x7f0a0322

    invoke-virtual {v6, v8, v7}, Landroid/widget/RemoteViews;->setImageViewIcon(ILandroid/graphics/drawable/Icon;)V

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1e

    if-lt v7, v8, :cond_161

    if-eqz v14, :cond_161

    iget-object v7, v14, Le16;->a:Landroid/widget/inline/InlinePresentationSpec;

    if-eqz v7, :cond_161

    iget-object v8, v14, Le16;->b:Landroid/app/PendingIntent;

    move-object/from16 v21, v6

    new-instance v6, Lx79;

    invoke-direct {v6, v8}, Lx79;-><init>(Landroid/app/PendingIntent;)V

    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_103

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v25

    if-nez v25, :cond_10c

    :cond_103
    const v8, 0x7f1402ac

    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v8, v20

    :cond_10c
    iput-object v8, v6, Lx79;->d:Ljava/lang/Object;

    invoke-interface {v4}, Lr3g;->R0()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_11a

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v20

    if-nez v20, :cond_121

    :cond_11a
    const v8, 0x7f1402ac

    invoke-virtual {v1, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    :cond_121
    iput-object v8, v6, Lx79;->e:Ljava/lang/Object;

    invoke-interface {v4}, Lr3g;->o()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v25, v14

    const-string v14, "android"

    move/from16 v26, v15

    const/4 v15, 0x0

    invoke-static {v8, v14, v15}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_149

    invoke-interface {v4}, Lr3g;->o()Ljava/lang/String;

    move-result-object v8

    invoke-static {v1, v8}, Lrab;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v8

    if-eqz v8, :cond_149

    invoke-static {v8}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v8

    sget-object v14, Landroid/graphics/PorterDuff$Mode;->DST:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v8, v14}, Landroid/graphics/drawable/Icon;->setTintMode(Landroid/graphics/PorterDuff$Mode;)Landroid/graphics/drawable/Icon;

    move-result-object v8

    goto :goto_150

    :cond_149
    const v8, 0x7f0805c7

    invoke-static {v1, v8}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v8

    :goto_150
    iput-object v8, v6, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {v6}, Lx79;->j()Lh8b;

    move-result-object v6

    iget-object v6, v6, Lh8b;->a:Landroid/app/slice/Slice;

    invoke-static {v6, v7}, Ldz0;->a(Landroid/app/slice/Slice;Landroid/widget/inline/InlinePresentationSpec;)Landroid/service/autofill/InlinePresentation;

    move-result-object v6

    move-object/from16 v20, v22

    move-object/from16 v22, v6

    goto :goto_16c

    :cond_161
    move-object/from16 v21, v6

    move-object/from16 v25, v14

    move/from16 v26, v15

    const/4 v15, 0x0

    move-object/from16 v20, v22

    move-object/from16 v22, v16

    :goto_16c
    invoke-direct/range {v17 .. v22}, Log6;-><init>(Lvz8;Landroid/view/autofill/AutofillValue;Landroid/widget/RemoteViews;Landroid/widget/RemoteViews;Landroid/service/autofill/InlinePresentation;)V

    move-object/from16 v6, v17

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v24, 0x1

    move v6, v15

    move-object/from16 v7, v23

    move-object/from16 v14, v25

    move/from16 v15, v26

    goto/16 :goto_64

    :cond_17f
    move v15, v6

    if-nez p4, :cond_1cc

    invoke-interface {v4}, Lr3g;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    sget v7, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v7, v13, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v7, v12, v4}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1e

    if-lt v0, v8, :cond_1a0

    invoke-virtual {v7, v11, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_1a0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, v1, v10}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.opera.android.autofill.ACTION_AUTHORIZE"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0, v9, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0x800000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0x10000

    invoke-virtual {v0, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/high16 v2, 0x12000000

    invoke-static {v1, v6, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v0

    goto :goto_1ce

    :cond_1cc
    move-object/from16 v0, v16

    :goto_1ce
    new-instance v1, Landroid/service/autofill/Dataset$Builder;

    invoke-direct {v1}, Landroid/service/autofill/Dataset$Builder;-><init>()V

    invoke-virtual {v1, v5}, Landroid/service/autofill/Dataset$Builder;->setId(Ljava/lang/String;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/service/autofill/Dataset$Builder;->setAuthentication(Landroid/content/IntentSender;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v0

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    move v6, v15

    :goto_1e0
    if-ge v6, v1, :cond_20e

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v6, v6, 0x1

    check-cast v2, Log6;

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x21

    if-lt v4, v5, :cond_1f4

    invoke-static {v0, v2}, Lt8;->e(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_1e0

    :cond_1f4
    const/16 v5, 0x1f

    if-lt v4, v5, :cond_1fc

    invoke-static {v0, v2}, Lr9n;->a(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_1e0

    :cond_1fc
    const/16 v8, 0x1e

    if-lt v4, v8, :cond_204

    invoke-static {v0, v2}, Lr9n;->c(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_1e0

    :cond_204
    iget-object v4, v2, Log6;->a:Lvz8;

    iget-object v4, v4, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iget-object v2, v2, Log6;->b:Landroid/view/autofill/AutofillValue;

    invoke-virtual {v0, v4, v2}, Landroid/service/autofill/Dataset$Builder;->setValue(Landroid/view/autofill/AutofillId;Landroid/view/autofill/AutofillValue;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_1e0

    :cond_20e
    invoke-virtual {v0}, Landroid/service/autofill/Dataset$Builder;->build()Landroid/service/autofill/Dataset;

    move-result-object v0

    return-object v0

    :cond_213
    const/16 v16, 0x0

    invoke-static {v5}, Lqp2;->n(Ljava/lang/String;)V

    return-object v16

    nop

    :pswitch_data_21a
    .packed-switch 0x0
        :pswitch_81
        :pswitch_81
        :pswitch_81
        :pswitch_7c
        :pswitch_81
        :pswitch_77
        :pswitch_7c
        :pswitch_81
        :pswitch_81
        :pswitch_81
        :pswitch_7c
        :pswitch_77
        :pswitch_81
    .end packed-switch
.end method

.method public final d(Landroid/content/Context;Landroid/widget/inline/InlinePresentationSpec;)Ljava/lang/Iterable;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    sget v3, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v4, "com.opera.android.autofill.EXTRA_PARTITION"

    invoke-virtual {v3, v4, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    invoke-direct {v4, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v6, "com.opera.android.autofill.ACTION_VIEW_ALL"

    invoke-virtual {v4, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const-string v6, "com.opera.android.autofill.EXTRA_BUNDLE"

    invoke-virtual {v4, v6, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v3

    const/4 v4, 0x0

    const/high16 v6, 0x12000000

    invoke-static {v1, v4, v3, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, v0, Ld16;->c:[Lvz8;

    array-length v8, v0

    move v9, v4

    :goto_35
    const/16 v10, 0x1e

    const/4 v11, 0x0

    if-ge v9, v8, :cond_ac

    aget-object v13, v0, v9

    if-eqz v2, :cond_44

    new-instance v12, Ly4n;

    invoke-direct {v12, v2, v3}, Ly4n;-><init>(Landroid/widget/inline/InlinePresentationSpec;Landroid/app/PendingIntent;)V

    goto :goto_45

    :cond_44
    move-object v12, v11

    :goto_45
    new-instance v14, Log6;

    iget-object v15, v13, Lvz8;->d:Lp09;

    invoke-virtual {v15, v11}, Lp09;->d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;

    move-result-object v15

    move-object/from16 v16, v14

    move-object v14, v15

    new-instance v15, Landroid/widget/RemoteViews;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const v4, 0x7f0d03ab

    invoke-direct {v15, v11, v4}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    new-instance v4, Landroid/widget/RemoteViews;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const v6, 0x7f0d03aa

    invoke-direct {v4, v11, v6}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v6, v10, :cond_9e

    if-eqz v12, :cond_9e

    iget-object v6, v12, Ly4n;->a:Landroid/widget/inline/InlinePresentationSpec;

    if-eqz v6, :cond_9e

    const v10, 0x7f1402af

    invoke-virtual {v1, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v12, Ly4n;->b:Landroid/app/PendingIntent;

    new-instance v12, Lx79;

    invoke-direct {v12, v11}, Lx79;-><init>(Landroid/app/PendingIntent;)V

    iput-object v10, v12, Lx79;->d:Ljava/lang/Object;

    iput-object v10, v12, Lx79;->e:Ljava/lang/Object;

    const v10, 0x7f0805e5

    invoke-static {v1, v10}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v10

    iput-object v10, v12, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {v12}, Lx79;->j()Lh8b;

    move-result-object v10

    iget-object v10, v10, Lh8b;->a:Landroid/app/slice/Slice;

    invoke-static {v10, v6}, Ldz0;->a(Landroid/app/slice/Slice;Landroid/widget/inline/InlinePresentationSpec;)Landroid/service/autofill/InlinePresentation;

    move-result-object v11

    move-object/from16 v17, v11

    move-object/from16 v12, v16

    :goto_9b
    move-object/from16 v16, v4

    goto :goto_a3

    :cond_9e
    move-object/from16 v12, v16

    const/16 v17, 0x0

    goto :goto_9b

    :goto_a3
    invoke-direct/range {v12 .. v17}, Log6;-><init>(Lvz8;Landroid/view/autofill/AutofillValue;Landroid/widget/RemoteViews;Landroid/widget/RemoteViews;Landroid/service/autofill/InlinePresentation;)V

    invoke-virtual {v7, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    goto :goto_35

    :cond_ac
    invoke-virtual {v3}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v3

    new-instance v4, Landroid/service/autofill/Dataset$Builder;

    invoke-direct {v4}, Landroid/service/autofill/Dataset$Builder;-><init>()V

    const-string v6, "view-all"

    invoke-virtual {v4, v6}, Landroid/service/autofill/Dataset$Builder;->setId(Ljava/lang/String;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/service/autofill/Dataset$Builder;->setAuthentication(Landroid/content/IntentSender;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v3

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v6, 0x0

    :goto_c4
    const/16 v8, 0x1f

    const/16 v9, 0x21

    if-ge v6, v4, :cond_f0

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v6, v6, 0x1

    check-cast v11, Log6;

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v12, v9, :cond_da

    invoke-static {v3, v11}, Lt8;->e(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_c4

    :cond_da
    if-lt v12, v8, :cond_e0

    invoke-static {v3, v11}, Lr9n;->a(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_c4

    :cond_e0
    if-lt v12, v10, :cond_e6

    invoke-static {v3, v11}, Lr9n;->c(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_c4

    :cond_e6
    iget-object v8, v11, Log6;->a:Lvz8;

    iget-object v8, v8, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iget-object v9, v11, Log6;->b:Landroid/view/autofill/AutofillValue;

    invoke-virtual {v3, v8, v9}, Landroid/service/autofill/Dataset$Builder;->setValue(Landroid/view/autofill/AutofillId;Landroid/view/autofill/AutofillValue;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_c4

    :cond_f0
    invoke-virtual {v3}, Landroid/service/autofill/Dataset$Builder;->build()Landroid/service/autofill/Dataset;

    move-result-object v3

    sget v4, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    new-instance v4, Landroid/content/Intent;

    invoke-direct {v4, v1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v5, "com.opera.android.autofill.ACTION_OPEN_APP"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v4

    const/4 v5, 0x0

    const/high16 v6, 0x12000000

    invoke-static {v1, v5, v4, v6}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v4

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    array-length v7, v0

    move v11, v5

    :goto_10f
    if-ge v11, v7, :cond_16c

    aget-object v13, v0, v11

    if-eqz v2, :cond_11b

    new-instance v12, Lyff;

    invoke-direct {v12, v2, v4}, Lyff;-><init>(Landroid/widget/inline/InlinePresentationSpec;Landroid/app/PendingIntent;)V

    goto :goto_11c

    :cond_11b
    const/4 v12, 0x0

    :goto_11c
    new-instance v14, Log6;

    iget-object v15, v13, Lvz8;->d:Lp09;

    const/4 v5, 0x0

    invoke-virtual {v15, v5}, Lp09;->d(Ljava/lang/String;)Landroid/view/autofill/AutofillValue;

    move-result-object v15

    move-object/from16 v16, v14

    move-object v14, v15

    new-instance v15, Landroid/widget/RemoteViews;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const v8, 0x7f0d011b

    invoke-direct {v15, v5, v8}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v10, :cond_15d

    if-eqz v12, :cond_15d

    iget-object v5, v12, Lyff;->a:Landroid/widget/inline/InlinePresentationSpec;

    if-eqz v5, :cond_15d

    iget-object v8, v12, Lyff;->b:Landroid/app/PendingIntent;

    new-instance v12, Lx79;

    invoke-direct {v12, v8}, Lx79;-><init>(Landroid/app/PendingIntent;)V

    const v8, 0x7f0803a1

    invoke-static {v1, v8}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v8

    iput-object v8, v12, Lx79;->c:Ljava/lang/Object;

    invoke-virtual {v12}, Lx79;->j()Lh8b;

    move-result-object v8

    iget-object v8, v8, Lh8b;->a:Landroid/app/slice/Slice;

    invoke-static {v8, v5}, Ldz0;->e(Landroid/app/slice/Slice;Landroid/widget/inline/InlinePresentationSpec;)Landroid/service/autofill/InlinePresentation;

    move-result-object v5

    move-object/from16 v17, v5

    move-object/from16 v12, v16

    goto :goto_161

    :cond_15d
    move-object/from16 v12, v16

    const/16 v17, 0x0

    :goto_161
    const/16 v16, 0x0

    invoke-direct/range {v12 .. v17}, Log6;-><init>(Lvz8;Landroid/view/autofill/AutofillValue;Landroid/widget/RemoteViews;Landroid/widget/RemoteViews;Landroid/service/autofill/InlinePresentation;)V

    invoke-virtual {v6, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_10f

    :cond_16c
    invoke-virtual {v4}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v0

    new-instance v1, Landroid/service/autofill/Dataset$Builder;

    invoke-direct {v1}, Landroid/service/autofill/Dataset$Builder;-><init>()V

    const-string v2, "app"

    invoke-virtual {v1, v2}, Landroid/service/autofill/Dataset$Builder;->setId(Ljava/lang/String;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/service/autofill/Dataset$Builder;->setAuthentication(Landroid/content/IntentSender;)Landroid/service/autofill/Dataset$Builder;

    move-result-object v0

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v4, 0x0

    :goto_184
    if-ge v4, v1, :cond_1ae

    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Log6;

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v5, v9, :cond_196

    invoke-static {v0, v2}, Lt8;->e(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_184

    :cond_196
    const/16 v7, 0x1f

    if-lt v5, v7, :cond_19e

    invoke-static {v0, v2}, Lr9n;->a(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_184

    :cond_19e
    if-lt v5, v10, :cond_1a4

    invoke-static {v0, v2}, Lr9n;->c(Landroid/service/autofill/Dataset$Builder;Log6;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_184

    :cond_1a4
    iget-object v5, v2, Log6;->a:Lvz8;

    iget-object v5, v5, Lvz8;->a:Landroid/view/autofill/AutofillId;

    iget-object v2, v2, Log6;->b:Landroid/view/autofill/AutofillValue;

    invoke-virtual {v0, v5, v2}, Landroid/service/autofill/Dataset$Builder;->setValue(Landroid/view/autofill/AutofillId;Landroid/view/autofill/AutofillValue;)Landroid/service/autofill/Dataset$Builder;

    goto :goto_184

    :cond_1ae
    invoke-virtual {v0}, Landroid/service/autofill/Dataset$Builder;->build()Landroid/service/autofill/Dataset;

    move-result-object v0

    filled-new-array {v3, v0}, [Landroid/service/autofill/Dataset;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    return-object v0
.end method

.method public final describeContents()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .registers 7

    iget-object v0, p0, Ld16;->c:[Lvz8;

    array-length v1, v0

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    const/4 v2, 0x0

    :goto_7
    if-eq v2, v1, :cond_11

    aget-object v3, v0, v2

    invoke-virtual {p1, v3, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_11
    iget-object p0, p0, Ld16;->d:Lj2g;

    invoke-virtual {p1, p0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
