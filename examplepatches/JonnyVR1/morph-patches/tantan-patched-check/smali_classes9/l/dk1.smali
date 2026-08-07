.class public final synthetic Ll/dk1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iput-object p2, p0, Ll/dk1;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dk1;->a:Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;

    iget-object p0, p0, Ll/dk1;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;->M(Lcom/p1/mobile/putong/core/ui/profile/photo/AvatarCard;Ljava/lang/String;)V

    return-void
.end method
