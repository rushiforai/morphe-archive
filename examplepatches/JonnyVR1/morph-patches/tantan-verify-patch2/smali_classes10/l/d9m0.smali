.class public final synthetic Ll/d9m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e9m0;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/e9m0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d9m0;->a:Ll/e9m0;

    iput-object p2, p0, Ll/d9m0;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d9m0;->a:Ll/e9m0;

    iget-object p0, p0, Ll/d9m0;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/e9m0;->J3(Ll/e9m0;Ljava/util/List;)V

    return-void
.end method
