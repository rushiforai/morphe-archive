.class public final synthetic Ll/e7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore;

    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->c(Lcom/tantanapp/common/data/orm/DatabaseStore;)V

    return-void
.end method
