.class public final synthetic Ll/gpu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/spu;


# direct methods
.method public synthetic constructor <init>(Ll/spu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gpu;->a:Ll/spu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gpu;->a:Ll/spu;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/spu;->k3(Ll/spu;Ljava/lang/Long;)V

    return-void
.end method
