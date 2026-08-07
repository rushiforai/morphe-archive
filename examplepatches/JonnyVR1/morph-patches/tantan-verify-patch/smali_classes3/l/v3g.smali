.class public final synthetic Ll/v3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v3g;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3g;->a:Ljava/lang/Runnable;

    invoke-static {p0}, Lcom/p1/mobile/putong/ui/splash/FakeSplashViewOld;->l(Ljava/lang/Runnable;)V

    return-void
.end method
