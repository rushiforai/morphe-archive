.class public final synthetic Ll/r5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/x5f;


# direct methods
.method public synthetic constructor <init>(Ll/x5f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r5f;->a:Ll/x5f;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5f;->a:Ll/x5f;

    invoke-static {p0}, Ll/x5f;->p(Ll/x5f;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
