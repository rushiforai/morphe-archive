.class public final synthetic Ll/qga0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qga0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    iput-object p2, p0, Ll/qga0;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/qga0;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/qga0;->d:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/qga0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    iget-object v1, p0, Ll/qga0;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/qga0;->c:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/qga0;->d:Ll/y20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->d6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method
