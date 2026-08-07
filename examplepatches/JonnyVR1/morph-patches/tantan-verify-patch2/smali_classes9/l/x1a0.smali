.class public final synthetic Ll/x1a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x1a0;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    iput p2, p0, Ll/x1a0;->b:I

    iput-object p3, p0, Ll/x1a0;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x1a0;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    iget v1, p0, Ll/x1a0;->b:I

    iget-object p0, p0, Ll/x1a0;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;->X4(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;ILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
