.class public final synthetic Ll/uj2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/vj2;


# direct methods
.method public synthetic constructor <init>(Ll/vj2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uj2;->a:Ll/vj2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uj2;->a:Ll/vj2;

    check-cast p1, Lcom/p1/mobile/putong/core/data/Greeting;

    invoke-static {p0, p1}, Ll/vj2;->g0(Ll/vj2;Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method
