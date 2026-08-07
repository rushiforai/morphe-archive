.class public final synthetic Ll/ljt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wit0;


# direct methods
.method public synthetic constructor <init>(Ll/wit0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ljt0;->a:Ll/wit0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljt0;->a:Ll/wit0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/wit0;->destroy()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
