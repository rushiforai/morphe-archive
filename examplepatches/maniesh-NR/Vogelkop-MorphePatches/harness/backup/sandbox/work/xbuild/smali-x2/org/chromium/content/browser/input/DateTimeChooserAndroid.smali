.class public final Lorg/chromium/content/browser/input/DateTimeChooserAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Ltn;


# direct methods
.method public constructor <init>(Landroid/content/Context;J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->a:J

    new-instance p2, Ltn;

    new-instance p3, Lga6;

    const/4 v0, 0x1

    invoke-direct {p3, p0, v0}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p1, p2, Ltn;->b:Ljava/lang/Object;

    iput-object p3, p2, Ltn;->d:Ljava/lang/Object;

    iput-object p2, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->b:Ltn;

    return-void
.end method

.method public static createDateTimeChooser(Lorg/chromium/ui/base/WindowAndroid;JIDDDD[Lorg/chromium/content/browser/picker/DateTimeSuggestion;)Lorg/chromium/content/browser/input/DateTimeChooserAndroid;
    .registers 27

    iget-object p0, p0, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    if-eqz p0, :cond_b0

    invoke-static {p0}, Lt8;->d(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_b0

    new-instance v12, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;

    move-wide v0, p1

    invoke-direct {v12, p0, v0, v1}, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;-><init>(Landroid/content/Context;J)V

    iget-object v0, v12, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->b:Ltn;

    invoke-virtual {v0}, Ltn;->v()V

    if-nez p12, :cond_2b

    move/from16 v1, p3

    move-wide/from16 v2, p4

    move-wide/from16 v4, p6

    move-wide/from16 v6, p8

    move-wide/from16 v8, p10

    invoke-virtual/range {v0 .. v9}, Ltn;->J(IDDDD)V

    return-object v12

    :cond_2b
    new-instance p0, Landroid/widget/ListView;

    iget-object v1, v0, Ltn;->b:Ljava/lang/Object;

    move-object v13, v1

    check-cast v13, Landroid/content/Context;

    invoke-direct {p0, v13}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    new-instance v2, Lth6;

    invoke-static/range {p12 .. p12}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v2, v13, v1}, Lth6;-><init>(Landroid/content/Context;Ljava/util/List;)V

    invoke-virtual {p0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    move-object v1, v0

    new-instance v0, Lp8b;

    move/from16 v3, p3

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move-wide/from16 v8, p8

    move-wide/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lp8b;-><init>(Ltn;Lth6;IDDDD)V

    invoke-virtual {p0, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const/16 v0, 0xc

    if-ne v3, v0, :cond_5c

    const v0, 0x7f141283

    goto :goto_7b

    :cond_5c
    const/16 v0, 0x9

    if-eq v3, v0, :cond_78

    const/16 v0, 0xa

    if-eq v3, v0, :cond_78

    const/16 v0, 0xb

    if-ne v3, v0, :cond_6c

    const v0, 0x7f140a58

    goto :goto_7b

    :cond_6c
    const/16 v0, 0xd

    if-ne v3, v0, :cond_74

    const v0, 0x7f1415a2

    goto :goto_7b

    :cond_74
    const v0, 0x7f140550

    goto :goto_7b

    :cond_78
    const v0, 0x7f140551

    :goto_7b
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, v13}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x1040000

    invoke-virtual {v13, v0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    new-instance v2, Lq8b;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lq8b;-><init>(Ltn;B)V

    invoke-virtual {p0, v0, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    iput-object p0, v1, Ltn;->c:Ljava/lang/Object;

    new-instance v0, Lr8b;

    invoke-direct {v0, v1}, Lr8b;-><init>(Ltn;)V

    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iput-boolean v3, v1, Ltn;->a:Z

    iget-object p0, v1, Ltn;->c:Ljava/lang/Object;

    check-cast p0, Landroid/app/AlertDialog;

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    return-object v12

    :cond_b0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static createSuggestionsArray(I)[Lorg/chromium/content/browser/picker/DateTimeSuggestion;
    .registers 1

    new-array p0, p0, [Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    return-object p0
.end method

.method public static setDateTimeSuggestionAt([Lorg/chromium/content/browser/picker/DateTimeSuggestion;IDLjava/lang/String;Ljava/lang/String;)V
    .registers 7

    new-instance v0, Lorg/chromium/content/browser/picker/DateTimeSuggestion;

    invoke-direct {v0, p4, p2, p3, p5}, Lorg/chromium/content/browser/picker/DateTimeSuggestion;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    aput-object v0, p0, p1

    return-void
.end method


# virtual methods
.method public final dismissAndDestroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->a:J

    iget-object p0, p0, Lorg/chromium/content/browser/input/DateTimeChooserAndroid;->b:Ltn;

    invoke-virtual {p0}, Ltn;->v()V

    return-void
.end method
