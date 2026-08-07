.class public final synthetic Ll/vhr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/cir;


# direct methods
.method public synthetic constructor <init>(Ll/cir;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vhr;->a:Ll/cir;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhr;->a:Ll/cir;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/cir;->m0(Ll/cir;Landroid/net/NetworkInfo;)V

    return-void
.end method
