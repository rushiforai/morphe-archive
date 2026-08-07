.class public final synthetic Ll/b5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/k5m0;


# direct methods
.method public synthetic constructor <init>(Ll/k5m0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b5m0;->a:Ll/k5m0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b5m0;->a:Ll/k5m0;

    invoke-static {p0}, Ll/k5m0;->S(Ll/k5m0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
