.class public Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->Z(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ll/aoh0;ILl/jm50;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->s(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;Ll/lb2;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->i(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->a:Ljava/util/List;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$e;->J(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt$c;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->l(Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/CardIntlPictureViewOpt;->d0(IZ)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
