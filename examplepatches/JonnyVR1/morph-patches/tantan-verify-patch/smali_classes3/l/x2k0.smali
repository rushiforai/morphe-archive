.class public final synthetic Ll/x2k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/vx0;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/vx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x2k0;->a:Ll/y20;

    iput-object p2, p0, Ll/x2k0;->b:Ll/vx0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x2k0;->a:Ll/y20;

    iget-object p0, p0, Ll/x2k0;->b:Ll/vx0;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/safety/UpgradePolicy$a;->b(Ll/y20;Ll/vx0;)V

    return-void
.end method
