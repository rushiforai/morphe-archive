.class public final synthetic Ll/uh80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/MessageLocation;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/MessageLocation;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uh80;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    iput p2, p0, Ll/uh80;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/uh80;->a:Lcom/p1/mobile/putong/data/MessageLocation;

    iget p0, p0, Ll/uh80;->b:I

    check-cast p1, Lcom/p1/mobile/putong/data/NearbyLocation;

    invoke-static {v0, p0, p1}, Ll/vh80;->b(Lcom/p1/mobile/putong/data/MessageLocation;ILcom/p1/mobile/putong/data/NearbyLocation;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
