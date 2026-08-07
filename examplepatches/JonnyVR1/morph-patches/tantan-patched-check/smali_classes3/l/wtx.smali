.class public final synthetic Ll/wtx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bvx;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/bvx;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wtx;->a:Ll/bvx;

    iput-object p2, p0, Ll/wtx;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wtx;->a:Ll/bvx;

    iget-object p0, p0, Ll/wtx;->b:Ljava/util/List;

    invoke-static {v0, p0}, Ll/bvx;->f(Ll/bvx;Ljava/util/List;)V

    return-void
.end method
