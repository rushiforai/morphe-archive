.class public final synthetic Ll/dq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nq;


# direct methods
.method public synthetic constructor <init>(Ll/nq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dq;->a:Ll/nq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dq;->a:Ll/nq;

    invoke-static {p0}, Ll/nq;->a(Ll/nq;)V

    return-void
.end method
