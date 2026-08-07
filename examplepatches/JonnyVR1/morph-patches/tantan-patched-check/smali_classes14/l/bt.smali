.class public Ll/bt;
.super Lcom/p1/mobile/putong/app/a;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/app/a;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/account/ui/account/AccountNewCropperAct;->F1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 v0, 0x6000

    .line 8
    .line 9
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(IZZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->b2(Landroid/content/Context;IZZZ)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 p2, 0x312

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e(IZZZI)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->b2(Landroid/content/Context;IZZZ)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p5}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(IZZZLjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->c2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/16 p2, 0x312

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public g(IZZZLjava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static/range {p0 .. p5}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->c2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1, p6}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h(IZZZLcom/p1/mobile/putong/data/Gender;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    sget v6, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    const/4 v8, 0x1

    .line 7
    const/4 v5, 0x0

    .line 8
    move v1, p1

    .line 9
    move v2, p2

    .line 10
    move v3, p3

    .line 11
    move v4, p4

    .line 12
    move-object v9, p5

    .line 13
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/16 p1, 0x312

    .line 18
    .line 19
    invoke-virtual {v0, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public i(IZZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    sget v6, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->C:I

    .line 4
    .line 5
    const/4 v7, 0x0

    .line 6
    const/4 v8, 0x1

    .line 7
    move v1, p1

    .line 8
    move v2, p2

    .line 9
    move v3, p3

    .line 10
    move v4, p4

    .line 11
    move-object v9, p5

    .line 12
    move-object/from16 v5, p6

    .line 13
    .line 14
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->e2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/16 p1, 0x312

    .line 19
    .line 20
    invoke-virtual {v0, p0, p1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public m(Z)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/a;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, -0x1

    .line 6
    invoke-static {p0, v2, p1, v0, v1}, Lcom/p1/mobile/putong/account/ui/mediapicker/impl/AccountMediaPickerAct;->b2(Landroid/content/Context;IZZZ)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/16 v0, 0x312

    .line 11
    .line 12
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
