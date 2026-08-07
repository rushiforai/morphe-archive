.class public final synthetic Ll/kh3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ll/mh3;

.field public final synthetic c:Ll/by3;

.field public final synthetic d:Ll/n0f;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ll/mh3;Ll/by3;Ll/n0f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kh3;->a:Ljava/lang/Object;

    iput-object p2, p0, Ll/kh3;->b:Ll/mh3;

    iput-object p3, p0, Ll/kh3;->c:Ll/by3;

    iput-object p4, p0, Ll/kh3;->d:Ll/n0f;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/kh3;->a:Ljava/lang/Object;

    iget-object v1, p0, Ll/kh3;->b:Ll/mh3;

    iget-object v2, p0, Ll/kh3;->c:Ll/by3;

    iget-object p0, p0, Ll/kh3;->d:Ll/n0f;

    invoke-static {v0, v1, v2, p0}, Ll/mh3;->c(Ljava/lang/Object;Ll/mh3;Ll/by3;Ll/n0f;)V

    return-void
.end method
