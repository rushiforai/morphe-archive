.class public Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->P(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/StudentVerificationStatus;Lcom/p1/mobile/putong/data/StudentVerificationStatus;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/data/User;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->h:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$a;->a:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
