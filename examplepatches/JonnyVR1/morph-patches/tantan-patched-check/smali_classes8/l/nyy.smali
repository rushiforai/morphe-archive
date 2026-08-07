.class public final synthetic Ll/nyy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/azy;


# direct methods
.method public synthetic constructor <init>(Ll/azy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nyy;->a:Ll/azy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nyy;->a:Ll/azy;

    invoke-virtual {p0}, Ll/azy;->F0()V

    return-void
.end method
