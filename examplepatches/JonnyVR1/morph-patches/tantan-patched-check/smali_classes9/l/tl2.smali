.class public final synthetic Ll/tl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xl2;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/xl2;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tl2;->a:Ll/xl2;

    iput p2, p0, Ll/tl2;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tl2;->a:Ll/xl2;

    iget p0, p0, Ll/tl2;->b:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    invoke-static {v0, p0, p1}, Ll/xl2;->R3(Ll/xl2;ILcom/p1/mobile/putong/live/base/data/BLiveCoin;)Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    move-result-object p0

    return-object p0
.end method
