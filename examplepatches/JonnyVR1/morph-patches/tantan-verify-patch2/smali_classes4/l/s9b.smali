.class public final synthetic Ll/s9b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:I

.field public final synthetic d:Ll/p8b;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iput-object p2, p0, Ll/s9b;->b:Lcom/p1/mobile/android/app/Act;

    iput p3, p0, Ll/s9b;->c:I

    iput-object p4, p0, Ll/s9b;->d:Ll/p8b;

    iput-object p5, p0, Ll/s9b;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/s9b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;

    iget-object v1, p0, Ll/s9b;->b:Lcom/p1/mobile/android/app/Act;

    iget v2, p0, Ll/s9b;->c:I

    iget-object v3, p0, Ll/s9b;->d:Ll/p8b;

    iget-object v4, p0, Ll/s9b;->e:Ljava/lang/String;

    move v5, p1

    move v6, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;->d0(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskItemUploadProfileView;Lcom/p1/mobile/android/app/Act;ILl/p8b;Ljava/lang/String;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
