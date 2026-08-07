.class public final synthetic Ll/o1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q1e;


# direct methods
.method public synthetic constructor <init>(Ll/q1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o1e;->a:Ll/q1e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o1e;->a:Ll/q1e;

    invoke-static {p0}, Ll/q1e;->c(Ll/q1e;)V

    return-void
.end method
