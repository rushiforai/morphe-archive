.class public Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;->f(Lv/VImage;IIILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic e:Lv/VImage;

.field public final synthetic f:I

.field public final synthetic g:I

.field public final synthetic h:I

.field public final synthetic i:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;Lv/VImage;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->i:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->e:Lv/VImage;

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->f:I

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->g:I

    .line 8
    .line 9
    iput p5, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->h:I

    .line 10
    .line 11
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public g(Landroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->i:Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->e:Lv/VImage;

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->f:I

    .line 6
    .line 7
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->g:I

    .line 8
    .line 9
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->h:I

    .line 10
    .line 11
    sget p0, Ll/qa00;->t:I

    .line 12
    .line 13
    invoke-static {v0, p1, p0}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;->b(Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView;->g(Lv/VImage;IIILandroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    :catch_0
    return-void
.end method

.method public onCompleted()V
    .locals 0

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/fakeexperience/view/FakeTwoCardView$a;->g(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
