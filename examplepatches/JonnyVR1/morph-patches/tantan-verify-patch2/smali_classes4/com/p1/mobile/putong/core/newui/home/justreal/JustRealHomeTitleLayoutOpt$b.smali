.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->q(Ljava/lang/String;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;->a:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt$b;->c:Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->b:Lv/VImage;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOpt;->f()Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
