.class public final synthetic Ll/j5c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k5c;


# direct methods
.method public synthetic constructor <init>(Ll/k5c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j5c;->a:Ll/k5c;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j5c;->a:Ll/k5c;

    invoke-static {p0}, Ll/k5c;->i(Ll/k5c;)V

    return-void
.end method
