.class public final synthetic Ll/tok;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hpk;


# direct methods
.method public synthetic constructor <init>(Ll/hpk;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tok;->a:Ll/hpk;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tok;->a:Ll/hpk;

    check-cast p1, Landroid/net/NetworkInfo;

    invoke-static {p0, p1}, Ll/hpk;->k0(Ll/hpk;Landroid/net/NetworkInfo;)V

    return-void
.end method
