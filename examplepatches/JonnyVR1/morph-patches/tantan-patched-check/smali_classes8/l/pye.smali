.class public final synthetic Ll/pye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/sye;


# direct methods
.method public synthetic constructor <init>(Ll/sye;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pye;->a:Ll/sye;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pye;->a:Ll/sye;

    invoke-static {p0}, Ll/sye;->c(Ll/sye;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
