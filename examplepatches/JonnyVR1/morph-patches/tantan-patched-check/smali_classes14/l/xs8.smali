.class public final synthetic Ll/xs8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dt8;


# direct methods
.method public synthetic constructor <init>(Ll/dt8;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xs8;->a:Ll/dt8;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xs8;->a:Ll/dt8;

    invoke-static {p0}, Ll/dt8;->h3(Ll/dt8;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
