.class public Ll/fnp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fnp0;->z(Ll/fnp0$b;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;

.field public final synthetic b:Ll/fnp0;


# direct methods
.method public constructor <init>(Ll/fnp0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fnp0$a;->b:Ll/fnp0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fnp0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;

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
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fnp0$a;->b:Ll/fnp0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/fnp0;->y(Ll/fnp0;)Ll/vam;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/fnp0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->candidateMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Oc:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Ll/fnp0$a;->b:Ll/fnp0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/fnp0;->y(Ll/fnp0;)Ll/vam;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p0, p0, Ll/fnp0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->candidateMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVote;->number:I

    .line 46
    .line 47
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p1, v0, p0}, Ll/vam;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method
