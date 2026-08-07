.class public final synthetic Ll/ssa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/usa;


# direct methods
.method public synthetic constructor <init>(Ll/usa;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ssa;->a:Ll/usa;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ssa;->a:Ll/usa;

    invoke-static {p0}, Ll/usa;->m3(Ll/usa;)V

    return-void
.end method
