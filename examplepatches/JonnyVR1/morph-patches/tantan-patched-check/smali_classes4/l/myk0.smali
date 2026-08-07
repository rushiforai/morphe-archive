.class public final synthetic Ll/myk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nyk0;


# direct methods
.method public synthetic constructor <init>(Ll/nyk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/myk0;->a:Ll/nyk0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/myk0;->a:Ll/nyk0;

    invoke-virtual {p0}, Ll/nyk0;->H()V

    return-void
.end method
