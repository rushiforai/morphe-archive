.class public final synthetic Ll/cfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/gfn;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;


# direct methods
.method public synthetic constructor <init>(Ll/gfn;ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfn;->a:Ll/gfn;

    iput p2, p0, Ll/cfn;->b:I

    iput-object p3, p0, Ll/cfn;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cfn;->a:Ll/gfn;

    iget v1, p0, Ll/cfn;->b:I

    iget-object p0, p0, Ll/cfn;->c:Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;

    invoke-static {v0, v1, p0}, Ll/gfn;->F4(Ll/gfn;ILcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)V

    return-void
.end method
