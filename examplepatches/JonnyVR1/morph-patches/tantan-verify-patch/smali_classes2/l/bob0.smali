.class public final synthetic Ll/bob0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/cob0;


# direct methods
.method public synthetic constructor <init>(Ll/cob0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bob0;->a:Ll/cob0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bob0;->a:Ll/cob0;

    invoke-static {p0}, Ll/cob0;->b(Ll/cob0;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
