.class public final synthetic Ll/acf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/acf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    iput-object p2, p0, Ll/acf;->b:Lcom/p1/mobile/putong/data/Picture;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/acf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    iget-object p0, p0, Ll/acf;->b:Lcom/p1/mobile/putong/data/Picture;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->a0(Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Picture;

    move-result-object p0

    return-object p0
.end method
