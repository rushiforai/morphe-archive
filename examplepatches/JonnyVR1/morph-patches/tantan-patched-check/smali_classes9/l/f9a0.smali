.class public final synthetic Ll/f9a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

.field public final synthetic b:I

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f9a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iput p2, p0, Ll/f9a0;->b:I

    iput-object p3, p0, Ll/f9a0;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f9a0;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    iget v1, p0, Ll/f9a0;->b:I

    iget-object p0, p0, Ll/f9a0;->c:Landroid/content/Intent;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->b6(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;ILandroid/content/Intent;Ljava/lang/Throwable;)V

    return-void
.end method
