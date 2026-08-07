.class public final synthetic Ll/i830;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/k930;


# direct methods
.method public synthetic constructor <init>(Ll/k930;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i830;->a:Ll/k930;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i830;->a:Ll/k930;

    invoke-static {p0}, Ll/k930;->n0(Ll/k930;)V

    return-void
.end method
