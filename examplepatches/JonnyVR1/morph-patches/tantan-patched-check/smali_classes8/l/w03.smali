.class public final synthetic Ll/w03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x03;


# direct methods
.method public synthetic constructor <init>(Ll/x03;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w03;->a:Ll/x03;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w03;->a:Ll/x03;

    invoke-static {p0}, Ll/x03;->f0(Ll/x03;)V

    return-void
.end method
