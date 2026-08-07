.class public final synthetic Ll/dsm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/esm;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/esm;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dsm;->a:Ll/esm;

    iput-object p2, p0, Ll/dsm;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dsm;->a:Ll/esm;

    iget-object p0, p0, Ll/dsm;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/esm;->b(Ll/esm;Ljava/util/List;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
