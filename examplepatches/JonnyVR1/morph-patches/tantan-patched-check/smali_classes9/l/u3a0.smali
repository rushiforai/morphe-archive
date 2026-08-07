.class public final synthetic Ll/u3a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

.field public final synthetic b:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u3a0;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    iput-object p2, p0, Ll/u3a0;->b:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u3a0;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    iget-object p0, p0, Ll/u3a0;->b:Ljava/lang/Throwable;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->y5(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ljava/lang/Throwable;)V

    return-void
.end method
