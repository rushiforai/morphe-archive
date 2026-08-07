.class public Ll/d550$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d550;->B(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

.field public final synthetic b:Ll/d550;


# direct methods
.method public constructor <init>(Ll/d550;Lcom/tantan/library/svga/compose/SVGADynamicEntity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d550$a;->b:Ll/d550;

    .line 2
    .line 3
    iput-object p2, p0, Ll/d550$a;->a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
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
    iget-object v0, p0, Ll/d550$a;->b:Ll/d550;

    .line 5
    .line 6
    invoke-static {v0}, Ll/d550;->e(Ll/d550;)Lcom/p1/mobile/putong/core/ui/match/MatchAct;

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
    iget-object v1, p0, Ll/d550$a;->a:Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "https://auto.tancdn.com/v1/raw/742c2a25-1a5c-441c-9433-72583a165ddf14.pdf"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, -0x1

    .line 27
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/d550$a$a;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/d550$a$a;-><init>(Ll/d550$a;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Ll/d550$a;->b:Ll/d550;

    .line 46
    .line 47
    invoke-static {p0}, Ll/d550;->c(Ll/d550;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public onStep(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tantan/library/svga/AnimListener;->onStep(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
