.class public final synthetic Ll/cyn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/qyn;


# direct methods
.method public synthetic constructor <init>(Ll/qyn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cyn;->a:Ll/qyn;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyn;->a:Ll/qyn;

    invoke-static {p0}, Ll/qyn;->c3(Ll/qyn;)V

    return-void
.end method
