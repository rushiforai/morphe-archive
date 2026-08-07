.class public final synthetic Ll/kip;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hjp;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/hjp;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kip;->a:Ll/hjp;

    iput-object p2, p0, Ll/kip;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kip;->a:Ll/hjp;

    iget-object p0, p0, Ll/kip;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/hjp;->J0(Ll/hjp;Lcom/p1/mobile/putong/data/User;Ljava/lang/Throwable;)V

    return-void
.end method
