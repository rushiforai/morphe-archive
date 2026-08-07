.class public final synthetic Ll/vs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ws;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/ws;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vs;->a:Ll/ws;

    iput-object p2, p0, Ll/vs;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vs;->a:Ll/ws;

    iget-object p0, p0, Ll/vs;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/ws;->e(Ll/ws;Ljava/util/List;)V

    return-void
.end method
