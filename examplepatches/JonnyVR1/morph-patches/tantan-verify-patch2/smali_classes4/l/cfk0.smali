.class public final synthetic Ll/cfk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kfk0;


# direct methods
.method public synthetic constructor <init>(Ll/kfk0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cfk0;->a:Ll/kfk0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cfk0;->a:Ll/kfk0;

    invoke-static {p0}, Ll/kfk0;->y(Ll/kfk0;)V

    return-void
.end method
