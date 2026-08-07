.class public final synthetic Ll/p220;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q220;


# direct methods
.method public synthetic constructor <init>(Ll/q220;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p220;->a:Ll/q220;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p220;->a:Ll/q220;

    invoke-static {p0}, Ll/q220;->g0(Ll/q220;)V

    return-void
.end method
