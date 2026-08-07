.class public final synthetic Ll/lxr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x1d0$a;


# direct methods
.method public synthetic constructor <init>(Ll/x1d0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lxr;->a:Ll/x1d0$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lxr;->a:Ll/x1d0$a;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/api/LiveBaseApi;->f(Ll/x1d0$a;Ljava/util/Map$Entry;)V

    return-void
.end method
