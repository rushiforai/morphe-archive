.class public final synthetic Ll/hqn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hqn0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/hqn0;->b:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hqn0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/hqn0;->b:Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    invoke-static {v0, p0}, Ll/iqn0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    return-void
.end method
