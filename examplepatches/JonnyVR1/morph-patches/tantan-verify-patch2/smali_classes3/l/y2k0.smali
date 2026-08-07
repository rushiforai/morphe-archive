.class public final synthetic Ll/y2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y2k0;->a:Ll/y20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y2k0;->a:Ll/y20;

    invoke-static {p0}, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->c(Ll/y20;)V

    return-void
.end method
