.class public final synthetic Ll/a7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a7c;->a:Ll/y20;

    iput-object p2, p0, Ll/a7c;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a7c;->a:Ll/y20;

    iget-object p0, p0, Ll/a7c;->b:Ljava/lang/Object;

    invoke-static {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->b(Ll/y20;Ljava/lang/Object;)V

    return-void
.end method
