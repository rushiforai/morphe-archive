.class public final synthetic Ll/cuj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/guj;

.field public final synthetic b:Ll/jjs;

.field public final synthetic c:I

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/guj;Ll/jjs;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cuj;->a:Ll/guj;

    iput-object p2, p0, Ll/cuj;->b:Ll/jjs;

    iput p3, p0, Ll/cuj;->c:I

    iput-boolean p4, p0, Ll/cuj;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cuj;->a:Ll/guj;

    iget-object v1, p0, Ll/cuj;->b:Ll/jjs;

    iget v2, p0, Ll/cuj;->c:I

    iget-boolean p0, p0, Ll/cuj;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    invoke-static {v0, v1, v2, p0, p1}, Ll/guj;->a(Ll/guj;Ll/jjs;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method
