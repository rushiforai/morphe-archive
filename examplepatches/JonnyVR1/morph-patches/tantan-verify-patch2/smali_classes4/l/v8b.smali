.class public final synthetic Ll/v8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

.field public final synthetic b:Ll/p8b;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iput-object p2, p0, Ll/v8b;->b:Ll/p8b;

    iput p3, p0, Ll/v8b;->c:I

    iput p4, p0, Ll/v8b;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/v8b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iget-object v1, p0, Ll/v8b;->b:Ll/p8b;

    iget v2, p0, Ll/v8b;->c:I

    iget p0, p0, Ll/v8b;->d:I

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->a0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Ll/p8b;IILcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
