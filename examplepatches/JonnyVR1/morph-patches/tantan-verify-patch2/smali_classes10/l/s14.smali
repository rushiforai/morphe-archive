.class public final synthetic Ll/s14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/t14;


# direct methods
.method public synthetic constructor <init>(Ll/t14;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s14;->a:Ll/t14;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s14;->a:Ll/t14;

    invoke-static {p0}, Ll/t14;->n4(Ll/t14;)V

    return-void
.end method
