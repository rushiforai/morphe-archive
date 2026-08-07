.class public final synthetic Ll/cji;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/dji;


# direct methods
.method public synthetic constructor <init>(Ll/dji;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cji;->a:Ll/dji;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cji;->a:Ll/dji;

    invoke-static {p0}, Ll/dji;->a(Ll/dji;)Ll/dji$a;

    move-result-object p0

    return-object p0
.end method
