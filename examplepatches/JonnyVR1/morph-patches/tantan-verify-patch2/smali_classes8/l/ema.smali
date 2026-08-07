.class public final synthetic Ll/ema;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fma;


# direct methods
.method public synthetic constructor <init>(Ll/fma;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ema;->a:Ll/fma;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ema;->a:Ll/fma;

    invoke-static {p0}, Ll/fma;->c(Ll/fma;)V

    return-void
.end method
