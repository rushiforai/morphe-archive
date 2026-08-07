.class public final synthetic Ll/j5e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k5e;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/k5e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5e;->a:Ll/k5e;

    iput-object p2, p0, Ll/j5e;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j5e;->a:Ll/k5e;

    iget-object p0, p0, Ll/j5e;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Ll/k5e;->a(Ll/k5e;Ljava/lang/Runnable;)V

    return-void
.end method
