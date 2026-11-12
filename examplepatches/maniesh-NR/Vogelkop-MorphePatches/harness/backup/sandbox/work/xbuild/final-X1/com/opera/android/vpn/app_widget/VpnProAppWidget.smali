.class public final Lcom/opera/android/vpn/app_widget/VpnProAppWidget;
.super Leif;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/opera/android/vpn/app_widget/VpnProAppWidget;",
        "Leif;",
        "<init>",
        "()V",
        "ien",
        "upj",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic b:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/appwidget/AppWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)I
    .registers 2

    const p0, 0x7f0d02bf

    return p0
.end method

.method public final b(Landroid/content/Context;)V
    .registers 3

    const-class p0, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;

    invoke-static {p1, p0}, Lkfo;->I(Landroid/content/Context;Ljava/lang/Class;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p1

    invoke-virtual {p1, p0}, Lien;->r(I)V

    :cond_1b
    return-void
.end method

.method public final c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .registers 21

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object v2

    invoke-virtual {v2}, Lien;->q()Lg1o;

    move-result-object v2

    iget v3, v2, Lg1o;->d:I

    iget-byte v4, v2, Lg1o;->e:B

    array-length v5, v1

    const/4 v7, 0x0

    :goto_1a
    if-ge v7, v5, :cond_169

    aget v8, v1, v7

    new-instance v9, Landroid/widget/RemoteViews;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v10

    const v11, 0x7f0d02bf

    invoke-direct {v9, v10, v11}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    const/4 v10, 0x2

    const/4 v11, 0x1

    if-eq v4, v11, :cond_34

    if-eq v4, v10, :cond_34

    const v12, 0x7f0806f3

    goto :goto_37

    :cond_34
    const v12, 0x7f0806f4

    :goto_37
    const v13, 0x7f0a08b7

    const-string v14, "setBackgroundResource"

    invoke-virtual {v9, v13, v14, v12}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    invoke-virtual {v2}, Lg1o;->c()I

    move-result v12

    invoke-static {v0, v2, v12}, Lupj;->m(Landroid/content/Context;Lg1o;I)Landroid/app/PendingIntent;

    move-result-object v12

    invoke-virtual {v9, v13, v12}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    iget v12, v2, Lg1o;->a:I

    const v13, 0x7f0a08bc

    invoke-virtual {v9, v13, v14, v12}, Landroid/widget/RemoteViews;->setInt(ILjava/lang/String;I)V

    iget v12, v2, Lg1o;->b:I

    invoke-virtual {v0, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v13, v12}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    iget v14, v2, Lg1o;->c:I

    const/16 v15, 0x1f

    if-lt v12, v15, :cond_69

    const-string v12, "setTextColor"

    invoke-virtual {v9, v13, v12, v14}, Landroid/widget/RemoteViews;->setColor(ILjava/lang/String;I)V

    goto :goto_70

    :cond_69
    invoke-virtual {v0, v14}, Landroid/content/Context;->getColor(I)I

    move-result v12

    invoke-virtual {v9, v13, v12}, Landroid/widget/RemoteViews;->setTextColor(II)V

    :goto_70
    invoke-virtual {v2}, Lg1o;->d()Z

    move-result v12

    const v13, 0x7f08056b

    const v14, 0x7f080375

    if-eqz v12, :cond_f0

    if-eqz v3, :cond_f0

    invoke-virtual {v2}, Lg1o;->d()Z

    move-result v12

    if-nez v12, :cond_86

    move v13, v14

    goto :goto_89

    :cond_86
    if-eqz v3, :cond_89

    move v13, v3

    :cond_89
    :goto_89
    const/high16 v12, 0x41c00000    # 24.0f

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-static {v12, v14}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v12

    invoke-static {v13, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    instance-of v14, v13, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v14, :cond_a2

    check-cast v13, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v13}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v13

    goto :goto_a3

    :cond_a2
    const/4 v13, 0x0

    :goto_a3
    if-nez v13, :cond_ba

    const v13, 0x7f0805c5

    invoke-static {v13, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    sget-object v14, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v13, v12, v12, v14}, Lz5i;->y(Landroid/graphics/drawable/Drawable;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v12

    move/from16 v16, v11

    const/16 p0, 0x0

    :goto_b6
    const v6, 0x7f0a08b8

    goto :goto_ec

    :cond_ba
    new-instance v14, Lhq4;

    const/16 p0, 0x0

    const/4 v6, -0x1

    invoke-direct {v14, v13, v6}, Lhq4;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance v13, Lp05;

    move/from16 v16, v11

    const v11, 0x7f061080

    invoke-virtual {v0, v11}, Landroid/content/Context;->getColor(I)I

    move-result v11

    const/high16 v15, 0x3f800000    # 1.0f

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    invoke-static {v15, v10}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v10

    int-to-float v10, v10

    invoke-direct {v13, v10, v11, v6}, Lp05;-><init>(FII)V

    new-instance v6, Landroid/graphics/drawable/LayerDrawable;

    const/4 v10, 0x2

    new-array v11, v10, [Landroid/graphics/drawable/Drawable;

    aput-object v14, v11, p0

    aput-object v13, v11, v16

    invoke-direct {v6, v11}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    invoke-static {v6, v12, v12}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v12

    goto :goto_b6

    :goto_ec
    invoke-virtual {v9, v6, v12}, Landroid/widget/RemoteViews;->setImageViewBitmap(ILandroid/graphics/Bitmap;)V

    goto :goto_105

    :cond_f0
    move/from16 v16, v11

    const/16 p0, 0x0

    const v6, 0x7f0a08b8

    invoke-virtual {v2}, Lg1o;->d()Z

    move-result v10

    if-nez v10, :cond_ff

    move v13, v14

    goto :goto_102

    :cond_ff
    if-eqz v3, :cond_102

    move v13, v3

    :cond_102
    :goto_102
    invoke-virtual {v9, v6, v13}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    :goto_105
    iget-object v6, v2, Lg1o;->f:Ljava/lang/String;

    if-nez v6, :cond_110

    const v6, 0x7f14139d

    invoke-virtual {v0, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    :cond_110
    const v10, 0x7f0a08bb

    invoke-virtual {v9, v10, v6}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const v6, 0x7f0a08ba

    invoke-virtual {v2, v0}, Lg1o;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v6, v10}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    const/16 v6, 0x8

    move/from16 v10, v16

    if-ne v4, v10, :cond_128

    move v11, v6

    goto :goto_12a

    :cond_128
    move/from16 v11, p0

    :goto_12a
    const v12, 0x7f0a08bd

    invoke-virtual {v9, v12, v11}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    if-ne v4, v10, :cond_134

    move/from16 v6, p0

    :cond_134
    const v11, 0x7f0a08be

    invoke-virtual {v9, v11, v6}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    invoke-virtual {v2}, Lg1o;->b()I

    move-result v6

    invoke-static {v0, v2, v6}, Lupj;->m(Landroid/content/Context;Lg1o;I)Landroid/app/PendingIntent;

    move-result-object v6

    if-ne v4, v10, :cond_14a

    invoke-virtual {v9, v11, v6}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    :goto_147
    move-object/from16 v6, p2

    goto :goto_162

    :cond_14a
    invoke-virtual {v9, v12, v6}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    if-eqz v4, :cond_15b

    if-eq v4, v10, :cond_157

    const/4 v10, 0x2

    if-eq v4, v10, :cond_157

    move/from16 v6, p0

    goto :goto_15e

    :cond_157
    const v6, 0x7f0806f7

    goto :goto_15e

    :cond_15b
    const v6, 0x7f0806f6

    :goto_15e
    invoke-virtual {v9, v12, v6}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    goto :goto_147

    :goto_162
    invoke-virtual {v6, v8, v9}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1a

    :cond_169
    return-void
.end method

.method public final onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Leif;->onAppWidgetOptionsChanged(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILandroid/os/Bundle;)V

    filled-new-array {p3}, [I

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/opera/android/vpn/app_widget/VpnProAppWidget;->c(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V

    return-void
.end method

.method public final onDisabled(Landroid/content/Context;)V
    .registers 2

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lyi2;->m(Z)V

    return-void
.end method

.method public final onEnabled(Landroid/content/Context;)V
    .registers 2

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->S()Lien;

    move-result-object p0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lyi2;->m(Z)V

    return-void
.end method
