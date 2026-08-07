.class public final synthetic Ll/j7e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/abe0;


# direct methods
.method public synthetic constructor <init>(Ll/abe0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7e0;->a:Ll/abe0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7e0;->a:Ll/abe0;

    invoke-static {p0}, Ll/k7e0;->e(Ll/abe0;)V

    return-void
.end method
