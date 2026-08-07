.class public final synthetic Ll/bda0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bda0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iput-boolean p2, p0, Ll/bda0;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bda0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iget-boolean p0, p0, Ll/bda0;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->r6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
