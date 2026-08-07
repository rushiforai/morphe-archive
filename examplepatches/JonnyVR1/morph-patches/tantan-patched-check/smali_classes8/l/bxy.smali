.class public final synthetic Ll/bxy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hxy;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/hxy;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxy;->a:Ll/hxy;

    iput-object p2, p0, Ll/bxy;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bxy;->a:Ll/hxy;

    iget-object p0, p0, Ll/bxy;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Ll/hxy;->c(Ll/hxy;Ljava/lang/Runnable;)V

    return-void
.end method
