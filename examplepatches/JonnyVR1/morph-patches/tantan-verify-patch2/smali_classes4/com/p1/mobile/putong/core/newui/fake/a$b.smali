.class public Lcom/p1/mobile/putong/core/newui/fake/a$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/fake/a;->show()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b;->a:Lcom/p1/mobile/putong/core/newui/fake/a;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b;->a:Lcom/p1/mobile/putong/core/newui/fake/a;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/fake/a;->t(Lcom/p1/mobile/putong/core/newui/fake/a;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, -0x1

    .line 15
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "https://auto.tancdn.com/v1/raw/69ed17b0-409a-4fe3-a99a-059ff307359c14.pdf"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Lcom/p1/mobile/putong/core/newui/fake/a$b$a;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/fake/a$b$a;-><init>(Lcom/p1/mobile/putong/core/newui/fake/a$b;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b;->a:Lcom/p1/mobile/putong/core/newui/fake/a;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
