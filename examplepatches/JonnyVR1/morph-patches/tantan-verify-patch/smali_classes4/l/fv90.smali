.class public final synthetic Ll/fv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fv90;->a:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    iput-object p2, p0, Ll/fv90;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/fv90;->c:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fv90;->a:Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    iget-object v1, p0, Ll/fv90;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/fv90;->c:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, p0}, Ll/aw90;->j(Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
