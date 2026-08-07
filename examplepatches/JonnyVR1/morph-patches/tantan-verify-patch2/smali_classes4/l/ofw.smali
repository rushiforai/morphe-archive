.class public final synthetic Ll/ofw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qfw;


# direct methods
.method public synthetic constructor <init>(Ll/qfw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ofw;->a:Ll/qfw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofw;->a:Ll/qfw;

    invoke-static {p0}, Ll/qfw;->b(Ll/qfw;)V

    return-void
.end method
