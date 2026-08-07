.class public final synthetic Ll/x2v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/v2s0;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/v2s0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x2v0;->a:Ll/v2s0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x2v0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x2v0;->a:Ll/v2s0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/v2s0;->c()Ll/r2s0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/x2v0;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Ll/r2s0;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
