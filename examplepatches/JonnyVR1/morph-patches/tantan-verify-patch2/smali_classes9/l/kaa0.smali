.class public final synthetic Ll/kaa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kaa0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iput-boolean p2, p0, Ll/kaa0;->b:Z

    iput-object p3, p0, Ll/kaa0;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kaa0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iget-boolean v1, p0, Ll/kaa0;->b:Z

    iget-object p0, p0, Ll/kaa0;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->v6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;ZLjava/util/List;)V

    return-void
.end method
