.class public final synthetic Ll/mcm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tcm;


# direct methods
.method public synthetic constructor <init>(Ll/tcm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mcm;->a:Ll/tcm;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mcm;->a:Ll/tcm;

    invoke-static {p0}, Ll/tcm;->h0(Ll/tcm;)V

    return-void
.end method
