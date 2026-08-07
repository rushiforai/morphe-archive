.class public final synthetic Ll/t19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/x19;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;


# direct methods
.method public synthetic constructor <init>(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t19;->a:Ll/x19;

    iput-object p2, p0, Ll/t19;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/t19;->c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t19;->a:Ll/x19;

    iget-object v1, p0, Ll/t19;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/t19;->c:Lcom/p1/mobile/putong/core/data/GrowthPushConfig;

    invoke-static {v0, v1, p0}, Ll/x19;->q(Ll/x19;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GrowthPushConfig;)V

    return-void
.end method
