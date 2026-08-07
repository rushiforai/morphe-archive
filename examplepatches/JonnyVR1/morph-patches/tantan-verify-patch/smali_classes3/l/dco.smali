.class public final synthetic Ll/dco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/xco;

.field public final synthetic b:D

.field public final synthetic c:D


# direct methods
.method public synthetic constructor <init>(Ll/xco;DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dco;->a:Ll/xco;

    iput-wide p2, p0, Ll/dco;->b:D

    iput-wide p4, p0, Ll/dco;->c:D

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/dco;->a:Ll/xco;

    iget-wide v1, p0, Ll/dco;->b:D

    iget-wide v3, p0, Ll/dco;->c:D

    invoke-static {v0, v1, v2, v3, v4}, Ll/xco;->m0(Ll/xco;DD)Landroid/location/Address;

    move-result-object p0

    return-object p0
.end method
