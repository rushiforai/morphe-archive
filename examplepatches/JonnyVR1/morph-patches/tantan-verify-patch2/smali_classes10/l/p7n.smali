.class public final synthetic Ll/p7n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q7n;


# direct methods
.method public synthetic constructor <init>(Ll/q7n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p7n;->a:Ll/q7n;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p7n;->a:Ll/q7n;

    invoke-static {p0}, Ll/q7n;->L(Ll/q7n;)V

    return-void
.end method
