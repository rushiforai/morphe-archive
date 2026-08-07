.class public Lcom/uuzuche/lib_zxing/activity/CaptureActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"


# instance fields
.field c:Ll/ic5;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/uuzuche/lib_zxing/activity/CaptureActivity$b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/uuzuche/lib_zxing/activity/CaptureActivity$b;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureActivity;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureActivity;->c:Ll/ic5;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/bfc0;->a:I

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;

    .line 10
    .line 11
    invoke-direct {p1}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/uuzuche/lib_zxing/activity/CaptureActivity;->c:Ll/ic5;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->b4(Ll/ic5;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v1, Ll/pdc0;->e:I

    .line 28
    .line 29
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/k;->s(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroidx/fragment/app/k;->i()I

    .line 34
    .line 35
    .line 36
    new-instance v0, Lcom/uuzuche/lib_zxing/activity/CaptureActivity$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Lcom/uuzuche/lib_zxing/activity/CaptureActivity$a;-><init>(Lcom/uuzuche/lib_zxing/activity/CaptureActivity;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/uuzuche/lib_zxing/activity/CaptureFragment;->c4(Lcom/uuzuche/lib_zxing/activity/CaptureFragment$b;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
