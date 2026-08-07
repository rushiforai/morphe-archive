.class public final synthetic Ll/ime;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jme;


# direct methods
.method public synthetic constructor <init>(Ll/jme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ime;->a:Ll/jme;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ime;->a:Ll/jme;

    invoke-static {p0}, Ll/jme;->R(Ll/jme;)V

    return-void
.end method
