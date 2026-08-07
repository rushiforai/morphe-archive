.class Ll/voq$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/voq;->changeFaceWarp(IFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:Ll/voq;


# direct methods
.method public constructor <init>(Ll/voq;IFF)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/voq$a;->d:Ll/voq;

    .line 2
    .line 3
    iput p2, p0, Ll/voq$a;->a:I

    .line 4
    .line 5
    iput p3, p0, Ll/voq$a;->b:F

    .line 6
    .line 7
    iput p4, p0, Ll/voq$a;->c:F

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/voq$a;->d:Ll/voq;

    .line 2
    .line 3
    iget v1, p0, Ll/voq$a;->a:I

    .line 4
    .line 5
    iget v2, p0, Ll/voq$a;->b:F

    .line 6
    .line 7
    iget v3, p0, Ll/voq$a;->c:F

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3}, Ll/voq;->T1(Ll/voq;IFF)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/voq$a;->d:Ll/voq;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/voq;->isByteDanceBeautyFilter()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/voq$a;->d:Ll/voq;

    .line 21
    .line 22
    invoke-static {v0}, Ll/voq;->U1(Ll/voq;)Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/voq$a;->d:Ll/voq;

    .line 29
    .line 30
    iget-object v1, v0, Ll/voq;->q:Ll/omw;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-static {v0}, Ll/voq;->U1(Ll/voq;)Lcom/momo/mcamera/mask/facewarp/BeautyFaceWarpFilter;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Ll/voq$a;->d:Ll/voq;

    .line 39
    .line 40
    iget-object p0, p0, Ll/voq;->q:Ll/omw;

    .line 41
    .line 42
    iget p0, p0, Ll/omw;->A:F

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setScaleFactor(F)V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method
