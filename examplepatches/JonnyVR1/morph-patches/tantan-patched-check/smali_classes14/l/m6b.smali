.class public final synthetic Ll/m6b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/y6b;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/y6b;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m6b;->a:Ll/y6b;

    iput-object p2, p0, Ll/m6b;->b:Ljava/util/List;

    iput-object p3, p0, Ll/m6b;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m6b;->a:Ll/y6b;

    iget-object v1, p0, Ll/m6b;->b:Ljava/util/List;

    iget-object p0, p0, Ll/m6b;->c:Ljava/util/List;

    invoke-static {v0, v1, p0}, Ll/y6b;->o3(Ll/y6b;Ljava/util/List;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
