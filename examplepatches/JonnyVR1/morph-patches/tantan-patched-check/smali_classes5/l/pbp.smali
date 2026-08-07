.class public final synthetic Ll/pbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w50;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pbp;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/pbp;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/pbp;->c:Z

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pbp;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/pbp;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/pbp;->c:Z

    check-cast p1, Landroidx/activity/result/ActivityResult;

    invoke-static {v0, v1, p0, p1}, Ll/ubp;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLandroidx/activity/result/ActivityResult;)V

    return-void
.end method
