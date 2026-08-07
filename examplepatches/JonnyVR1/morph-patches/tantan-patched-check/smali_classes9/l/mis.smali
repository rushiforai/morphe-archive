.class public final synthetic Ll/mis;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bjs;

.field public final synthetic b:Ll/jjs;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/bjs;Ll/jjs;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mis;->a:Ll/bjs;

    iput-object p2, p0, Ll/mis;->b:Ll/jjs;

    iput p3, p0, Ll/mis;->c:I

    iput p4, p0, Ll/mis;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/mis;->a:Ll/bjs;

    iget-object v1, p0, Ll/mis;->b:Ll/jjs;

    iget v2, p0, Ll/mis;->c:I

    iget p0, p0, Ll/mis;->d:I

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, v1, v2, p0, p1}, Ll/bjs;->k4(Ll/bjs;Ll/jjs;IILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
