.class public Ll/uyf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/fake/FakeHoldFragment$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uyf;->B()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/uyf;


# direct methods
.method public constructor <init>(Ll/uyf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uyf$a;->a:Ll/uyf;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/uyf$a;->a:Ll/uyf;

    .line 2
    .line 3
    iget-object p2, p2, Ll/lyf;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/act/FakeUploadPhotoAct;->Z1(Landroid/content/Context;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/uyf$a;->a:Ll/uyf;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/uyf;->dismiss()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onError()V
    .locals 0

    .line 1
    return-void
.end method
