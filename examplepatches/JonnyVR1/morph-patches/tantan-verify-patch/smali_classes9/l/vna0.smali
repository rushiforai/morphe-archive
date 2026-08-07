.class public final synthetic Ll/vna0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vna0;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vna0;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileLoopEditPetUploadPhoto;->Q(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
