.class public final synthetic Ll/n7a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n7a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iput-object p2, p0, Ll/n7a0;->b:Lcom/p1/mobile/putong/data/Media;

    iput p3, p0, Ll/n7a0;->c:I

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n7a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iget-object v1, p0, Ll/n7a0;->b:Lcom/p1/mobile/putong/data/Media;

    iget p0, p0, Ll/n7a0;->c:I

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->h7(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Lcom/p1/mobile/putong/data/Media;I)V

    return-void
.end method
