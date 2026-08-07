.class public final synthetic Ll/dyh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dyh;->a:Lcom/p1/mobile/putong/data/User;

    iput-object p2, p0, Ll/dyh;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/dyh;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dyh;->a:Lcom/p1/mobile/putong/data/User;

    iget-object v1, p0, Ll/dyh;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/dyh;->c:Z

    invoke-static {v0, v1, p0}, Ll/hyh;->a(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Z)V

    return-void
.end method
