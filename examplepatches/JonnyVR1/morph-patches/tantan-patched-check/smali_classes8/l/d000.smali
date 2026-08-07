.class public final synthetic Ll/d000;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d000;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/d000;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d000;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/d000;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, p0, p1}, Ll/j000;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/Boolean;)V

    return-void
.end method
