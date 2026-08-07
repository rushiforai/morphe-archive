.class public final synthetic Ll/xvg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uwg0;

.field public final synthetic b:Ll/skg0;

.field public final synthetic c:Ll/nzg0;


# direct methods
.method public synthetic constructor <init>(Ll/uwg0;Ll/skg0;Ll/nzg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xvg0;->a:Ll/uwg0;

    iput-object p2, p0, Ll/xvg0;->b:Ll/skg0;

    iput-object p3, p0, Ll/xvg0;->c:Ll/nzg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xvg0;->a:Ll/uwg0;

    iget-object v1, p0, Ll/xvg0;->b:Ll/skg0;

    iget-object p0, p0, Ll/xvg0;->c:Ll/nzg0;

    invoke-virtual {v0, v1, p0}, Ll/uwg0;->d(Ll/skg0;Ll/nzg0;)V

    return-void
.end method
