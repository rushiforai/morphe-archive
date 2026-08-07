.class public final synthetic Ll/c7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c7c;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c7c;->a:Ll/x20;

    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->f(Ll/x20;)V

    return-void
.end method
