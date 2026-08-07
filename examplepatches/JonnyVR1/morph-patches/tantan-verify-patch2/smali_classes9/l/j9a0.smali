.class public final synthetic Ll/j9a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iput-object p2, p0, Ll/j9a0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/j9a0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j9a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iget-object v1, p0, Ll/j9a0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/j9a0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->e8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method
