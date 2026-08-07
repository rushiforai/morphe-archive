.class public final synthetic Ll/xj20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/ry3;

.field public final synthetic b:Ll/w84;


# direct methods
.method public synthetic constructor <init>(Ll/ry3;Ll/w84;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xj20;->a:Ll/ry3;

    iput-object p2, p0, Ll/xj20;->b:Ll/w84;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xj20;->a:Ll/ry3;

    iget-object p0, p0, Ll/xj20;->b:Ll/w84;

    invoke-static {v0, p0}, Ll/zj20;->a(Ll/ry3;Ll/w84;)Ll/i5d0;

    move-result-object p0

    return-object p0
.end method
