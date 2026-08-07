.class public final synthetic Ll/nio;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pio;


# direct methods
.method public synthetic constructor <init>(Ll/pio;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nio;->a:Ll/pio;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nio;->a:Ll/pio;

    invoke-static {p0}, Ll/pio;->b(Ll/pio;)V

    return-void
.end method
