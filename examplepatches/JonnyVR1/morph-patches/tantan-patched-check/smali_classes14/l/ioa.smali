.class public final synthetic Ll/ioa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/joa;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/joa;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ioa;->a:Ll/joa;

    iput-object p2, p0, Ll/ioa;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ioa;->a:Ll/joa;

    iget-object p0, p0, Ll/ioa;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/joa;->b3(Ll/joa;Ljava/util/List;)V

    return-void
.end method
