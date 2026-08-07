.class public Ll/och0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/och0;->c(Lcom/p1/mobile/android/app/Act;Ll/jch0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/SurpriseGift;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/jch0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Ll/jch0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/och0$a;->a:Ll/jch0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/och0$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/och0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/och0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/och0$a;->a:Ll/jch0;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/och0$a;->a:Ll/jch0;

    .line 15
    .line 16
    iget-object v1, p0, Ll/och0$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    new-instance v2, Ll/mch0;

    .line 19
    .line 20
    invoke-direct {v2, v1, p1}, Ll/mch0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/och0$a;->a:Ll/jch0;

    .line 27
    .line 28
    iget-object p0, p0, Ll/och0$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    new-instance v1, Ll/nch0;

    .line 31
    .line 32
    invoke-direct {v1, p0, p1}, Ll/nch0;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ll/jch0;->H(Ll/x20;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    iget-object p0, p0, Ll/och0$a;->b:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {p0, p1}, Ll/och0;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/och0$a;->c(Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
