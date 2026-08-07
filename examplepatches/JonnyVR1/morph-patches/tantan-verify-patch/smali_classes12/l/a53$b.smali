.class Ll/a53$b;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/a53;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ll/a53;


# direct methods
.method public constructor <init>(Ll/a53;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a53$b;->a:Ll/a53;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a53$b;->a:Ll/a53;

    .line 2
    .line 3
    invoke-static {v0}, Ll/a53;->g(Ll/a53;)Ll/ppl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/a53$b;->a:Ll/a53;

    .line 10
    .line 11
    invoke-static {p0}, Ll/a53;->g(Ll/a53;)Ll/ppl;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 18
    .line 19
    invoke-interface {p0, p1}, Ll/ppl;->b(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method
