.class public final synthetic Ll/mye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/oye;


# direct methods
.method public synthetic constructor <init>(Ll/oye;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mye;->a:Ll/oye;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mye;->a:Ll/oye;

    invoke-static {p0}, Ll/oye;->c(Ll/oye;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
