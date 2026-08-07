.class public final synthetic Ll/vtx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/avx;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/avx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vtx;->a:Ll/avx;

    iput-object p2, p0, Ll/vtx;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vtx;->a:Ll/avx;

    iget-object p0, p0, Ll/vtx;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/avx;->e(Ll/avx;Ljava/util/List;)V

    return-void
.end method
