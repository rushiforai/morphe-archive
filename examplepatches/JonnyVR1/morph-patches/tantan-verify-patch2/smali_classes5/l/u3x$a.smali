.class public Ll/u3x$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u3x;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u3x;


# direct methods
.method public constructor <init>(Ll/u3x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u3x$a;->a:Ll/u3x;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->datingPurposePopup:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 12
    .line 13
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/u3x$a;->a:Ll/u3x;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/u3x;->dismiss()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
