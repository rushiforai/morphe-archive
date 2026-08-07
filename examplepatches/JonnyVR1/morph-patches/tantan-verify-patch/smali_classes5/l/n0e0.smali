.class public final synthetic Ll/n0e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/d$a;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n0e0;->a:Lcom/p1/mobile/putong/core/ui/greet/d$a;

    iput-object p2, p0, Ll/n0e0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/n0e0;->a:Lcom/p1/mobile/putong/core/ui/greet/d$a;

    iget-object p0, p0, Ll/n0e0;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;

    invoke-static {v0, p0, p1}, Ll/q0e0;->a(Lcom/p1/mobile/putong/core/ui/greet/d$a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V

    return-void
.end method
