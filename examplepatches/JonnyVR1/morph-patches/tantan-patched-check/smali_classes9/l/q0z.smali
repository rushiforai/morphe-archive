.class public final synthetic Ll/q0z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u1z;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q0z;->a:Ll/u1z;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q0z;->a:Ll/u1z;

    invoke-static {p0}, Ll/u1z;->F0(Ll/u1z;)V

    return-void
.end method
