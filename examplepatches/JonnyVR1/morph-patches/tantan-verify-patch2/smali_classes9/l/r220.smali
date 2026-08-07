.class public final synthetic Ll/r220;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y220;


# direct methods
.method public synthetic constructor <init>(Ll/y220;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r220;->a:Ll/y220;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r220;->a:Ll/y220;

    invoke-static {p0}, Ll/y220;->i(Ll/y220;)V

    return-void
.end method
