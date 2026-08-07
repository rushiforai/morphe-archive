.class public final synthetic Ll/egw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jgw;


# direct methods
.method public synthetic constructor <init>(Ll/jgw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/egw;->a:Ll/jgw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/egw;->a:Ll/jgw;

    invoke-static {p0}, Ll/jgw;->y(Ll/jgw;)V

    return-void
.end method
