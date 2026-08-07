.class public final synthetic Ll/zal0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/cbl0;


# direct methods
.method public synthetic constructor <init>(Ll/cbl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zal0;->a:Ll/cbl0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zal0;->a:Ll/cbl0;

    invoke-static {p0}, Ll/cbl0;->e(Ll/cbl0;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
