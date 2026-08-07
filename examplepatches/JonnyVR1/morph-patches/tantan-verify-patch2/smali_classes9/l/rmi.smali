.class public final synthetic Ll/rmi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tmi;


# direct methods
.method public synthetic constructor <init>(Ll/tmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rmi;->a:Ll/tmi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmi;->a:Ll/tmi;

    invoke-static {p0}, Ll/tmi;->M3(Ll/tmi;)V

    return-void
.end method
