.class public final synthetic Ll/hpb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/lang/Class;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignOutParams;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hpb0;->a:Ljava/lang/Class;

    iput-object p2, p0, Ll/hpb0;->b:Lcom/p1/mobile/putong/data/SignOutParams;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hpb0;->a:Ljava/lang/Class;

    iget-object p0, p0, Ll/hpb0;->b:Lcom/p1/mobile/putong/data/SignOutParams;

    invoke-static {v0, p0}, Ll/uqb0;->S(Ljava/lang/Class;Lcom/p1/mobile/putong/data/SignOutParams;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
