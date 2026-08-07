.class public final synthetic Ll/j7q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7q0;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7q0;->a:Ljava/lang/Runnable;

    invoke-static {p0}, Ll/ccq0;->e3(Ljava/lang/Runnable;)V

    return-void
.end method
