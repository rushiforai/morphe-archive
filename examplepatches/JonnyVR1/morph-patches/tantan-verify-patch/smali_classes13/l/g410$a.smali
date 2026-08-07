.class Ll/g410$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->b0(Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pipline/MomoInterface/MomoCodec;

.field final synthetic b:Ll/uow;

.field final synthetic c:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/uow;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$a;->c:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$a;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$a;->b:Ll/uow;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410$a;->c:Ll/g410;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g410;->j0()Ll/g510;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/g410$a;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/g510;->B(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/g410$a;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 13
    .line 14
    iget-object v1, p0, Ll/g410$a;->c:Ll/g410;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/g410;->j0()Ll/g510;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iget-object p0, p0, Ll/g410$a;->b:Ll/uow;

    .line 21
    .line 22
    invoke-interface {v0, v1, p0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->Y(Ll/g510;Ll/uow;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
