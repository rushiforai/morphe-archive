.class public final synthetic Ll/a1g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/m1g;


# direct methods
.method public synthetic constructor <init>(Ll/m1g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a1g;->a:Ll/m1g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a1g;->a:Ll/m1g;

    invoke-virtual {p0}, Ll/m1g;->s0()V

    return-void
.end method
