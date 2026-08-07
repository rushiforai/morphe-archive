.class public final synthetic Ll/q9t0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/s9t0;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ll/s9t0;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/q9t0;->a:Ll/s9t0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/q9t0;->b:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q9t0;->a:Ll/s9t0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q9t0;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/s9t0;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
