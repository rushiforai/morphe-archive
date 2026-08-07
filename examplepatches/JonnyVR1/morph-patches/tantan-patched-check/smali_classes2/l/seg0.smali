.class public final synthetic Ll/seg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zeg0;


# direct methods
.method public synthetic constructor <init>(Ll/zeg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/seg0;->a:Ll/zeg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/seg0;->a:Ll/zeg0;

    invoke-virtual {p0}, Ll/zeg0;->g()V

    return-void
.end method
