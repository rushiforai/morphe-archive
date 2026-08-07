.class public final synthetic Ll/q8k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s8k0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/s8k0;Lcom/p1/mobile/putong/data/User;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8k0;->a:Ll/s8k0;

    iput-object p2, p0, Ll/q8k0;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/q8k0;->c:Z

    iput-boolean p4, p0, Ll/q8k0;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q8k0;->a:Ll/s8k0;

    iget-object v1, p0, Ll/q8k0;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/q8k0;->c:Z

    iget-boolean p0, p0, Ll/q8k0;->d:Z

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, v1, v2, p0, p1}, Ll/s8k0;->q4(Ll/s8k0;Lcom/p1/mobile/putong/data/User;ZZLcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
