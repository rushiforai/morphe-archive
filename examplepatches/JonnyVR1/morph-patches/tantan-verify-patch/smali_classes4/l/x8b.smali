.class public final synthetic Ll/x8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;

.field public final synthetic d:Ll/p8b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iput p2, p0, Ll/x8b;->b:I

    iput-object p3, p0, Ll/x8b;->c:Lcom/p1/mobile/putong/data/Media;

    iput-object p4, p0, Ll/x8b;->d:Ll/p8b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iget v1, p0, Ll/x8b;->b:I

    iget-object v2, p0, Ll/x8b;->c:Lcom/p1/mobile/putong/data/Media;

    iget-object p0, p0, Ll/x8b;->d:Ll/p8b;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->T(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;ILcom/p1/mobile/putong/data/Media;Ll/p8b;)V

    return-void
.end method
