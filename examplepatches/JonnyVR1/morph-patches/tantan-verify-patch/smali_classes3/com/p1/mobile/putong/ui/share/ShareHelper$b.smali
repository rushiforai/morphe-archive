.class public Lcom/p1/mobile/putong/ui/share/ShareHelper$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g3f0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/share/ShareHelper;->B0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/ui/share/ShareHelper$c;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/wc80;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->J(Lcom/p1/mobile/putong/ui/share/ShareHelper;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 12
    .line 13
    const-string v0, "error"

    .line 14
    .line 15
    invoke-static {p0, p1, v0, p2}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->L(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public b(Ll/wc80;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->J(Lcom/p1/mobile/putong/ui/share/ShareHelper;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->J(Lcom/p1/mobile/putong/ui/share/ShareHelper;)Lrx/subjects/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 22
    .line 23
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->M(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 27
    .line 28
    const-string v0, "complete"

    .line 29
    .line 30
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->K(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public c(Ll/wc80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->J(Lcom/p1/mobile/putong/ui/share/ShareHelper;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/share/ShareHelper$b;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    .line 11
    .line 12
    const-string v0, "cancel"

    .line 13
    .line 14
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->K(Lcom/p1/mobile/putong/ui/share/ShareHelper;Ll/wc80;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
