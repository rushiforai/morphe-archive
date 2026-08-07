.class public final synthetic Ll/jq90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kq90;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;


# direct methods
.method public synthetic constructor <init>(Ll/kq90;ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jq90;->a:Ll/kq90;

    iput p2, p0, Ll/jq90;->b:I

    iput-object p3, p0, Ll/jq90;->c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jq90;->a:Ll/kq90;

    iget v1, p0, Ll/jq90;->b:I

    iget-object p0, p0, Ll/jq90;->c:Lcom/p1/mobile/putong/core/ui/home/VirtualCard;

    invoke-static {v0, v1, p0}, Ll/kq90;->o(Ll/kq90;ILcom/p1/mobile/putong/core/ui/home/VirtualCard;)V

    return-void
.end method
