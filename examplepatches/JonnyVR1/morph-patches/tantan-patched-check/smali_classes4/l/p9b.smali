.class public final synthetic Ll/p9b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/p8b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iput-object p2, p0, Ll/p9b;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/p9b;->c:Ll/p8b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iget-object v1, p0, Ll/p9b;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/p9b;->c:Ll/p8b;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->r0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;Ll/p8b;Landroid/util/Pair;)V

    return-void
.end method
