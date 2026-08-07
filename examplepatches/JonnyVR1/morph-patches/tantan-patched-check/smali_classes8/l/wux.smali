.class public final synthetic Ll/wux;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zux;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/zux;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wux;->a:Ll/zux;

    iput-object p2, p0, Ll/wux;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wux;->a:Ll/zux;

    iget-object p0, p0, Ll/wux;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/zux;->l(Ll/zux;Ljava/util/List;)V

    return-void
.end method
