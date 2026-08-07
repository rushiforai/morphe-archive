.class public final synthetic Ll/oaa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oaa0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oaa0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    check-cast p1, Lcom/p1/mobile/putong/data/PicVerification;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->G6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;Lcom/p1/mobile/putong/data/PicVerification;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
