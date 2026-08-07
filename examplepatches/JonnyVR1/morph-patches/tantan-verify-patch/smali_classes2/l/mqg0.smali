.class public final synthetic Ll/mqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yqg0;


# direct methods
.method public synthetic constructor <init>(Ll/yqg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqg0;->a:Ll/yqg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mqg0;->a:Ll/yqg0;

    invoke-virtual {p0}, Ll/yqg0;->g()V

    return-void
.end method
