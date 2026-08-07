.class public final synthetic Ll/i9b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iput p2, p0, Ll/i9b;->b:I

    iput-object p3, p0, Ll/i9b;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iget v1, p0, Ll/i9b;->b:I

    iget-object p0, p0, Ll/i9b;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->b0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
