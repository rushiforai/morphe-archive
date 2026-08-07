.class public final synthetic Ll/q4g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r4g;


# direct methods
.method public synthetic constructor <init>(Ll/r4g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q4g;->a:Ll/r4g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q4g;->a:Ll/r4g;

    invoke-static {p0}, Ll/r4g;->h0(Ll/r4g;)V

    return-void
.end method
